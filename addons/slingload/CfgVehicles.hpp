class CfgVehicles {
    class ace_fastroping_helper;
    class amp_slingload_apexFitting: ace_fastroping_helper {
        displayName = "Sling Load Apex Fitting";
        _generalMacro = "amp_slingload_apexFitting";
        icon = "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\SlingLoadRopeIconOn_ca.paa";
        damageEffect = "";
        destrType = "";
    };
    class Land_Screwdriver_V1_F;
    class amp_slingload_hook: Land_Screwdriver_V1_F {
        model = "\a3\data_f\Hook\Hook_F.p3d";
        displayName = "Sling Load Hook";
        _generalMacro = "amp_slingload_hook";
        icon = "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\SlingLoadRopeIconOn_ca.paa";
        //ace_refuel_canReceive = 0;
        //ace_cargo_space = 0;
        //ace_cargo_hasCargo = 0;
        /*
        class ACE_Actions {
            class amp_slingload_adjustRope {
                displayName = "Adjust Rope";
                condition = amp_slingload_canAdjustRope;
                statement = "";
                icon = "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\SlingLoadRopeIconOn_ca.paa";
                position = [0,0,1];
            };
        };
        */
    };
};
