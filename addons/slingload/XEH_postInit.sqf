#include "script_component.hpp"

#include "ACE_Actions.sqf"
#include "CBA_Keybinds.sqf"
#include "eventHandlers.sqf"

/*
addUserActionEventHandler ["HeliRopeAction", "Activate", {
    private _unit = ACE_player;
    private _heli = vehicle _unit;
    if ([_heli, _unit] call slr_slingload_fnc_canReleaseCargo) then {
        [_heli] call slr_slingload_fnc_releaseCargo;
    };
}];
*/

GVAR(pfeh_running) = false;
