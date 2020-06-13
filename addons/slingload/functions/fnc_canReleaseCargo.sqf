#include "script_component.hpp"
/*
 * Author: Ampersand
 * check if unit can release hooked cargo on a hook / all hooks
 *
 * Arguments:
 * 0: Heli <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Example:
 * [_heli, _unit] call amp_slingload_fnc_canReleaseCargo
 */

params ["_heli", "_player", ["_cargoHookName", ""]];

if (toLower _cargoHookName in CARGOHOOKNAMES) exitWith {
    count (_heli getVariable ["amp_slingload_cargoHook" + _cargoHookName, []]) > 0
};

count (_heli getVariable ["amp_slingload_cargoHookMain", []]) > 0 || {
    count (_heli getVariable ["amp_slingload_cargoHookForward", []]) > 0 || {
        count (_heli getVariable ["amp_slingload_cargoHookAft", []]) > 0
    }
}
