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
 * [_cargo, _unit] call amp_slingload_fnc_removeRigging
 */

params ["_cargo", "_player"];

private _ropes = _cargo getVariable ["amp_slingload_ropes4Cargo", []];

private _apexFitting = ropeAttachedTo _cargo;
_ropes apply {ropeDestroy _x};
if (_apexFitting isKindOf "amp_slingload_apexFitting") then {
    deleteVehicle _apexFitting;
};

_cargo setVariable ["amp_slingload_ropes4Cargo", [], true];

true
