class CfgVehicles {
    class ace_refuel_helper;
    class slr_slingload_apexFitting: ace_refuel_helper {
        author = "Ampersand";
        displayName = CSTRING(SlingLoadApexFitting);
        _generalMacro = "slr_slingload_apexFitting";
        icon = "\a3\ui_f\data\IGUI\Cfg\VehicleToggles\SlingLoadRopeIconOn_ca.paa";
        //model = "\z\slr\addons\slingload\data\apexFitting.p3d";
        model = "\z\slr\addons\slingload\data\ropeEndLoop.p3d";
        damageEffect = "";
        destrType = "";
        acre_hasInfantryPhone = 0;
    };
    class ACE_Explosives_Place;
    class slr_slingload_wreckDummy: ACE_Explosives_Place {
        author = "Ampersand";
        mapSize = 1;
        _generalMacro = QGVAR(wreckDummy);
        displayName = CSTRING(WreckDummy);
        icon = "iconObject_1x1";
        model = QPATHTOF(data\wreckDummy.p3d);
        cost = 0;

    };
    class Land_Screwdriver_V1_F;
    class slr_slingload_hook: Land_Screwdriver_V1_F {
        author = "Ampersand";
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
    /*
    class Rope;
    class slr_Rope : Rope {
    model = "\z\slr\addons\slingload\data\rope.p3d";
    segmentType = "slr_RopeSegment";
};
    class slr_RopeLadder : Rope {
        model = "\z\slr\addons\slingload\data\ropeLadder.p3d";
        segmentType = "slr_RopeLadderSegment";
    };
    class slr_RopeLadder2 : Rope {
        model = "\z\slr\addons\slingload\data\ropeLadder2.p3d";
        segmentType = "slr_RopeLadderSegment2";
    };
    */
};
