#include "script_component.hpp"
/*
Author: Ampers
Moves player out of vehicle at get-in memory point closest to where they are looking.

* Arguments:
* -
*
* Return Value:
* Exit position (vehicle model space) <ARRAY>

* Example:
* [] call dtv_fnc_dismount
* [] execVM "fnc_dismount.sqf"
*/

params ["_cargo", "_player"];

!(_cargo getVariable ["amp_slingload_isRiggedCargo", false])

