///////////////////////////////////////////////////////////////////////////////
// helicopter
///////////////////////////////////////////////////////////////////////////////
private _displayName = "Attach Cargo";
private _icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
private _statement = amp_slingload_fnc_attachCargo;
private _condition = amp_slingload_fnc_canAttachCargo;
private _position = "slingload0";
_action = ["amp_slingload_attachCargo", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
["Helicopter", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;

// Huron
_statement = {[_target, _player, [0,-0.115218 + 1.9812,-2.7]] call amp_slingload_fnc_attachCargo};
_position = [0,-0.115218 + 1.9812,-2.7];
private _actionForward = ["amp_slingload_attachCargoForward", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
_statement = {[_target, _player, [0,-0.115218 - 1.9812,-2.7]] call amp_slingload_fnc_attachCargo};
_position = [0,-0.115218 - 1.9812,-2.7];
private _actionAft = ["amp_slingload_attachCargoAft", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
["Heli_Transport_03_base_F", 0, [], _actionForward, true] call ace_interact_menu_fnc_addActionToClass;
["Heli_Transport_03_unarmed_base_F", 0, [], _actionForward, true] call ace_interact_menu_fnc_addActionToClass;
["Heli_Transport_03_base_F", 0, [], _actionAft, true] call ace_interact_menu_fnc_addActionToClass;
["Heli_Transport_03_unarmed_base_F", 0, [], _actionAft, true] call ace_interact_menu_fnc_addActionToClass;

// Mohawk
_statement = {[_target, _player, [0,1.85587 + 1.524,-2.60947]] call amp_slingload_fnc_attachCargo};
_position = [0,1.85587 + 1.524,-2.60947];
_actionForward = ["amp_slingload_attachCargoForward", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
_statement = {[_target, _player, [0,1.85587 - 1.524,-2.60947]] call amp_slingload_fnc_attachCargo};
_position = [0,1.85587 - 1.524,-2.60947];
_actionAft = ["amp_slingload_attachCargoAft", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
["Heli_Transport_02_base_F", 0, [], _actionForward, true] call ace_interact_menu_fnc_addActionToClass;
["Heli_Transport_02_base_F", 0, [], _actionAft, true] call ace_interact_menu_fnc_addActionToClass;

// RHS_CH_47F_base
if (isClass (configFile >> "CfgVehicles" >> "RHS_CH_47F_base")) then {
    // forward
    _statement = {[_target, _player, [0,+1.9812-0.706448,-3.10134]] call amp_slingload_fnc_attachCargo};
    _position = [0,+1.9812-0.706448,-3.10134];
    _actionForward = ["amp_slingload_attachCargoForward", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
    // aft
    _position = [0,-1.9812-0.706448,-3.10134];
    _statement = {[_target, _player, [0,-1.9812-0.706448,-3.10134]] call amp_slingload_fnc_attachCargo};
    _actionAft = ["amp_slingload_attachCargoAft", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
    ["RHS_CH_47F_base", 0, [], _actionForward, true] call ace_interact_menu_fnc_addActionToClass;
    ["RHS_CH_47F_base", 0, [], _actionAft, true] call ace_interact_menu_fnc_addActionToClass;
};

// rhsusf_CH53E_USMC
if (isClass (configFile >> "CfgVehicles" >> "rhsusf_CH53E_USMC")) then {
    // forward
    _statement = {[_target, _player, [0,+1.524+3.92882,-4.13195]] call amp_slingload_fnc_attachCargo};
    _position = [0,+1.524+3.92882,-4.13195];
    _actionForward = ["amp_slingload_attachCargoForward", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
    // aft
    _position = [0,-1.524+3.92882,-4.13195];
    _statement = {[_target, _player, [0,-1.524+3.92882,-4.13195]] call amp_slingload_fnc_attachCargo};
    _actionAft = ["amp_slingload_attachCargoAft", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
    ["rhsusf_CH53E_USMC", 0, [], _actionForward, true] call ace_interact_menu_fnc_addActionToClass;
    ["rhsusf_CH53E_USMC", 0, [], _actionAft, true] call ace_interact_menu_fnc_addActionToClass;
};

// CUP_CH47F_base
if (isClass (configFile >> "CfgVehicles" >> "CUP_CH47F_base")) then {
    // forward
    _statement = {[_target, _player, [0,-0.325188+1.9812,-3.02169]] call amp_slingload_fnc_attachCargo};
    _position = [0,-0.325188+1.9812,-3.02169];
    _actionForward = ["amp_slingload_attachCargoForward", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
    // aft
    _statement = {[_target, _player, [0,-0.325188-1.9812,-3.02169]] call amp_slingload_fnc_attachCargo};
    _position = [0,-0.325188-1.9812,-3.02169];
    _actionAft = ["amp_slingload_attachCargoAft", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
    ["CUP_CH47F_base", 0, [], _actionForward, true] call ace_interact_menu_fnc_addActionToClass;
    ["CUP_CH47F_base", 0, [], _actionAft, true] call ace_interact_menu_fnc_addActionToClass;
};

// CUP_MH47E_base
if (isClass (configFile >> "CfgVehicles" >> "CUP_MH47E_base")) then {
    // main
    _statement = {[_target, _player, [0,-0.084305,0.539414]] call amp_slingload_fnc_attachCargo};
    _position = [0,-0.084305,0.539414];
    _action = ["amp_slingload_attachCargoMain", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
    // forward
    _statement = {[_target, _player, [0,2.22729,0.64529]] call amp_slingload_fnc_attachCargo};
    _position = [0,2.22729,0.64529];
    _actionForward = ["amp_slingload_attachCargoForward", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
    // aft
    _statement = {[_target, _player, [0,-2.3959,0.433537]] call amp_slingload_fnc_attachCargo};
    _position = [0,-2.3959,0.433537];
    _actionAft = ["amp_slingload_attachCargoAft", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
    ["CUP_MH47E_base", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;
    ["CUP_MH47E_base", 0, [], _actionForward, true] call ace_interact_menu_fnc_addActionToClass;
    ["CUP_MH47E_base", 0, [], _actionAft, true] call ace_interact_menu_fnc_addActionToClass;
};

// CUP_CH53E_base
if (isClass (configFile >> "CfgVehicles" >> "CUP_CH53E_base")) then {
    // forward
    _statement = {[_target, _player, [0,1.524+4.30637,-4.25129]] call amp_slingload_fnc_attachCargo};
    _position = [0,1.524+4.30637,-4.25129];
    _actionForward = ["amp_slingload_attachCargoForward", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
    // aft
    _statement = {[_target, _player, [0,-1.524+4.30637,-4.25129]] call amp_slingload_fnc_attachCargo};
    _position = [0,-1.524+4.30637,-4.25129];
    _actionAft = ["amp_slingload_attachCargoAft", _displayName, _icon, _statement, _condition, {}, [], _position, 3.5] call ace_interact_menu_fnc_createAction;
    ["CUP_CH53E_base", 0, [], _actionForward, true] call ace_interact_menu_fnc_addActionToClass;
    ["CUP_CH53E_base", 0, [], _actionAft, true] call ace_interact_menu_fnc_addActionToClass;
};

_displayName = "Release Cargo";
_icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
_statement = {[_target] call amp_slingload_fnc_releaseCargo};
_condition = {[_target, _player] call amp_slingload_fnc_canReleaseCargo};
_action = ["amp_slingload_releaseCargo", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["Helicopter", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Main";
//_icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
_statement = {[_target, "Main"] call amp_slingload_fnc_releaseCargo};
_condition = {[_target, _player, "Main"] call amp_slingload_fnc_canReleaseCargo};
_action = ["amp_slingload_releaseCargo", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["Helicopter", 1, ["ACE_SelfActions", "amp_slingload_releaseCargo"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Forward";
//_icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
_statement = {[_target, "Forward"] call amp_slingload_fnc_releaseCargo};
_condition = {[_target, _player, "Forward"] call amp_slingload_fnc_canReleaseCargo};
_action = ["amp_slingload_releaseCargo", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["Helicopter", 1, ["ACE_SelfActions", "amp_slingload_releaseCargo"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Aft";
//_icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
_statement = {[_target, "Aft"] call amp_slingload_fnc_releaseCargo};
_condition = {[_target, _player, "Aft"] call amp_slingload_fnc_canReleaseCargo};
_action = ["amp_slingload_releaseCargo", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["Helicopter", 1, ["ACE_SelfActions", "amp_slingload_releaseCargo"], _action, true] call ace_interact_menu_fnc_addActionToClass;

///////////////////////////////////////////////////////////////////////////////
// cargo
///////////////////////////////////////////////////////////////////////////////
_displayName = "Rig For Sling Load";
//_icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
_condition = amp_slingload_fnc_canRigCargo;
_statement = {};
_action = ["amp_slingload_rig", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Auto Rig";
//_icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
_condition = amp_slingload_fnc_canRigCargoAuto;
_statement = amp_slingload_fnc_rigCargoAuto;
_action = ["amp_slingload_rigAuto", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","amp_slingload_rig"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Manual Rig";
_icon = "\a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_insp_hand_ca.paa";
_statement = amp_slingload_fnc_rigCargoManual;
_condition = amp_slingload_fnc_canRigCargoManual;
_action = ["amp_slingload_rigManual", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","amp_slingload_rig"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Adjust Rigging";
_icon = "\a3\3den\Data\Cfg3DEN\History\scaleItems_ca.paa";
_statement = {};
_condition = amp_slingload_fnc_canAdjustRigging;
_action = ["amp_slingload_adjustRigging", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","amp_slingload_rig"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "All";
//_icon = "\a3\3den\Data\Cfg3DEN\History\scaleItems_ca.paa";
_statement = {[_target, _player, true] call amp_slingload_fnc_adjustRigging};
_condition = {true};
_action = ["amp_slingload_adjustRiggingAll", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","amp_slingload_rig", "amp_slingload_adjustRigging"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Single";
//_icon = "\a3\3den\Data\Cfg3DEN\History\scaleItems_ca.paa";
_statement = {[_target, _player, false] call amp_slingload_fnc_adjustRigging};
//_condition = {true};
_action = ["amp_slingload_adjustRiggingAll", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","amp_slingload_rig", "amp_slingload_adjustRigging"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Remove Rigging";
_icon = "\a3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_cancel_ca.paa";
_statement = amp_slingload_fnc_removeRigging;
_condition = amp_slingload_fnc_canRemoveRigging;
_action = ["amp_slingload_removeRigging", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","amp_slingload_rig"], _action, true] call ace_interact_menu_fnc_addActionToClass;

///////////////////////////////////////////////////////////////////////////////
// cargo sling apex fitting
///////////////////////////////////////////////////////////////////////////////
_displayName = "Pick up";
_statement = amp_slingload_fnc_pickUpFitting;
_condition = {isNull (_player getVariable ["amp_slingload_heldFitting", objNull])};
_icon = "\A3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_takemine_ca.paa";
_action = ["amp_slingload_pickup", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["amp_slingload_apexFitting", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;
