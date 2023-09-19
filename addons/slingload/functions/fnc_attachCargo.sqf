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
 * Example:
 * [_heli, _unit] call slr_slingload_fnc_attachCargo
 * [cursorObject, player, (cursorObject selectionPosition "slingload0") vectorAdd [0,-3,0]] call slr_slingload_fnc_attachCargo
 */

params ["_heli", "_unit", ["_cargoHookIndex", 0]];

private _apexFitting = _unit getVariable ["slr_slingload_heldFitting", objNull];
_unit setVariable ["slr_slingload_heldFitting", objNull, true];
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
    private _heliType = typeOf _heli;
    if (_heliType in slr_customHooks) then {
        private _customHooksInfo = slr_customHooks get _heliType;
        _customHooksInfo select _cargoHookIndex
    } else {
        // No custom hooks
        private _slingLoadMemoryPoint = getText (configOf _heli >> "slingLoadMemoryPoint");
        _heli selectionPosition _slingLoadMemoryPoint
    }
};
if (slr_setting_usePendant) then {
    _cargoHookPosition = _cargoHookPosition vectorAdd [0, 0 ,-1.5];
};

private _ropes4Hook = _heli getVariable [_cargoHookName, []];
deleteVehicle _apexFitting;

if (slr_setting_usePendant) then {
    _apexFitting = createVehicle ["slr_slingload_apexFitting", [0, 0, 0], [], 0, "CAN_COLLIDE"];
    _apexFitting attachTo [_heli, _cargoHookPosition vectorAdd [0, 0, 0.75]],
    _apexFitting setVariable ["slr_slingload_cargo4Fitting", _cargo, true];
    _ropes4Hook pushBack _apexFitting;
};

{
    private _length = _lengths select _forEachIndex;
    private _rope = ropeCreate [
        _heli, _cargoHookPosition, _cargo, _x,
        _length,
        ["", [0,0,-1]],
        ["slr_RopeEnd", [0,0,1]], "slr_Rope"
    ];
    _rope setVariable ["slr_slingload_point4Rope", _x, true];
    _ropes4Hook pushBack _rope;
    _ropes4Cargo pushBack _rope;

    _liftPointsSum = _liftPointsSum vectorAdd _x;
    _lengthsSum = _lengthsSum + _length;
} forEach _liftPoints;

_heli setVariable [_cargoHookName, _ropes4Hook - [objNull], true];
_cargo setVariable ["slr_slingload_ropes4Cargo", _ropes4Cargo - [objNull], true];

["slr_slingload_localise", [_heli]] call CBA_fnc_serverEvent;

true
