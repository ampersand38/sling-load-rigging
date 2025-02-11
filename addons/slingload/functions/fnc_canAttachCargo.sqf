#include "script_component.hpp"
/*
 * Author: Ampersand
 * Check if unit is able to attach cargo to the lifter
 *
 * Arguments:
 * 0: Heli <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Example:
 * [_heli, _unit] call slr_slingload_fnc_canAttachCargo
 * [cursorObject, ACE_player] call slr_slingload_fnc_canAttachCargo
 */

params ["_heli", "_player"];

if (typeOf _heli isEqualTo "slr_slingload_apexFitting") exitWith { false };

private _apexFitting = _player getVariable ["slr_slingload_heldFitting", objNull];
private _cargo = _apexFitting getVariable ["slr_slingload_cargo4Fitting", objNull];

_cargo isNotEqualTo _heli;
&& {!isNull _cargo}
&& {!isNull _apexFitting}
&& {
    private _cfg = configOf _heli;
    getText (_cfg >> "model") in slr_customHooks
    || {getNumber (_cfg >> "slingLoadMaxCargoMass") > 0}
}
