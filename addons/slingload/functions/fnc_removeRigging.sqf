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
 * [_cargo, _unit] call slr_slingload_fnc_removeRigging
 */

params ["_cargo", "_player"];

private _ropes = _cargo getVariable ["slr_slingload_ropes4Cargo", []];

private _apexFitting = ropeAttachedTo _cargo;
_ropes apply {ropeDestroy _x};
if (_apexFitting isKindOf "slr_slingload_apexFitting") then {
    deleteVehicle _apexFitting;
};
if (_apexFitting isKindOf "Air") then {
    private _pendants = (attachedObjects _apexFitting) select {_x isKindOf "slr_slingload_apexFitting"};
    _pendants apply {deleteVehicle _x};
};
private _wreckDummy = _cargo getVariable [QGVAR(wreckDummy), objNull];
if !(isNull _wreckDummy) then {
    detach _cargo;
    [_wreckDummy, _unit] call FUNC(removeRigging);
    deleteVehicle _wreckDummy;
    _cargo setVariable [QGVAR(wreckDummy), objNull, true];
};

_cargo setVariable ["slr_slingload_liftPoints", [], true];
_cargo setVariable ["slr_slingload_ropes4Cargo", [], true];

true
