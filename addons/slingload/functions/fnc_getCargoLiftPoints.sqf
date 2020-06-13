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
 * [_cargo, _unit] call amp_slingload_fnc_getCargoLiftPoints
 */

params ["_cargo"];

private _liftPoints = [];

// manual rig
_liftPoints = _cargo getVariable ["amp_slingload_slingLoadCargoLiftPoints", []];

// custom config
if (_liftPoints isEqualTo []) then {
    _liftPoints = getArray (configFile >> "CfgVehicles" >> typeOf _cargo >> "amp_slingload_slingLoadCargoLiftPoints");
};

// vanilla config
if (_liftPoints isEqualTo []) then {
    _liftPoints = (getArray (configFile >> "CfgVehicles" >> typeOf _cargo >> "slingLoadCargoMemoryPoints")) apply {_cargo selectionPosition _x};
};

_liftPoints
