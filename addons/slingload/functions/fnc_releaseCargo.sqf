#include "script_component.hpp"
/*
 * Author: Ampersand
 * release hooked cargo on a hook / all hooks
 *
 * Arguments:
 * 0: Heli <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Exslrle:
 * [_heli, "main"] call slr_slingload_fnc_releaseCargo
 */

params ["_heli", ["_cargoHookName", ""]];

private _hooksToRelease = [CARGOHOOKNAMES, [_cargoHookName]] select (toLower _cargoHookName in CARGOHOOKNAMES);

{
    {
        ropeDestroy _x
    } forEach (_heli getVariable ["slr_slingload_cargoHook" + _x, []]);
    _heli setVariable ["slr_slingload_cargoHook" + _x, [], true];
} forEach _hooksToRelease;
