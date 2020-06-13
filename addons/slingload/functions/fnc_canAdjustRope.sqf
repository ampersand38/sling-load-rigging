#include "script_component.hpp"
/*
 * Author: Ampersand
 * check if unit is able to adjust the length of the rope for the hook
 *
 * Arguments:
 * 0: Hook <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Example:
 * [_hook, _unit] call amp_slingload_fnc_canAdjustRope
 */

params ["_hook", "_unit"];

!isNull (_hook getVariable ["amp_slingload_rope4Hook", objNull]);
