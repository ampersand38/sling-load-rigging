#include "script_component.hpp"
/*
 * Author: Ampersand
 * check if unit can remove cargo rigging
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Exslrle:
 * [_cargo, _unit] call slr_slingload_fnc_canRemoveRigging
 */
//slr_slingload_fnc_canRigCargo = {
params ["_cargo", "_player"];

!isNull ropeAttachedTo _cargo || {
    !((_cargo getVariable ["slr_slingload_ropes4Cargo", []]) isEqualTo [])
}
|| {!isNull (_cargo getVariable [QGVAR(wreckDummy), objNull])}
