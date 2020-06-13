#include "script_component.hpp"
/*
 * Author: Ampersand
 * unit drop apex fitting, attach to helicopter
 *
 * Arguments:
 * 0: Heli <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Example:
 * [_hook, _unit] call amp_slingload_fnc_attachCargo
 */

params ["_heli", "_player", ["_cargoHookPosition", []]];

private _apexFitting = _player getVariable ["ace_dragging_carriedObject", objNull];
if (isNull _apexFitting) exitWith {false};
private _cargo = _apexFitting getVariable ["amp_slingload_cargo4Helper", objNull];
if (isNull _cargo) exitWith {false};

_apexFitting removeEventHandler ["RopeBreak", _apexFitting getVariable ["amp_slingload_apexFittingEH", -1]];
ropes _apexFitting apply {ropeDestroy _x};
deleteVehicle _apexFitting;

private _cargoHookName = "amp_slingload_cargoHookMain";
if (_cargoHookPosition isEqualTo []) then {
    _cargoHookPosition = _heli selectionPosition "slingload0";
} else {
    _cargoHookName = ["amp_slingload_cargoHookForward", "amp_slingload_cargoHookAft"] select (
        _cargoHookPosition # 1
        <
        (_heli selectionPosition "slingload0") # 1
    );
};

if (local _heli) then {
    [_heli, _cargoHookPosition, _cargoHookName, _cargo] call amp_slingload_fnc_attachCargoLocal;
} else {
    [_heli, _cargoHookPosition, _cargoHookName, _cargo] RemoteExecCall ["amp_slingload_fnc_attachCargoLocal", _heli];
};

true
