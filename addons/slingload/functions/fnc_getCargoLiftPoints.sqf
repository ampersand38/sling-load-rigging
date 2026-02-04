#include "script_component.hpp"
/*
 * Author: Ampersand
 * Get lift points for cargo
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Example:
 * [_cargo] call slr_slingload_fnc_getCargoLiftPoints
 */

params ["_cargo"];

// vanilla config
(getArray (configOf _cargo >> "slingLoadCargoMemoryPoints")) apply {_cargo selectionPosition _x};
