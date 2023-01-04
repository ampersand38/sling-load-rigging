#include "script_component.hpp"
/*
 * Author: Ampersand
 * Attach the lift points connected to the held fitting to the specified hook on the helicopter
 *
 * Arguments:
 * 0: Heli <OBJECT>
 * 1: Unit <OBJECT>
 * 1: Cargo Hook Position <ARRAY> <OPTIONAL>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Exslrle:
 * [_heli, _unit] call slr_slingload_fnc_attachCargo
 * [cursorObject, player, (cursorObject selectionPosition "slingload0") vectorAdd [0,-3,0]] call slr_slingload_fnc_attachCargo
 */

params ["_heli", "_unit", ["_cargoHookIndex", 0]];

private _apexFitting = _unit getVariable ["slr_slingload_heldFitting", objNull];
if (isNull _apexFitting) exitWith {false};
private _cargo = _apexFitting getVariable ["slr_slingload_cargo4Fitting", objNull];
if (isNull _cargo) exitWith {false};
private _cargoWreck = _cargo getVariable [QGVAR(wreckDummy), objNull];
if !(isNull _cargoWreck) then {
    _cargo = _cargoWreck;
};
private _ropes4Cargo = _cargo getVariable ["slr_slingload_ropes4Cargo", []];

private _lengths = [];
{
    _lengths pushBack (_x getVariable ["slr_slingload_ropeLength", 10]);
    ropeDestroy _x;
} forEach ropes _apexFitting;
_ropes4Cargo = _ropes4Cargo - [objNull];

private _liftPoints = _apexFitting getVariable ["slr_slingload_points4Fitting", []];

_apexFitting setVariable ["slr_slingload_cargo4Fitting", objNull, true];
deleteVehicle _apexFitting;

private _cargoHookName = [
    "slr_slingload_cargoHookMain",
    "slr_slingload_cargoHookForward",
    "slr_slingload_cargoHookAft"
] select _cargoHookIndex;

private _heliModel = getText (configOf _heli >> "model");
private _cargoHookPosition = if (_heliModel in slr_customHooks) then {
    private _customHooksInfo = slr_customHooks get _heliModel;
    _customHooksInfo select _cargoHookIndex
} else {
    _heli selectionPosition "slingload0"
};

private _ropes4Hook = _heli getVariable [_cargoHookName, []];
{
    private _rope = ropeCreate [_heli, _cargoHookPosition, _cargo, _x, _lengths select _forEachIndex, ["", [0,0,-1]], ["RopeEnd", [0,0,-11]]];
    _rope setVariable ["slr_slingload_point4Rope", _x, true];
    _ropes4Hook pushBack _rope;
    _ropes4Cargo pushBack _rope;
} forEach _liftPoints;

_heli setVariable [_cargoHookName, _ropes4Hook - [objNull], true];
_cargo setVariable ["slr_slingload_ropes4Cargo", _ropes4Cargo - [objNull], true];

["slr_slingload_localise", [_heli]] call CBA_fnc_serverEvent;

true
