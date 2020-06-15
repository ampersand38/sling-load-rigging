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
 * Example:
 * [_hook, _unit] call amp_slingload_fnc_canAttachCargo
 */
//amp_slingload_fnc_canAttachCargo={
params ["_heli", "_player"];

!isNull (_player getVariable ["amp_slingload_heldFitting", objNull])
&& {getNumber (configFile >> "CfgVehicles" >> typeOf _heli >> "slingLoadMaxCargoMass") > 0}

