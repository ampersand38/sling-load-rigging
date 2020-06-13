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
