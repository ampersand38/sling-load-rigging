#include "\a3\editor_f\Data\Scripts\dikCodes.h"

[
    "Ground-Based Sling Load", "amp_slingloading_releaseCargo", "Release Cargo",{
        [vehicle player] call amp_slingload_fnc_releaseCargo;
    }
] call CBA_fnc_addKeybind;
