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
 * Exslrle:
 * [_heli, _unit] call slr_slingload_fnc_canReleaseCargo
 * [vehicle player, player] call slr_slingload_fnc_canReleaseCargo
 */

params ["_heli", "_unit", ["_cargoHookName", ""]];

// vehicle crew can access, passenger with cargo sling can access
if (
    ([_unit] call CBA_fnc_vehicleRole) isEqualTo "cargo" &&
    {!("slr_slingload_CargoSling" in (_unit call ace_common_fnc_uniqueItems))}
) exitWith {false};

if (toLower _cargoHookName in CARGOHOOKNAMES) exitWith {
    count (_heli getVariable ["slr_slingload_cargoHook" + _cargoHookName, []]) > 0
};

count (_heli getVariable ["slr_slingload_cargoHookMain", []]) > 0 || {
    count (_heli getVariable ["slr_slingload_cargoHookForward", []]) > 0 || {
        count (_heli getVariable ["slr_slingload_cargoHookAft", []]) > 0
    }
}
