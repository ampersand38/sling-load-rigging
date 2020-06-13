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
 */
//amp_slingload_fnc_rigCargo = {
params ["_cargo", "_player"];
_apexFitting = "amp_slingload_apexFitting" createVehicle [0,0,0];
_apexFitting allowDamage false;
_apexFitting disableCollisionWith _cargo;
_apexFitting disableCollisionWith _player;
_apexFitting setPos (_player getPos [0.5, getDir _player]);

private _id = _apexFitting addEventHandler ["RopeBreak", {
    params ["_apexFitting", "", ""];
    private _ropes = ropes _apexFitting;
    if (_ropes isEqualTo []) then {
        deleteVehicle _apexFitting;
/*
        _cargo setVariable ["amp_slingload_apexFitting4Cargo", objNull, true];
        //_cargo setVariable ["amp_slingload_ropes4Cargo", _ropes, true];
        (_cargo getVariable ["amp_slingload_hooks4Cargo", []]) apply {deleteVehicle _x};
        _cargo setVariable ["amp_slingload_hooks4Cargo", [], true];
*/
    };
}];
_apexFitting setVariable ["amp_slingload_apexFittingEH", _id, true];

_liftPoints = [_cargo] call amp_slingload_fnc_getCargoLiftPoints;
//_liftPoints = [_cargo] call ASL_Get_Corner_Points;
private _ropes = [];
//private _hooks = [];
{
    private _rope = ropeCreate [_apexFitting, [0,0,0], _cargo, _x, 10, ["", [0,0,-1]], ["RopeEnd", [0,0,-1]]];
    //_rope disableCollisionWith _player;
    //_rope disableCollisionWith _cargo;
    _ropes pushBack _rope;
    //private _hook = "amp_slingload_hook" createVehicle [0,0,0];
    //_rope setVariable ["amp_slingload_hook4Rope", _hook, true];
    //_hook setVariable ["amp_slingload_rope4Hook", _rope, true];
    //_hook attachTo [_cargo, _x];
    //_hook setDir ((_hook getDir _cargo) - 90);
    //_hooks pushBack _hook;
} forEach _liftPoints;

[{
    [ACE_Player, _this] call ace_dragging_fnc_carryObject;
}, _apexFitting, 0.1] call CBA_fnc_waitAndExecute;

_apexFitting setVariable ["ace_dragging_carryPosition", [0, 0.5, 1], true];
_apexFitting setVariable ["amp_slingload_cargo4Helper", _cargo, true];
_cargo setVariable ["amp_slingload_ropes4Cargo", _ropes, true];
//_cargo setVariable ["amp_slingload_hooks4Cargo", _hooks, true];
