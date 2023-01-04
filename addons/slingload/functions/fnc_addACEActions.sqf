#include "script_component.hpp"
/*
 * Author: Ampersand
 * Add to given helicopter ACE actions for attaching and detaching cargo. Run on vehicle init.
 *
 * Arguments:
 * 0: Heli <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Exslrle:
 * [_heli] call slr_slingload_fnc_addACEActions
 */

params ["_heli"];

private _action = [];
private _displayName = localize LSTRING(AttachCargo);
private _icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
private _statement = slr_slingload_fnc_attachCargo;
private _condition = slr_slingload_fnc_canAttachCargo;
private _position = [];
private _distance = 3.5;

if ("slingload0" in (_heli selectionNames "MEMORY")) then {
    _position = _heli selectionPosition "slingload0";
    _action = ["slr_slingload_attachCargo0", _displayName, _icon, _statement, _condition, {}, CARGOHOOKINDEX_MAIN, _position, _distance] call ace_interact_menu_fnc_createAction;
    [_heli, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;
};

private _heliModel = getText (configOf _heli >> "model");
if !(_heliModel in slr_customHooks) exitWith { true };
private _customHooksInfo = slr_customHooks get _heliModel;

// Custom hook info
//["model.p3d",[main, forward, aft]],
{
    private _position = if (_x isNotEqualTo []) then {
        _action = [format ["slr_slingload_attachCargo%1", _forEachIndex], _displayName, _icon, _statement, _condition, {}, _forEachIndex, _x, _distance] call ace_interact_menu_fnc_createAction;
        [_heli, 0, [], _action] call ace_interact_menu_fnc_addActionToObject;
    };
} forEach _customHooksInfo;

true
