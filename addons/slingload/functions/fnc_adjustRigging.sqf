#include "script_component.hpp"
/*
 * Author: Ampersand
 * Let the player change the length of the currently rigged ropes
 *
 * Arguments:
 * 0: Cargo <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Example:
 * [_cargo, _unit] call amp_slingload_fnc_adjustRigging
 * [cursorObject, player] call amp_slingload_fnc_adjustRigging
 */

params ["_cargo", "_unit"];

[_unit, "blockThrow", "amp_slingload_rigCargoManual", true] call ace_common_fnc_statusEffect_set;

//Show mouse buttons:
["Done", "", "Lengthen/Shorten"] call ace_interaction_fnc_showMouseHint;
_unit setVariable ["amp_slingload_adjustRiggingEH", [_unit, "DefaultAction", {true}, {amp_slingload_pfeh_action = RIG_ADD}] call ace_common_fnc_AddActionEventHandler];

amp_slingload_pfeh_running = true;
amp_slingload_pfeh_action = RIG_WAITING;

private _sphere = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
_sphere hideObject true;

[{
    params ["_args", "_pfID"];
    _args params ["_cargo", "_unit", "_sphere"];

    if (ACE_interact_menu_openedMenuType > -1) then {
        amp_slingload_pfeh_action = RIG_ADD;
    };

    if (amp_slingload_pfeh_action != RIG_WAITING) then {
        if (amp_slingload_pfeh_action >= RIG_UP) then {
            // find which rope the player is looking at
            private _basePosASL = eyePos _unit;

            private _checkPos = _cargo worldToModelVisual (ASLToAGL _basePosASL);
            _sphere attachTo [_cargo, _checkPos];
            private _liftPoints = [_cargo] call amp_slingload_fnc_getCargoLiftPoints;
            private _bestDistance = 1;
            private _liftPointIndex = -1;
            {
                private _distance = _checkPos distance _x;
                if (_distance < _bestDistance) then {
                    _bestDistance = _distance;
                    _liftPointIndex = _forEachIndex;
                };
            } forEach _liftPoints;
            if (_liftPointIndex != -1) then {
                private _ropes = _cargo getVariable ["amp_slingload_ropes4Cargo", []];
                _sphere attachTo [_cargo, _liftPoints select _liftPointIndex];
                _sphere hideObject false;
                _unit setVariable ["amp_slingload_ropeBeingAdjusted", _ropes select _liftPointIndex];
            } else {
                _unit setVariable ["amp_slingload_ropeBeingAdjusted", objNull];
                _sphere hideObject true;
                hintSilent "";
            };
            amp_slingload_pfeh_action = RIG_WAITING;
        };
        if (amp_slingload_pfeh_action == RIG_ADD) then {
            // clean up
            [_pfID] call CBA_fnc_removePerFrameHandler;
            amp_slingload_pfeh_running = false;
            hintSilent "";

            [_unit, "blockThrow", "amp_slingload_rigCargoManual", false] call ace_common_fnc_statusEffect_set;
            [] call ace_interaction_fnc_hideMouseHint;
            [_unit, "DefaultAction", (_unit getVariable ["amp_slingload_adjustRiggingEH", -1])] call ace_common_fnc_removeActionEventHandler;
            _unit setVariable ["amp_slingload_adjustRiggingEH", -1];

            deleteVehicle _sphere;
        };
    };
}, 0, [_cargo, _unit, _sphere]] call CBA_fnc_addPerFrameHandler;
