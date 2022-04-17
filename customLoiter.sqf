/**
 * @ Author: OxyTom
 * @ Create Time: 2021-07-16 20:27:48
 * @ Version: 1.0.0
 * @ Description: Generate waypoints to loiter around start position
 * @ Usage: [this, 500] execVM "scripts\customLoiter.sqf"
 * @ Usage: [this, 500, 12, 40] execVM "scripts\customLoiter.sqf"
 * 						/\ must be > 0
 *
 * Thanks to @Vdauphin#7983 for fixing this mess
 */

params ["_choppa", "_r", ["_increment", 24], ["_initial", 0]];

private _ipos = position _choppa;
for "_angle" from _initial to (360 + _initial) step _increment do {
	private _pos = _ipos getPos [_r, _angle];

	private _wp = group _choppa addWaypoint [_pos, -1, 0];
	// _wp setWaypointCompletionRadius 30;
	if (_angle == _initial) then {
		_wp setWaypointType "CYCLE";
	};
};

