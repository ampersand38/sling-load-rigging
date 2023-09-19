class CfgNonAIVehicles {
    class RopeSegment; // 0.3 m
    /*
    class RopeSegment_1m : RopeSegment {
        model = "\A3\Data_f\proxies\Rope\rope_1m.p3d"; // Base game model
    };
    class RopeSegment_2m : RopeSegment {
        model = "\A3\Data_f\proxies\Rope\rope_2m.p3d"; // Base game model
    };
    class RopeSegment_3m : RopeSegment {
        model = "\A3\Data_f\proxies\Rope\rope_3m.p3d"; // Base game model
    };
    class slr_reachPendantSegment: RopeSegment {
        model = "\z\slr\addons\slingload\data\reachPendant.p3d"; // 1.5477 m
    };
    */
    class slr_RopeSegment: RopeSegment {
        model = "\z\slr\addons\slingload\data\rope.p3d";
    };
    class RopeEnd;
    class slr_RopeEnd: RopeEnd {
        model = "\z\slr\addons\slingload\data\ropeEndLoop.p3d";
    };
    class slr_RopeLadderSegment: RopeSegment {
        model = "\z\slr\addons\slingload\data\ropeLadder.p3d";
    };
};
