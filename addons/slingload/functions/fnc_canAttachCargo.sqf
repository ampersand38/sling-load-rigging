#include "script_component.hpp"
/*
 * Author: Ampersand
 * check if unit is able to adjust the length of the rope for the hook
 *
 * Arguments:
 * 0: Heli <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Exslrle:
 * [_hook, _unit] call slr_slingload_fnc_canAttachCargo
 */
//slr_slingload_fnc_canAttachCargo={
params ["_heli", "_player"];

if (typeOf _heli isEqualTo "slr_slingload_apexFitting") exitWith { false };

!isNull (_player getVariable ["slr_slingload_heldFitting", objNull])
&& {getNumber (configFile >> "CfgVehicles" >> typeOf _heli >> "slingLoadMaxCargoMass") > 0}

