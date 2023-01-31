#include "script_component.hpp"

ADDON = false;

slr_customHooks = createHashMapFromArray [
    //["model.p3d",[main, forward, aft]],
    // Huron
    ["\A3\Air_F_Heli\Heli_Transport_03\Heli_Transport_03_F.p3d", [[-0.0309701,-0.115218,-2.52826], [0,-0.115218 + 1.9812,-2.7], [0,-0.115218 - 1.9812,-2.7]]],
    // Mohawk
    ["\A3\Air_F_Beta\Heli_Transport_02\Heli_Transport_02_F.p3d", [[-0,1.85587,-2.60947], [0,1.85587 + 1.524,-2.60947], [0,1.85587 - 1.524,-2.60947]]],
    // Blackfish
    ["\A3\Air_F_Exp\VTOL_01\VTOL_01_vehicle_F.p3d", [[0.000470325,2.51264,-6.03068], [0.000470325,2.51264+3,-6.03068], [0.000470325,2.51264-3,-6.03068]]],
    // Xi'an
    ["\A3\Air_F_Exp\VTOL_02\VTOL_02_vehicle_F.p3d", [[0.000961972,-0.840889,-2.51653]]],

    // GM
    ["\gm\gm_vehicles\gm_air\gm_helicopters\gm_ch53\gm_ch53g.p3d",[[-0.0295088,3.23667,-3.18058],[-0.0295088,6.23666,-3.18058],[-0.0295088,0.236665,-3.18058]]],

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
    ["\cup\airvehicles\cup_airvehicles_mv22\cup_mv22.p3d", [[-0.000117949,0.857828,-2.87325], [-0.000117949,0.857828+3,-2.87325], [-0.000117949,0.857828-3,-2.87325]]],
    ["\cup\airvehicles\cup_airvehicles_mv22\CUP_MV22_RampGun.p3d", [[-0.000117949,0.857828,-2.87325], [-0.000117949,0.857828+3,-2.87325], [-0.000117949,0.857828-3,-2.87325]]],
    ["\cup\airvehicles\cup_airvehicles_mv22\CUP_MV22_VIV.p3d", [[-0.000117949,0.857828,-2.87325], [-0.000117949,0.857828+3,-2.87325], [-0.000117949,0.857828-3,-2.87325]]],

    // dega
    ["\dega_vehicles_v22\mv22.p3d", [[0.0695299,-0.760864,0.5],[0.0696049,3.86233,-1.9381],[0.0569674,1.20766,-1.64997]]],

    // fvl
    ["\FVL_2k35\Valor\fvl_b_valor_1.p3d", [[0,0.760362,-0.750906],[0,0.760362+3,-0.750906],[0,0.760362-3,-0.750906]]],

    // kyo
    ["\kyo_MH47E\kyo_MH47E.p3d", [[0.0025291,0.209242,3.2536],[0.0025291,0.209242+3,3.2536],[0.0025291,0.209242-3,3.2536]]],

    // TFC
    ["\tfc_rcaf\addons\ch147\CH147F.p3d", [[-0,-0.191261,0.240921],[-0,2.82105,0.51302],[-0,-2.86031,0.292259]]],
    ["\tfc_rcaf\addons\ch147\CH147F_CASEVAC.p3d", [[-0,-0.191261,0.240921],[-0,2.82105,0.51302],[-0,-2.86031,0.292259]]]
];

#include "XEH_PREP.hpp"

ADDON = true;

/*
// Model and hook pos
private _h = cursorObject;
private _cfg = configOf _h;
private _pos = _h  selectionPosition (getText (_cfg >> "slingLoadMemoryPoint"));
[getText (_cfg >> "model"), [_pos, _pos vectorAdd [0,3,0], _pos vectorAdd [0,-3,0]]]
*/
