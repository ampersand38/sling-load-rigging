[
    "Sling Load Rigging", "slr_slingloading_releaseCargo", localize LSTRING(ReleaseCargo),{
        [vehicle (call CBA_fnc_currentUnit)] call slr_slingload_fnc_releaseCargo;
    }
] call CBA_fnc_addKeybind;
