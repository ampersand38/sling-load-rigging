class CfgVehicles {
    class ace_refuel_helper;
    class slr_slingload_apexFitting: ace_refuel_helper {
        displayName = CSTRING(SlingLoadApexFitting);
        _generalMacro = "slr_slingload_apexFitting";
        icon = "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\SlingLoadRopeIconOn_ca.paa";
        model = "\z\slr\addons\slingload\data\apexFitting.p3d";
        //model = "\z\ace\addons\fastroping\data\helper.p3d";
        damageEffect = "";
        destrType = "";
        acre_hasInfantryPhone = 0;
        /*
        class ACE_Actions {
            class slr_slingload_pickup {
                displayName = "Pick up";
                condition = "{true}";
                statement = "[_player, _target] call ace_dragging_fnc_carryObject;";
                icon = "\A3\ui_f\data\IGUI\Cfg\Actions\Obsolete\ui_action_takemine_ca.paa";
            };
        };
        */
    };
    class Land_Screwdriver_V1_F;
    class slr_slingload_hook: Land_Screwdriver_V1_F {
        model = "\a3\data_f\Hook\Hook_F.p3d";
        displayName = CSTRING(SlingLoadHook);
        _generalMacro = "slr_slingload_hook";
        icon = "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\SlingLoadRopeIconOn_ca.paa";
        //ace_refuel_canReceive = 0;
        //ace_cargo_space = 0;
        //ace_cargo_hasCargo = 0;
        /*
        class ACE_Actions {
            class slr_slingload_adjustRope {
                displayName = "Adjust Rope";
                condition = slr_slingload_canAdjustRope;
                statement = "";
                icon = "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\SlingLoadRopeIconOn_ca.paa";
                position = [0,0,1];
            };
        };
        */
    };
};
