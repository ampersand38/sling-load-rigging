#include "script_component.hpp"
/*
 * Author: Ampersand
 * Rig cargo with hooks, ropes, and fitting. Have player ACE carry fitting.
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Example:
 * [_cargo, _unit] call amp_slingload_fnc_rigCargo
 * [cursorObject, player] call compile preprocessFileLineNumbers '\z\amp\addons\slingload\functions\fnc_rigCargo.sqf'
 */

params ["_cargo", "_player"];

_liftPoints = [_cargo] call amp_slingload_fnc_getCargoLiftPoints;
if (_liftPoints isEqualTo []) exitWith {hint "Use Manual Rig"; false};

_apexFitting = "amp_slingload_apexFitting" createVehicle [0,0,0];
_apexFitting allowDamage false;
//_apexFitting disableCollisionWith _cargo;
//_apexFitting disableCollisionWith _player;
_apexFitting setPos (_player getPos [0.5, getDir _player]);

private _ropes = _cargo getVariable ["amp_slingload_ropes4Cargo", []];
{
    private _rope = ropeCreate [_apexFitting, [0,0,0], _cargo, _x, 10, ["", [0,0,-1]], ["RopeEnd", [0,0,-1]]];
    //_rope disableCollisionWith _player;
    //_rope disableCollisionWith _cargo;
    _ropes pushBack _rope;
} forEach _liftPoints;

_apexFitting setVariable ["ace_dragging_carryPosition", [0, 0.5, 1], true];
_apexFitting setVariable ["amp_slingload_cargo4Fitting", _cargo, true];
_cargo setVariable ["amp_slingload_fitting4Cargo", _apexFitting, true];
_cargo setVariable ["amp_slingload_ropes4Cargo", _ropes, true];

[{
    [_this, ACE_player] call amp_slingload_fnc_pickUpFitting;
}, _apexFitting, 0.1] call CBA_fnc_waitAndExecute;
