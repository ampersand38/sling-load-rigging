#include "script_component.hpp"
/*
 * Author: Ampersand
 * Rig cargo with hooks, ropes, and fitting. Have player ACE carry fitting.
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Unit <OBJECT>
 * 2: Lift Points <ARRAY> <OPTIONAL>
 *     Array of model space positions
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Exslrle:
 * [_cargo, _unit] call slr_slingload_fnc_rigCargo
 * [cursorObject, player] call slr_slingload_fnc_rigCargo
 */

params ["_cargo", "_unit", ["_liftPoints", [], [[]]]];

if (_liftPoints isEqualTo []) then {
    _liftPoints = _cargo getVariable ["slr_slingload_liftPoints", []];
};
if (_liftPoints isEqualTo []) then {
    _liftPoints = [_cargo] call slr_slingload_fnc_getCargoLiftPoints;
};
if (_liftPoints isEqualTo []) exitWith {hint "Use Manual Rig"; false};

// Wrecks
if (damage _cargo == 1) then {
    private _helper = createVehicle ["slr_slingload_wreckDummy", [0,0,0], [], 0, "CAN_COLLIDE"];
    _helper allowDamage false;
    _helper disableCollisionWith _cargo;
    _helper setDir getDir _cargo;
    private _pos = _cargo modelToWorld (getCenterOfMass _cargo);
    _pos set [2, 0];
    _helper setPos _pos;
    _cargo attachTo [_helper];
    _helper setMass getMass _cargo;
    _cargo setVariable [QGVAR(wreckDummy), _helper, true];
    _cargo = _helper;
};

_apexFitting = createVehicle ["slr_slingload_apexFitting", _cargo modelToWorldVisual (boundingBoxReal _cargo # 1), [], 0, "CAN_COLLIDE"];
_apexFitting allowDamage false;
_apexFitting disableCollisionWith _cargo;
_apexFitting disableCollisionWith _unit;

private _ropeLength = 10 max (sizeOf typeOf _cargo);
private _ropes = [];
{
    private _rope = ropeCreate [_apexFitting, [0,0,0], _cargo, _x, _ropeLength, ["", [0,0,-1]], ["RopeEnd", [0,0,-1]]];
    _rope setVariable ["slr_slingload_point4Rope", _x, true];
    _rope setVariable ["slr_slingload_ropeLength", _ropeLength, true];
    //_rope disableCollisionWith _unit;
    //_rope disableCollisionWith _cargo;
    {
        _rope disableCollisionWith _x;
    } forEach _ropes;
    _ropes pushBack _rope;
} forEach _liftPoints;

_apexFitting setVariable ["ace_dragging_carryPosition", [0, 0.5, 1], true];
_apexFitting setVariable ["slr_slingload_cargo4Fitting", _cargo, true];
_apexFitting setVariable ["slr_slingload_points4Fitting", _liftPoints, true];

_ropes = _ropes + (_cargo getVariable ["slr_slingload_ropes4Cargo", []]) - [objNull];
_cargo setVariable ["slr_slingload_ropes4Cargo", _ropes - [objNull], true];

[{
    [_this, ACE_Player] call slr_slingload_fnc_pickUpFitting;
}, _apexFitting, 0.1] call CBA_fnc_waitAndExecute;
