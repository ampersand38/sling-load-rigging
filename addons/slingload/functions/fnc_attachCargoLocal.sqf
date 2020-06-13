#include "script_component.hpp"
/*
 * Author: Ampersand
 * Attach cargo to given hook position and make cargo local
 *
 * Arguments:
 * 0: Heli <OBJECT>
 * 1: Cargo Hook Position <ARRAY>
 * 2: Cargo Hook Name <STRING>
 * 3: Cargo <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Example:
 * [_heli, _cargoHookPosition, _cargoHookName, _cargo] call amp_slingload_fnc_attachCargoLocal
 * [_heli, (_heli selectionPosition "slingload0") vectorAdd [0,3,0], "amp_slingload_cargoHookForward", _cargo] call amp_slingload_fnc_attachCargoLocal
 */

params ["_heli", "_cargoHookPosition", "_cargoHookName", "_cargo"];

["amp_slingload_localise", [_heli, _cargo]] call CBA_fnc_serverEvent;

private _ropes = _heli getVariable [_cargoHookName, []];
private _liftPoints = [_cargo] call amp_slingload_fnc_getCargoLiftPoints;
{
    private _rope = ropeCreate [_heli, _cargoHookPosition, _cargo, _x, 10, ["", [0,0,-1]], ["RopeEnd", [0,0,-11]]];
    _ropes pushBack _rope;
} forEach _liftPoints;

_heli setVariable [_cargoHookName, _ropes, true];

true
