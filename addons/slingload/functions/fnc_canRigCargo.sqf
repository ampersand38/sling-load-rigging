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
 * [_cargo, _unit] call amp_slingload_fnc_canRigCargo
 */
//amp_slingload_fnc_canRigCargo = {
params ["_cargo", "_unit"];

if !("amp_slingload_CargoSling" in (_unit call ace_common_fnc_uniqueItems)) exitWith {false};

if (_cargo getVariable ["amp_slingload_isRiggingEnabled", false]) exitWith {true};
if !(getArray (configFile >> "CfgVehicles" >> typeOf _cargo >> "slingLoadCargoMemoryPoints") isEqualTo []) exitWith {true};

_cargo isKindOf "LandVehicle" || {_cargo isKindOf "Air" || {_cargo isKindOf "Ship"}}
