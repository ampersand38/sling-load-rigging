#include "ACE_Actions.sqf"
#include "CBA_Keybinds.sqf"

["amp_slingload_localise", {
    params ["_heli", "_cargo"];
    private _heliOwner = owner _heli;
    if (_heliOwner != owner _cargo) then {
        _cargo setOwner _heliOwner;
    };
}] call CBA_fnc_addEventHandler;

["Helicopter", "RopeAttach", {
    params ["_heli", "", "_cargo"];
    ["amp_slingload_localise", [_heli, _cargo]] call CBA_fnc_serverEvent;
}, true] call CBA_fnc_addClassEventHandler;

["amp_slingload_apexFitting", "RopeBreak", {
    params ["_apexFitting"];
    private _ropes = ropes _apexFitting;
    if (_ropes isEqualTo []) then { deleteVehicle _apexFitting; };
}, true] call CBA_fnc_addClassEventHandler;

["amp_slingload_apexFitting", "Killed", {
    params ["_apexFitting"];
    deleteVehicle _apexFitting;
}, true] call CBA_fnc_addClassEventHandler;

["amp_slingload_apexFitting", "Deleted", {
    params ["_apexFitting"];

    private _cargo = _apexFitting getVariable ["amp_slingload_cargo4Fitting", objNull];
    if !(isNull _cargo) then {
        _cargo setVariable ["amp_slingload_fitting4Cargo", objNull, true];
        _cargo setVariable ["amp_slingload_ropes4Cargo", [], true];
    };
}, true] call CBA_fnc_addClassEventHandler;
