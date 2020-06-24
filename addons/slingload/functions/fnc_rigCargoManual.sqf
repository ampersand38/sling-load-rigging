#include "script_component.hpp"
/*
Author: Ampersand


* Arguments:
* -
*
* Return Value:
* Exit position vehicle model space <ARRAY>

* Example:
* [cursorObject, ACE_Player] call amp_slingload_fnc_rigCargoManual
*/

params ["_cargo", "_unit"];

[_unit, "blockThrow", "amp_slingload_rigCargoManual", true] call ace_common_fnc_statusEffect_set;

//Show mouse buttons:
[localize LSTRING(AddLiftPoint), localize "STR_ACE_Common_Cancel", localize "STR_ACE_Tripod_Done"] call ace_interaction_fnc_showMouseHint;
_unit setVariable ["amp_slingload_addLiftPointEH", [_unit, "DefaultAction", {true}, {amp_slingload_pfeh_action = RIG_ADD}] call ace_common_fnc_AddActionEventHandler];

amp_slingload_pfeh_running = true;
amp_slingload_pfeh_action = RIG_WAITING;
amp_slingload_rigCargoHelpers = [];

private _hook = "amp_slingload_hook" createVehicleLocal [0,0,0];

// rig lift points
[{
    params ["_args", "_pfID"];
    _args params ["_cargo", "_unit", "_hook"];

    if (ACE_interact_menu_openedMenuType > -1) then {
        amp_slingload_pfeh_action = RIG_CANCEL;
    };

    if (amp_slingload_pfeh_action < RIG_CANCEL) then {
        if (amp_slingload_pfeh_action == RIG_ADD) then {
            private _hookShow = "amp_slingload_hook" createVehicleLocal [0,0,0];
            _hookShow setPos getPos _hook;
            _hookShow setDir (_hook getDir _cargo) - 90;
            amp_slingload_rigCargoHelpers pushBack _hookShow;
        };
        // position helper
        private _basePosASL = eyePos _unit;
        private _lookDirVector = ([positionCameraToWorld [0,0,0], positionCameraToWorld [-0.3,0,0]] select (cameraView == "EXTERNAL")) vectorFromTo (positionCameraToWorld [0,-0.25,1]);

        private _intersections = lineIntersectsSurfaces [_basePosASL, _basePosASL vectorAdd _lookDirVector, _unit];
        if (_intersections isEqualTo []) then {
            _hook setPosASL (_basePosASL vectorAdd _lookDirVector);
            _hook setDir (_hook getDir _cargo) - 90;
        } else {
            (_intersections # 0) params ["_intersectPosASL", "", "_intersectObject"];
            _hook setPosASL ([[0,0,0], _intersectPosASL] select (_intersectObject == _cargo));
            _hook setDir (_hook getDir _cargo) - 90;
        };
        amp_slingload_pfeh_action = RIG_WAITING;
    } else {
        [_pfID] call CBA_fnc_removePerFrameHandler;
        amp_slingload_pfeh_running = false;

        ace_common_fnc_statusEffect_set;
        [_unit, "blockThrow", "amp_slingload_rigCargoManual", false] call ace_common_fnc_statusEffect_set;
        [] call ace_interaction_fnc_hideMouseHint;
        [_unit, "DefaultAction", (_unit getVariable ["amp_slingload_addLiftPointEH", -1])] call ace_common_fnc_removeActionEventHandler;
        _unit setVariable ["amp_slingload_addLiftPointEH", -1];

        deleteVehicle _hook;
        //if (amp_slingload_pfeh_action == RIG_CANCEL) then {};
        if (amp_slingload_pfeh_action > RIG_CANCEL && {count amp_slingload_rigCargoHelpers > 0}) then {
            private _liftPoints = amp_slingload_rigCargoHelpers apply {(_cargo worldToModelVisual getPos _x) vectorAdd [0,0,0.2]; };
            [_cargo, _unit, _liftPoints] call amp_slingload_fnc_rigCargo;
            _liftPoints = _liftPoints + (_cargo getVariable ["amp_slingload_liftPoints", []]);
            _cargo setVariable ["amp_slingload_liftPoints", _liftPoints, true];
        };
        {deleteVehicle _x} forEach amp_slingload_rigCargoHelpers;
        amp_slingload_rigCargoHelpers = [];
    };
}, 0, [_cargo, _unit, _hook]] call CBA_fnc_addPerFrameHandler;
