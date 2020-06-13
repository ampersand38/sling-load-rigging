// actions
private _displayName = "Attach Cargo";
private _icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
private _statement = amp_slingload_fnc_attachCargo;
private _condition = amp_slingload_fnc_canAttachCargo;
private _position = "slingload0";
_action = ["amp_slingload_attachCargo", _displayName, _icon, _statement, _condition, {}, [], _position] call ace_interact_menu_fnc_createAction;
["Helicopter", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;

// Huron forward cargo hook
_statement = {[_target, _player, [0,-0.115218 + 3,-2.52826]] call amp_slingload_fnc_attachCargo};
_position = [0,-0.115218 + 3,-2.52826];
_action = ["amp_slingload_attachCargoForward", _displayName, _icon, _statement, _condition, {}, [], _position] call ace_interact_menu_fnc_createAction;
// Huron aft cargo hook
_statement = {[_target, _player, [0,-0.115218 - 3,-2.52826]] call amp_slingload_fnc_attachCargo};
_position = [0,-0.115218 - 3,-2.52826];
private _actionAft = ["amp_slingload_attachCargoAft", _displayName, _icon, _statement, _condition, {}, [], _position] call ace_interact_menu_fnc_createAction;
["B_Heli_Transport_03_base_F", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;
["Heli_Transport_03_unarmed_base_F", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;
["B_Heli_Transport_03_base_F", 0, [], _actionAft, true] call ace_interact_menu_fnc_addActionToClass;
["Heli_Transport_03_unarmed_base_F", 0, [], _actionAft, true] call ace_interact_menu_fnc_addActionToClass;

// chinook forward cargo hook
_statement = {[_target, _player, [0, 2.7, -3.10134]] call amp_slingload_fnc_attachCargo};
_position = [0, 2.7, -3.10134];
_action = ["amp_slingload_attachCargoForward", _displayName, _icon, _statement, _condition, {}, [], _position] call ace_interact_menu_fnc_createAction;
// chinook aft cargo hook
_position = [0, -3.7, -3.10134];
_statement = {[_target, _player, [0, -3.7, -3.10134]] call amp_slingload_fnc_attachCargo};
_actionAft = ["amp_slingload_attachCargoAft", _displayName, _icon, _statement, _condition, {}, [], _position] call ace_interact_menu_fnc_createAction;
if (isClass (configFile >> "CfgVehicles" >> "RHS_CH_47F_base")) then {
    ["RHS_CH_47F_base", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;
    ["RHS_CH_47F_base", 0, [], _actionAft, true] call ace_interact_menu_fnc_addActionToClass;
};
if (isClass (configFile >> "CfgVehicles" >> "CUP_CH47F_base")) then {
    ["CUP_CH47F_base", 0, [], _action, true] call ace_interact_menu_fnc_addActionToClass;
    ["CUP_CH47F_base", 0, [], _actionAft, true] call ace_interact_menu_fnc_addActionToClass;
};

_displayName = "Release Cargo";
_icon = "\a3\ui_f\data\igui\cfg\vehicletoggles\slingloadropeiconon2_ca.paa";
_statement = {[_target] call amp_slingload_fnc_releaseCargo};
_condition = {[_target, _player] call amp_slingload_fnc_canReleaseCargo};
_action = ["amp_slingload_releaseCargo", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["Helicopter", 1, ["ACE_SelfActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Main";
_statement = {[_target, "Main"] call amp_slingload_fnc_releaseCargo};
_condition = {[_target, _player, "Main"] call amp_slingload_fnc_canReleaseCargo};
_action = ["amp_slingload_releaseCargo", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["Helicopter", 1, ["ACE_SelfActions", "amp_slingload_releaseCargo"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Forward";
_statement = {[_target, "Forward"] call amp_slingload_fnc_releaseCargo};
_condition = {[_target, _player, "Forward"] call amp_slingload_fnc_canReleaseCargo};
_action = ["amp_slingload_releaseCargo", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["Helicopter", 1, ["ACE_SelfActions", "amp_slingload_releaseCargo"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Aft";
_statement = {[_target, "Aft"] call amp_slingload_fnc_releaseCargo};
_condition = {[_target, _player, "Aft"] call amp_slingload_fnc_canReleaseCargo};
_action = ["amp_slingload_releaseCargo", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["Helicopter", 1, ["ACE_SelfActions", "amp_slingload_releaseCargo"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Rig For Sling Load";
_condition = amp_slingload_fnc_canRigCargo;
_statement = amp_slingload_fnc_rigCargo;
_action = ["amp_slingload_rigCargo", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Manual Rig";
_icon = "\a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_insp_hand_ca.paa";
_statement = amp_slingload_fnc_rigCargoManual;
_condition = amp_slingload_fnc_canRigCargoManual;
_action = ["amp_slingload_rigCargoManual", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","amp_slingload_rigCargo"], _action, true] call ace_interact_menu_fnc_addActionToClass;

_displayName = "Remove Rigging";
_icon = "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\SlingLoadRopeIconOn_ca.paa";
_statement = amp_slingload_fnc_removeRigging;
_condition = amp_slingload_fnc_canRemoveRigging;
_action = ["amp_slingload_removeRigging", _displayName, _icon, _statement, _condition] call ace_interact_menu_fnc_createAction;
["All", 0, ["ACE_MainActions","amp_slingload_rigCargo"], _action, true] call ace_interact_menu_fnc_addActionToClass;
