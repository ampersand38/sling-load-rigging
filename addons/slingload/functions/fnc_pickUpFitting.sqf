#include "script_component.hpp"
/*
 * Author: Ampersand
 * Have player hold the apex fitting
 *
 * Arguments:
 * 0: Apex Fitting <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * 0: Success <BOOLEAN>
 *
 * Exslrle:
 * [_af, _unit] call slr_slingload_fnc_pickUpFitting
 */

params ["_af", "_unit"];

[_unit, "blockThrow", "slr_slingload_pickUpFitting", true] call ace_common_fnc_statusEffect_set;

//Show mouse buttons:
[localize "STR_ACE_Dragging_Drop", "", localize "STR_ACE_Dragging_RaiseLowerRotate"] call ace_interaction_fnc_showMouseHint;
_unit setVariable ["slr_slingload_apexFittingEH", [_unit, "DefaultAction", {true}, {slr_slingload_holdingFitting = false}] call ace_common_fnc_AddActionEventHandler];

GVAR(pfeh_running) = true;
slr_slingload_holdingFitting = true;
slr_slingload_fittingOffset = 0;
_af attachTo [_unit, [0,0.5,0], "head"];
_unit setVariable ["slr_slingload_heldFitting", _af, true];

[{
    [{
        params ["_args", "_pfID"];
        _args params ["_af", "_unit"];

        private _cargo = _af getVariable ["slr_slingload_cargo4Fitting", objNull];
        private _ropes = ropes _af;
        if (isNull _cargo || {count (_ropes - [objNull]) == 0}) then {
            deleteVehicle _af;
        } else {
            {
                private _reps = ropeEndPosition _x;
                private _l = ropeLength _x;
                private _stretch = (((_reps # 0) distance (_reps # 1)) - _l) / _l;
                if (_stretch > 0.05) then {
                    slr_slingload_holdingFitting = false;
                };
            } forEach _ropes;
        };

        if (slr_slingload_holdingFitting && {alive _af && {attachedTo _af == _unit}}) exitWith {};

        detach _af;
        private _boundingBox = boundingBoxReal _cargo;
        /*
        if (alive _cargo && {_af distance _cargo < _boundingBox # 2}) then {
            [_af, _cargo, true] call BIS_fnc_attachToRelative
            //_af attachTo [_cargo, _boundingBox # 1];
            //_af attachTo [_cargo, [0,0,_boundingBox # 1 # 2]];
        };
        */
        slr_slingload_holdingFitting = false;
        GVAR(pfeh_running) = false;

        _unit setVariable ["slr_slingload_heldFitting", objNull, true];

        [_unit, "blockThrow", "slr_slingload_pickUpFitting", false] call ace_common_fnc_statusEffect_set;
        [] call ace_interaction_fnc_hideMouseHint;
        [_unit, "DefaultAction", (_unit getVariable ["slr_slingload_apexFittingEH", -1])] call ace_common_fnc_removeActionEventHandler;
        _unit setVariable ["slr_slingload_apexFittingEH", -1];

        [_pfID] call CBA_fnc_removePerFrameHandler;
    }, 0, _this] call CBA_fnc_addPerFrameHandler;
}, [_af, _unit]] call CBA_fnc_execNextFrame;
