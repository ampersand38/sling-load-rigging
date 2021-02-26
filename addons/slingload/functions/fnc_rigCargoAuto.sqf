#include "script_component.hpp"
/*
 * Author: Ampersand
 * Rig cargo with hooks, ropes, and fitting. Have player ACE carry fitting.
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Exslrle:
 * [_cargo, _unit] call FUNC(rigCargo)Auto
 * [cursorObject, player] call compile preprocessFileLineNumbers '\z\slr\addons\slingload\functions\fnc_rigCargoAuto.sqf'
 */

params ["_cargo", "_unit"];

private _liftPoints = (getArray (configFile >> "CfgVehicles" >> typeOf _cargo >> "slingLoadCargoMemoryPoints")) apply {_cargo selectionPosition _x};

[_cargo, _unit, _liftPoints] call FUNC(rigCargo);
