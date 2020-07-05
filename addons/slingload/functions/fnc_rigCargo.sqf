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
 * Example:
 * [_cargo, _unit] call amp_slingload_fnc_rigCargo
 * [cursorObject, player] call amp_slingload_fnc_rigCargo
 * [cursorObject, player] call compile preprocessFileLineNumbers '\z\amp\addons\slingload\functions\fnc_rigCargo.sqf'
 */

params ["_cargo", "_unit", ["_liftPoints", [], [[]]]];

if (_liftPoints isEqualTo []) then {
    _liftPoints = _cargo getVariable ["amp_slingload_liftPoints", []];
};
if (_liftPoints isEqualTo []) then {
    _liftPoints = [_cargo] call amp_slingload_fnc_getCargoLiftPoints;
};
if (_liftPoints isEqualTo []) exitWith {hint "Use Manual Rig"; false};

_apexFitting = createVehicle ["amp_slingload_apexFitting", _cargo modelToWorldVisual (boundingBoxReal _cargo # 1), [], 0, "CAN_COLLIDE"];
_apexFitting allowDamage false;
_apexFitting disableCollisionWith _cargo;
_apexFitting disableCollisionWith _unit;

private _ropeLength = sizeOf typeOf _cargo;
private _ropes = [];
{
    private _rope = ropeCreate [_apexFitting, [0,0,0], _cargo, _x, _ropeLength, ["", [0,0,-1]], ["RopeEnd", [0,0,-1]]];
    _rope setVariable ["amp_slingload_point4Rope", _x, true];
    _rope setVariable ["amp_slingload_ropeLength", _ropeLength, true];
    //_rope disableCollisionWith _unit;
    //_rope disableCollisionWith _cargo;
    {
        _rope disableCollisionWith _x;
    } forEach _ropes;
    _ropes pushBack _rope;
} forEach _liftPoints;

_apexFitting setVariable ["ace_dragging_carryPosition", [0, 0.5, 1], true];
_apexFitting setVariable ["amp_slingload_cargo4Fitting", _cargo, true];
_apexFitting setVariable ["amp_slingload_points4Fitting", _liftPoints, true];

_ropes = _ropes + (_cargo getVariable ["amp_slingload_ropes4Cargo", []]) - [objNull];
_cargo setVariable ["amp_slingload_ropes4Cargo", _ropes - [objNull], true];

[{
    [_this, ACE_Player] call amp_slingload_fnc_pickUpFitting;
}, _apexFitting, 0.1] call CBA_fnc_waitAndExecute;
