/**
 * @ Author: OxyTom
 * @ Create Time: 2022-09-05 15:20:16
 * @ Description: Hide all LUCY markers. To be called in initClient.sqf. Stolen from GdC_lib's fn_hideGaiaMarker.
 * @ Usage: [] execVM "scripts\hideLucyMarker.sqf";
 * @ Version: 1.0.0
 */

{
	if(["lucy_", _x] call GDC_fnc_StringStartWith) then {
		_x setmarkerAlpha 0;
	};
} foreach allMapMarkers;
"mkr_spawn_static_unit" setMarkerAlpha 0;

