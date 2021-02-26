#include "script_component.hpp"
/*
 * Author: Ampersand
 * Let the player change the length of the currently rigged ropes
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Unit <OBJECT>
 * 2: Adjust all legs or single <BOOLEAN>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Exslrle:
 * [_cargo, _unit] call slr_slingload_fnc_adjustRigging
 * [cursorObject, player] call slr_slingload_fnc_adjustRigging
 */

params ["_cargo", "_unit", "_all"];

[_unit, "blockThrow", "slr_slingload_rigCargoManual", true] call ace_common_fnc_statusEffect_set;

//Show mouse buttons:
[localize "STR_ACE_Tripod_Done", "", localize LSTRING(LengthenShorten)] call ace_interaction_fnc_showMouseHint;
_unit setVariable ["slr_slingload_adjustRiggingEH", [_unit, "DefaultAction", {true}, {GVAR(pfeh_action) = RIG_ADD}] call ace_common_fnc_AddActionEventHandler];

GVAR(pfeh_running) = true;
GVAR(pfeh_action) = RIG_WAITING;

private _sphere = objNull;
if _all then {
    _unit setVariable ["slr_slingload_ropesBeingAdjusted", _cargo getVariable ["slr_slingload_ropes4Cargo", []]];
} else {
    _sphere = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
    _sphere hideObject true;
};

[{
    params ["_args", "_pfID"];
    _args params ["_cargo", "_unit", "_sphere"];

    if (ACE_interact_menu_openedMenuType > -1) then {
        GVAR(pfeh_action) = RIG_ADD;
    };

    if (GVAR(pfeh_action) != RIG_WAITING) then {
        if (GVAR(pfeh_action) >= RIG_UP && {!isNull _sphere}) then {
            // find which rope the player is looking at
            private _checkPos = _cargo worldToModelVisual (ASLToAGL eyePos _unit);
            //_sphere attachTo [_cargo, _checkPos];
            private _liftPoints = (_cargo getVariable ["slr_slingload_liftPoints", []]) + ([_cargo] call slr_slingload_fnc_getCargoLiftPoints);
            private _bestDistance = 2;
            private _liftPoint = [];
            {
                private _distance = _checkPos distance _x;
                if (_distance < _bestDistance) then {
                    _bestDistance = _distance;
                    _liftPoint = _x;
                };
            } forEach _liftPoints;
            if !(_liftPoint isEqualTo []) then {
                private _ropes = (_cargo getVariable ["slr_slingload_ropes4Cargo", []])  select {(_x getVariable ["slr_slingload_point4Rope", []]) isEqualTo _liftPoint};
                if !(_ropes isEqualTo []) then {
                    _sphere attachTo [_cargo, _liftPoint];
                    _sphere hideObject false;
                    _unit setVariable ["slr_slingload_ropesBeingAdjusted", _ropes];
                };
            } else {
                _unit setVariable ["slr_slingload_ropesBeingAdjusted", []];
                _sphere hideObject true;
                hintSilent "";
            };
            GVAR(pfeh_action) = RIG_WAITING;
        };
        if (GVAR(pfeh_action) == RIG_ADD) then {
            // clean up
            [_pfID] call CBA_fnc_removePerFrameHandler;
            GVAR(pfeh_running) = false;
            hintSilent "";

            [_unit, "blockThrow", "slr_slingload_rigCargoManual", false] call ace_common_fnc_statusEffect_set;
            [] call ace_interaction_fnc_hideMouseHint;
            [_unit, "DefaultAction", (_unit getVariable ["slr_slingload_adjustRiggingEH", -1])] call ace_common_fnc_removeActionEventHandler;
            _unit setVariable ["slr_slingload_adjustRiggingEH", -1];
            _unit setVariable ["slr_slingload_ropesBeingAdjusted", []];

            deleteVehicle _sphere;
        };
    };
}, 0, [_cargo, _unit, _sphere]] call CBA_fnc_addPerFrameHandler;
