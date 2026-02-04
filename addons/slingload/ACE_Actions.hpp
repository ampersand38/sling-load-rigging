private _icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";

{
    _displayName = localize LSTRING(ReleaseCargo);
    _statement = {[_target] call slr_slingload_fnc_releaseCargo};
    _condition = {[_target, _player] call slr_slingload_fnc_canReleaseCargo};
    _action = ["slr_slingload_releaseCargo", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
    [_x, 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

    _displayName = localize LSTRING(CargoHookNameMain);
    //_icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
    _statement = {[_target, "Main"] call slr_slingload_fnc_releaseCargo};
    _condition = {[_target, _player, "Main"] call slr_slingload_fnc_canReleaseCargo};
    _action = ["slr_slingload_releaseCargo", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
    [_x, 1, ["ACE_SelfActions", "slr_slingload_releaseCargo"], _action, true] call ace_interact_menu_fnc_addActionToClass;

    _displayName = localize LSTRING(CargoHookNameForward);
    //_icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
    _statement = {[_target, "Forward"] call slr_slingload_fnc_releaseCargo};
    _condition = {[_target, _player, "Forward"] call slr_slingload_fnc_canReleaseCargo};
    _action = ["slr_slingload_releaseCargo", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
    [_x, 1, ["ACE_SelfActions", "slr_slingload_releaseCargo"], _action, true] call ace_interact_menu_fnc_addActionToClass;

    _displayName = localize LSTRING(CargoHookNameAft);
    //_icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
    _statement = {[_target, "Aft"] call slr_slingload_fnc_releaseCargo};
    _condition = {[_target, _player, "Aft"] call slr_slingload_fnc_canReleaseCargo};
    _action = ["slr_slingload_releaseCargo", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
    [_x, 1, ["ACE_SelfActions", "slr_slingload_releaseCargo"], _action, true] call ace_interact_menu_fnc_addActionToClass;

    [_x, "init", FUNC(addACEActions), true, [], true] call CBA_fnc_addClassEventHandler;
} forEach [
    "Helicopter",
    "VTOL_Base_F",
    "CUP_B_MV22_USMC"
];


///////////////////////////////////////////////////////////////////////////////
// cargo
///////////////////////////////////////////////////////////////////////////////
_displayName = localize LSTRING(RigForSlingLoad);
//_icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
_condition = slr_slingload_fnc_canRigCargo;
_statement = {};
_action = ["slr_slingload_rig", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize LSTRING(AutoRig);
//_icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
_condition = slr_slingload_fnc_canRigCargoAuto;
_statement = slr_slingload_fnc_rigCargoAuto;
_action = ["slr_slingload_rigAuto", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","slr_slingload_rig"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize LSTRING(ManualRig);
_icon = "\a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_insp_hand_ca.paa";
_statement = slr_slingload_fnc_rigCargoManual;
_condition = slr_slingload_fnc_canRigCargoManual;
_action = ["slr_slingload_rigManual", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","slr_slingload_rig"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize LSTRING(AdjustRigging);
_icon = "\a3\3den\Data\Cfg3DEN\History\scaleItems_ca.paa";
_statement = {};
_condition = slr_slingload_fnc_canAdjustRigging;
_action = ["slr_slingload_adjustRigging", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","slr_slingload_rig"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize LSTRING(AdjustRiggingAll);
//_icon = "\a3\3den\Data\Cfg3DEN\History\scaleItems_ca.paa";
_statement = {[_target, _player, true] call slr_slingload_fnc_adjustRigging};
_condition = {true};
_action = ["slr_slingload_adjustRiggingAll", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","slr_slingload_rig", "slr_slingload_adjustRigging"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize LSTRING(AdjustRiggingSingle);
//_icon = "\a3\3den\Data\Cfg3DEN\History\scaleItems_ca.paa";
_statement = {[_target, _player, false] call slr_slingload_fnc_adjustRigging};
//_condition = {true};
_action = ["slr_slingload_adjustRiggingSingle", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","slr_slingload_rig", "slr_slingload_adjustRigging"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = localize LSTRING(RemoveRigging);
_icon = "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_cancel_ca.paa";
_statement = slr_slingload_fnc_removeRigging;
_condition = slr_slingload_fnc_canRemoveRigging;
_action = ["slr_slingload_removeRigging", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","slr_slingload_rig"], _action, true] call ace_interact_menu_fnc_addActionToClass;

///////////////////////////////////////////////////////////////////////////////
// cargo sling apex fitting
///////////////////////////////////////////////////////////////////////////////
_displayName = localize "STR_ACE_Explosives_Pickup";
_statement = slr_slingload_fnc_pickUpFitting;
_condition = {isNull (_player getVariable ["slr_slingload_heldFitting", objNull])};
_icon = "\A3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_takemine_ca.paa";
_action = ["slr_slingload_pickup", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["slr_slingload_apexFitting", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;
