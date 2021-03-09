#include "script_component.hpp"
/*
Author: Ampersand


* Arguments:
* -
*
* Return Value:
* Exit position vehicle model space <ARRAY>

* Exslrle:
* [cursorObject, ACE_Player] call FUNC(rigCargo)Manual
*/

params ["_cargo", "_unit"];

// Wrecks
if (damage _cargo == 1) then {
    private _wreckDummy = _cargo getVariable [QGVAR(wreckDummy), objNull];
    if !(isNull _wreckDummy) then {
        _cargo = _wreckDummy;
    } else {
        private _helper = createVehicle ["slr_slingload_wreckDummy", [0,0,0], [], 0, "CAN_COLLIDE"];
        _helper allowDamage false;
        _helper disableCollisionWith _cargo;
        _helper setDir getDir _cargo;
        private _pos = _cargo modelToWorld (getCenterOfMass _cargo);
        _pos set [2, 0];
        _helper setPos _pos;
        _cargo attachTo [_helper];
        _helper setMass getMass _cargo;
        _cargo setVariable [QGVAR(wreckDummy), _helper, true];
        _cargo = _helper;
    };
};

[_unit, "blockThrow", "slr_slingload_rigCargoManual", true] call ace_common_fnc_statusEffect_set;

//Show mouse buttons:
[localize LSTRING(AddLiftPoint), localize "STR_ACE_Common_Cancel", localize "STR_ACE_Tripod_Done"] call ace_interaction_fnc_showMouseHint;
_unit setVariable ["slr_slingload_addLiftPointEH", [_unit, "DefaultAction", {true}, {GVAR(pfeh_action) = RIG_ADD}] call ace_common_fnc_AddActionEventHandler];

GVAR(pfeh_running) = true;
GVAR(pfeh_action) = RIG_WAITING;
GVAR(rigCargoHelpers) = [];

private _hook = "slr_slingload_hook" createVehicleLocal [0,0,0];

// rig lift points
[{
    params ["_args", "_pfID"];
    _args params ["_cargo", "_unit", "_hook"];

    if (ACE_interact_menu_openedMenuType > -1) then {
        GVAR(pfeh_action) = RIG_CANCEL;
    };

    if (GVAR(pfeh_action) < RIG_CANCEL) then {
        if (GVAR(pfeh_action) == RIG_ADD) then {
            private _hookShow = "slr_slingload_hook" createVehicleLocal [0,0,0];
            _hookShow setPosASL getPosASL _hook;
            _hookShow setDir (_hook getDir _cargo) - 90;
            GVAR(rigCargoHelpers) pushBack _hookShow;
        };
        // position helper
        private _basePosASL = eyePos _unit;
        private _lookDirVector = ([positionCameraToWorld [0,0,0], positionCameraToWorld [-0.3,0,0]] select (cameraView == "EXTERNAL")) vectorFromTo (positionCameraToWorld [0,-0.25,1]);

        private _intersections = lineIntersectsSurfaces [_basePosASL, _basePosASL vectorAdd _lookDirVector, _unit];
        if (_intersections isEqualTo []) then {
            _hook setPosASL (_basePosASL vectorAdd _lookDirVector);
            _hook setDir (_hook getDir _cargo) - 90;
        } else {
            // Watching cargo
            (_intersections # 0) params ["_intersectPosASL", "", "_intersectObject"];
            _hook setPosASL ([[0,0,0], _intersectPosASL] select (_intersectObject == _cargo));
            _hook setDir (_hook getDir _cargo) - 90;
        };
        GVAR(pfeh_action) = RIG_WAITING;
    } else {
        [_pfID] call CBA_fnc_removePerFrameHandler;
        GVAR(pfeh_running) = false;

        [_unit, "blockThrow", "slr_slingload_rigCargoManual", false] call ace_common_fnc_statusEffect_set;
        [] call ace_interaction_fnc_hideMouseHint;
        [_unit, "DefaultAction", (_unit getVariable ["slr_slingload_addLiftPointEH", -1])] call ace_common_fnc_removeActionEventHandler;
        _unit setVariable ["slr_slingload_addLiftPointEH", -1];

        deleteVehicle _hook;
        //if (GVAR(pfeh_action) == RIG_CANCEL) then {};
        if (GVAR(pfeh_action) > RIG_CANCEL && {count GVAR(rigCargoHelpers) > 0}) then {
            private _liftPoints = GVAR(rigCargoHelpers) apply {(_cargo worldToModelVisual ASLToAGL getPosASL _x) vectorAdd [0,0,0.2]; };
            [_cargo, _unit, _liftPoints] call FUNC(rigCargo);
            _liftPoints = _liftPoints + (_cargo getVariable ["slr_slingload_liftPoints", []]);
            _cargo setVariable ["slr_slingload_liftPoints", _liftPoints, true];
        };
        {deleteVehicle _x} forEach GVAR(rigCargoHelpers);
        GVAR(rigCargoHelpers) = [];
    };
}, 0, [_cargo, _unit, _hook]] call CBA_fnc_addPerFrameHandler;
