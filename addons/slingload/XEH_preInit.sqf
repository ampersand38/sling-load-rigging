#include "script_component.hpp"

ADDON = false;

// get model and hook pos
// _v = call amp_fnc_gv; [getText (configOf _v >> "model"), getNumber (configOf _v >> "slingLoadMaxCargoMass"), _v selectionPosition "slingload0"]
// move vehicle above player
// _v = call amp_fnc_gv; _v setPosASL (getPosASL player vectorAdd ((_v selectionPosition "slingload0") vectorMultiply -1))

slr_customHooks = createHashMapFromArray [
    //["model.p3d",[main, forward, aft]],
    ["\A3\Air_F_Orange\UAV_06\UAV_06_F.p3d", [[0,0,-0.2]]],
    // Huron
    ["\A3\Air_F_Heli\Heli_Transport_03\Heli_Transport_03_F.p3d", [[-0.0309701,-0.115218,-2.52826], [0,-0.115218 + 1.9812,-2.7], [0,-0.115218 - 1.9812,-2.7]]],
    // Mohawk
    ["\A3\Air_F_Beta\Heli_Transport_02\Heli_Transport_02_F.p3d", [[-0,1.85587,-2.60947], [0,1.85587 + 1.524,-2.60947], [0,1.85587 - 1.524,-2.60947]]],
    // Blackfish
    ["\A3\Air_F_Exp\VTOL_01\VTOL_01_vehicle_F.p3d", [[0.000470325,2.51264,-6.03068], [0.000470325,2.51264+3,-6.03068], [0.000470325,2.51264-3,-6.03068]]],
    // Blackfish armed
    ["\A3\Air_F_Exp\VTOL_01\VTOL_01_armed_F.p3d", [[0.000470325,2.51264,-6.03068], [0.000470325,2.51264+3,-6.03068], [0.000470325,2.51264-3,-6.03068]]],
    // Xi'an
    ["\A3\Air_F_Exp\VTOL_02\VTOL_02_vehicle_F.p3d", [[0.000961972,-0.840889,-2.51653]]],
    // Kajman
    ["\A3\Air_F_Beta\Heli_Attack_02\Heli_Attack_02_F.p3d", [[0,1.04233,-2.19047]]],
    // Darter
    ["\A3\Drones_F\Air_F_Gamma\UAV_01\UAV_01_F.p3d", [[0,0,-1]]],

    // GM
    ["\gm\gm_vehicles\gm_air\gm_helicopters\gm_ch53\gm_ch53g.p3d",[[-0.0295088,3.23667,-3.18058],[-0.0295088,6.23666,-3.18058],[-0.0295088,0.236665,-3.18058]]],

    // SOG PF
    ["\vn\air_f_vietnam_03\ch47\vn_air_ch47_01.p3d",[[-0.0229115,1.44711,-3],[-0.0229115,1.44711+3,-3],[-0.0229115,1.44711-3,-3]]],
    ["\vn\air_f_vietnam_03\ch47\vn_air_ach47_01.p3d",[[-0.0229115,1.44711,-3],[-0.0229115,1.44711+3,-3],[-0.0229115,1.44711-3,-3]]],

    // 3CB
    ["\uk3cb_baf_vehicles\addons\uk3cb_baf_vehicles_merlin\uk3cb_merlin_hc3", [[0.212563,3.07458,-2.89532], [0,6.07458,-2.89532], [0,0.07458,-2.89532]]],
    ["\uk3cb_baf_vehicles\addons\uk3cb_baf_vehicles_merlin\uk3cb_merlin_hc3_armed", [[0.212563,3.07458,-2.89532], [0,6.07458,-2.89532], [0,0.07458,-2.89532]]],
    ["\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\air\UK3CB_Factions_Vehicles_Osprey\uk3cb_osprey.p3d", [[-0.00693226,0.768486,-3.14963], [-0.00693226,0.768486+3,-3.14963], [-0.00693226,0.768486-3,-3.14963]]],
    ["\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\air\UK3CB_Factions_Vehicles_Osprey\uk3cb_osprey_m2.p3d", [[-0.00693226,0.768486,-3.14963], [-0.00693226,0.768486+3,-3.14963], [-0.00693226,0.768486-3,-3.14963]]],
    ["\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\air\UK3CB_Factions_Vehicles_Osprey\uk3cb_osprey_m240.p3d", [[-0.00693226,0.768486,-3.14963], [-0.00693226,0.768486+3,-3.14963], [-0.00693226,0.768486-3,-3.14963]]],
    ["\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\air\UK3CB_Factions_Vehicles_Osprey\uk3cb_osprey_idws.p3d", [[-0.00693226,0.768486,-3.14963], [-0.00693226,0.768486+3,-3.14963], [-0.00693226,0.768486-3,-3.14963]]],
    ["\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\air\UK3CB_Factions_Vehicles_Osprey\uk3cb_osprey_idws_m2.p3d", [[-0.00693226,0.768486,-3.14963], [-0.00693226,0.768486+3,-3.14963], [-0.00693226,0.768486-3,-3.14963]]],
    ["\UK3CB_Factions\addons\UK3CB_Factions_Vehicles\air\UK3CB_Factions_Vehicles_Osprey\uk3cb_osprey_idws_m240.p3d", [[-0.00693226,0.768486,-3.14963], [-0.00693226,0.768486+3,-3.14963], [-0.00693226,0.768486-3,-3.14963]]],

    // RHS
    ["\rhsusf\addons\rhsusf_a2port_air\CH47\CH_47F", [[0,-0.706448,-3.10134], [0,+1.9812-0.706448,-3.10134], [0,-1.9812-0.706448,-3.10134]]],
    ["\rhsusf\addons\rhsusf_ch53\rhsusf_ch53_e.p3d", [[0,3.92882,-4.13195], [0,+1.524+3.92882,-4.13195], [0,-1.524+3.92882,-4.13195]]],

    // CUP
    ["\CUP\AirVehicles\CUP_AirVehicles_CH47\CUP_CH_47F.p3d", [[-0.00294908,-0.325188,-3.02169], [0,-0.325188+1.9812,-3.02169], [0,-0.325188-1.9812,-3.02169]]],
    ["\CUP\AirVehicles\CUP_AirVehicles_MH47E\CUP_MH47E.p3d", [[0,-0.084305,0.539414], [0,2.22729,0.64529], [0,-2.3959,0.433537]]],
    ["\cup\airvehicles\cup_airvehicles_ch53e\usec_ch53_e.p3d", [[-0.0054176,4.30637,-4.25129], [0,1.524+4.30637,-4.25129], [0,-1.524+4.30637,-4.25129]]],
    ["\cup\airvehicles\cup_airvehicles_mi6\int73_mi6a.p3d", [[-0.00219614,-0.243062,-2.00256], [-0.00219614,-0.243062+3,-2.00256], [-0.00219614,-0.243062-3,-2.00256]]],
    ["\cup\airvehicles\cup_airvehicles_mv22\cup_mv22.p3d", [[-0.000117949,0.857828,-2.87325], [-0.000117949,0.857828+3,-2.87325], [-0.000117949,0.857828-3,-2.87325]]],
    ["\cup\airvehicles\cup_airvehicles_mv22\CUP_MV22_RampGun.p3d", [[-0.000117949,0.857828,-2.87325], [-0.000117949,0.857828+3,-2.87325], [-0.000117949,0.857828-3,-2.87325]]],
    ["\cup\airvehicles\cup_airvehicles_mv22\CUP_MV22_VIV.p3d", [[-0.000117949,0.857828,-2.87325], [-0.000117949,0.857828+3,-2.87325], [-0.000117949,0.857828-3,-2.87325]]],

    // dega
    ["\dega_vehicles_v22\mv22.p3d", [[0,-0.76,0.5],[0,-0.76+3,0.5],[0,-0.76-3,0.5]]],

    // fvl
    ["\FVL_2k35\Valor\fvl_b_valor_1.p3d", [[0,0.760362,-0.750906],[0,0.760362+3,-0.750906],[0,0.760362-3,-0.750906]]],

    // Mi-6 hook
    ["\HWK_mi6a\HWK_mi6a.p3d", [[0,3.87695,-3.26699], [0,8.07813,-3.01979], [0,0.300781,-3.59388]]],

    // kyo
    ["\kyo_MH47E\kyo_MH47E.p3d", [[0.0025291,0.209242,3.2536],[0.0025291,0.209242+3,3.2536],[0.0025291,0.209242-3,3.2536]]],

    // Unsung Redux
    ["uns_ch46\uns_ch46D.p3d",[[0.111506,3.05864,-2.49121],[0.111506,6.05864,-2.09121],[0.111506,0.0586376,-2.89121]]],
    ["uns_ch46\uns_ch46d_armed.p3d",[[0.111506,3.05864,-2.49121],[0.111506,6.05864,-2.09121],[0.111506,0.0586376,-2.89121]]],
    ["\uns_ch47a\uns_ach47a.p3d",[[-0.00092582,0.103377,-3.0675],[-0.00092582,3.10338,-3.0675],[-0.00092582,-2.89662,-3.0675]]],
    ["\uns_ch47a\uns_ch47a.p3d", [[-0.00092582,0.103377,-3.0675],[-0.00092582,3.10338,-3.0675],[-0.00092582,-2.89662,-3.0675]]],
    ["\uns_ch47a\uns_ch47a_amb.p3d",[[-0.00092582,0.103377,-3.0675],[-0.00092582,3.10338,-3.0675],[-0.00092582,-2.89662,-3.0675]]],
    ["\uns_ch53\uns_rh53a_m2.p3d",[[-0.0613299,1.75458,-3.70799],[-0.0613299,4.75458,-3.70799],[-0.0613299,-1.24542,-3.70799]]],
    ["\uns_ch53\uns_hh53b.p3d",[[-0.0613299,1.75458,-3.67165],[-0.0613299,4.75458,-3.67165],[-0.0613299,-1.24542,-3.67165]]],
    ["\uns_ch53\uns_ch53a_m60.p3d",[[-0.0613299,1.75458,-3.70799],[-0.0613299,4.75458,-3.70799],[-0.0613299,-1.24542,-3.70799]]],
    ["\uns_ch53\uns_ch53d_m2.p3d",[[-0.0613299,1.75458,-3.70799],[-0.0613299,4.75458,-3.70799],[-0.0613299,-1.24542,-3.70799]]],
    ["\uns_ch53\uns_ch53a_med.p3d",[[-0.0613299,1.75458,-3.75117],[-0.0613299,4.75458,-3.75117],[-0.0613299,-1.24542,-3.75117]]],

    // PRACS
    ["PRACS_CH53",[[0,-0.622889,0.466298],[0,2.37711,0.466298],[0,-3.62289,0.466298]]],

    // TF373
    ["TF373_SOAR_MH47G", [[-0.032194,1.65714,-2.20174],[-0.0196315,-0.745838,-2.40055],[-0.0195565,3.87736,-2.1888]]],

    // OPTRE ["\OPTRE_Vehicles_Air\Falcon\falcon_unarmed.p3d",5000,[-0,0.687231,-2.63535]]
    //       ["\OPTRE_Vehicles_Air\Falcon\falcon.p3d",5000,[-0,0.675601,-2.62983]]
    ["\OPTRE_Vehicles_Air\Falcon\falcon.p3d", [[0,0.675601,-2.62983],[0,3.675601,-2.62983],[0,0.675601-3,-2.62983]]],
    ["\OPTRE_Vehicles_Air\Falcon\falcon_medical.p3d", [[0,0.675601,-2.62983],[0,3.675601,-2.62983],[0,0.675601-3,-2.62983]]],
    ["\OPTRE_Vehicles_Air\Falcon\falcon_unarmed.p3d", [[0,0.687231,-2.63535],[0,3.687231,-2.63535],[0,0.687231-3,-2.63535]]],
    ["OPTRE_Vehicles\Pelican\Pelican_base.p3d", [[0.00737715,3.72935,-3.77232],[0.00737715,3.72935+2.5,-3.77232],[0.00737715,3.72935-2.5,-3.27232]]],
    ["OPTRE_Vehicles_Air\P_SOCOM\Pelican_SOCOM.p3d", [[0.00737715,3.72935,-3.77232],[0.00737715,3.72935+2.5,-3.77232],[0.00737715,3.72935-2.5,-3.27232]]],

    // PSZ: Polish Armed Forces
    ["psz\air\mi24\psz_mi24d", [[0,2.5044,-2.27104]]],
    ["psz\air\mi17\PSZ_Mi17_1W_PKT", [[0,1.98528,-2.41888]]],

    // TFC
    ["\tfc_rcaf\addons\ch147\CH147F.p3d", [[-0,-0.191261,0.240921],[-0,2.82105,0.51302],[-0,-2.86031,0.292259]]],
    ["\tfc_rcaf\addons\ch147\CH147F_CASEVAC.p3d", [[-0,-0.191261,0.240921],[-0,2.82105,0.51302],[-0,-2.86031,0.292259]]]
];

#include "XEH_PREP.hpp"

ADDON = true;

/*
// Model and hook pos
private _r = get3DENSelected "OBJECT" apply {
    private _cfg = configOf _x;
    private _pos = _x selectionPosition (getText (_cfg >> "slingLoadMemoryPoint"));
    [getText (_cfg >> "model"), [_pos, _pos vectorAdd [0,3,0], _pos vectorAdd [0,-3,0]]]
};
_s = (_r joinString ("," + endl)) + ",";
copyToClipboard _s;
_r
*/
