#include "script_component.hpp"

slr_customHooks = createHashMapFromArray [
    //["model.p3d",[main, forward, aft]],
    // Huron
    ["\A3\Air_F_Heli\Heli_Transport_03\Heli_Transport_03_F.p3d", [[-0.0309701,-0.115218,-2.52826], [0,-0.115218 + 1.9812,-2.7], [0,-0.115218 - 1.9812,-2.7]]],
    // Mohawk
    ["\A3\Air_F_Beta\Heli_Transport_02\Heli_Transport_02_F.p3d", [[-0,1.85587,-2.60947], [0,1.85587 + 1.524,-2.60947], [0,1.85587 - 1.524,-2.60947]]],

    // 3CB
    ["\uk3cb_baf_vehicles\addons\uk3cb_baf_vehicles_merlin\uk3cb_merlin_hc3", [[0.212563,3.07458,-2.89532], [0,6.07458,-2.89532], [0,0.07458,-2.89532]]],
    ["\uk3cb_baf_vehicles\addons\uk3cb_baf_vehicles_merlin\uk3cb_merlin_hc3_armed", [[0.212563,3.07458,-2.89532], [0,6.07458,-2.89532], [0,0.07458,-2.89532]]],

    // RHS
    ["\rhsusf\addons\rhsusf_a2port_air\CH47\CH_47F", [[-5.24521e-006,-0.706448,-3.10134], [0,+1.9812-0.706448,-3.10134], [0,-1.9812-0.706448,-3.10134]]],
    ["\rhsusf\addons\rhsusf_ch53\rhsusf_ch53_e.p3d", [[-0.0495522,3.92882,-4.13195], [0,+1.524+3.92882,-4.13195], [0,-1.524+3.92882,-4.13195]]],

    // CUP
    ["\CUP\AirVehicles\CUP_AirVehicles_CH47\CUP_CH_47F.p3d", [[-0.00294908,-0.325188,-3.02169], [0,-0.325188+1.9812,-3.02169], [0,-0.325188-1.9812,-3.02169]]],
    ["\CUP\AirVehicles\CUP_AirVehicles_MH47E\CUP_MH47E.p3d", [[0,-0.084305,0.539414], [0,2.22729,0.64529], [0,-2.3959,0.433537]]],
    ["\cup\airvehicles\cup_airvehicles_ch53e\usec_ch53_e.p3d", [[-0.0054176,4.30637,-4.25129], [0,1.524+4.30637,-4.25129], [0,-1.524+4.30637,-4.25129]]],
    ["\cup\airvehicles\cup_airvehicles_mi6\int73_mi6a.p3d", [[-0.00219614,-0.243062,-2.00256], [-0.00219614,-0.243062+3,-2.00256], [-0.00219614,-0.243062-3,-2.00256]]],

    // kyo
    ["\kyo_MH47E\kyo_MH47E.p3d", [[0.0695299,-0.760864,-2.14985],[0.0696049,3.86233,-1.9381],[0.0569674,1.20766,-1.64997]]],

    // TFC
    ["\tfc_rcaf\addons\ch147\CH147F.p3d", [[-0,-0.191261,0.240921],[-0,2.82105,0.51302],[-0,-2.86031,0.292259]]],
    ["\tfc_rcaf\addons\ch147\CH147F_CASEVAC.p3d", [[-0,-0.191261,0.240921],[-0,2.82105,0.51302],[-0,-2.86031,0.292259]]]
];
["Helicopter", "init", FUNC(addACEActions), true, [], true] call CBA_fnc_addClassEventHandler;

#include "ACE_Actions.sqf"
#include "CBA_Keybinds.sqf"
#include "eventHandlers.sqf"

GVAR(pfeh_running) = false;
