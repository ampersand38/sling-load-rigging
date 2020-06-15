#include "script_component.hpp"
/*
 * Author: Ampersand
 * check if unit is able to rig cargo for sling load
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Example:
 * [_cargo, _unit] call amp_slingload_fnc_canRigCargoAuto
 * [(curatorSelected # 0 # 0), player] call amp_slingload_fnc_canRigCargoAuto
 */

params ["_cargo", "_unit"];

if !("amp_slingload_CargoSling" in (_unit call ace_common_fnc_uniqueItems)) exitWith {false};

if ((typeOf _cargo) isEqualTo "amp_slingload_apexFitting") exitWith {false};
if amp_slingload_pfeh_running exitWith {false};

!(getArray (configFile >> "CfgVehicles" >> typeOf _cargo >> "slingLoadCargoMemoryPoints") isEqualTo [])
