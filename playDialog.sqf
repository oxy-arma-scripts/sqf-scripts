/**
 * @ Author: OxyTom
 * @ Create Time: 2021-07-16 19:15:50
 * @ Version: 1.0.0
 * @ Description: Show subtitle like it'a from a dialog
 * @ Usage: ["ALPHA", "HQ de Alpha répondez.", 2, "rhs_rus_land_rc_01"] execVM "scripts\playDialog.sqf";
 */

params ["_callsign", "_content", "_duration", ["_sound", nil]];

[_callsign, _content] spawn BIS_fnc_showSubtitle;
if (!isNil "_sound") then {
	private _sfx = playSound _sound;
	_sfx spawn
	{
		sleep dur;
		deleteVehicle _this;
	};
};
sleep dur + 5;
