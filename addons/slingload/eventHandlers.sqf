["amp_slingload_localise", {
    params ["_heli"];
    private _heliOwner = owner _heli;
    {
        if (_heliOwner != owner _x) then {
            _x setOwner _heliOwner;
        };
    } forEach (ropes _heli + ropeAttachedObjects _heli);
}] call CBA_fnc_addEventHandler;

["Helicopter", "Init", {
    params ["_heli"];
    _heli addItemCargoGlobal ["amp_slingload_CargoSling", 4];
    _heli addEventHandler ["RopeAttach", {
        //params ["_heli", "_rope", "_object"];
        ["amp_slingload_localise", [_this # 0]] call CBA_fnc_serverEvent;
    }];
}, true, [], true] call CBA_fnc_addClassEventHandler;

["Helicopter", "Local", {
    params ["_heli", "_isLocal"];
    if _isLocal then {["amp_slingload_localise", [_heli]] call CBA_fnc_serverEvent;};
}, true] call CBA_fnc_addClassEventHandler;

["amp_slingload_apexFitting", "Deleted", {
    params ["_apexFitting"];
    private _cargo = _apexFitting getVariable ["amp_slingload_cargo4Fitting", objNull];
    if !(isNull _cargo) then {
        _cargo setVariable ["amp_slingload_ropes4Cargo", [], true];
    };
}, true] call CBA_fnc_addClassEventHandler;

["amp_slingload_apexFitting", "Killed", {
    params ["_apexFitting"];
    deleteVehicle _apexFitting;
}, true] call CBA_fnc_addClassEventHandler;

["amp_slingload_apexFitting", "Init", {
    (_this # 0) addEventHandler ["RopeBreak", {
        params ["_apexFitting"];
        if (
            (ropeAttachedObjects _apexFitting isEqualTo [])
            ||
            {ropes _apexFitting isEqualTo []}
        ) then {
            deleteVehicle _apexFitting;
        };
    }];
}, true, [], true] call CBA_fnc_addClassEventHandler;
