/**
 * @ Author: OxyTom
 * @ Create Time: 2021-07-16 19:21:39
 * @ Version: 1.1.0
 * @ Description: Auto remove AI if there's not enough players
 * @ Usage: [thislist, 12, 4, east] execVM "scripts\autoBalance.sqf";
 * @ Usage: [thislist, 12, 4] execVM "scripts\autoBalance.sqf";
 */

params ["_triggerList", "_maxPlayers", "_minPlayers", ["_playersSide", west]];

// Calculating lowest ratio
// TODO: Not really what I want ?
private _ratio = count(allunits select {!(side _x in [_playersSide, civilian])}) / _maxPlayers;

// Getting number of players
private _players = playersNumber _playersSide;
if (_players == 0) then {
	_players = _minPlayers;
};

{
	// If there's too many hostile
	if (_forEachIndex >= _players * _ratio) then {
		private _unit = selectRandom _triggerList;

		// If true we select someone else. If false delete it.
		while {
			// Avoiding picking the same unit
			damage _unit > 0.9
			// Avoiding removing vehicles if there's someone inside
			|| (!(_unit isKindOf "Man") && {alive _x} count crew _unit != 0)
			// Avoiding removing the leader (except if it's the last man)
			|| (_unit isKindOf "Man" && leader group _unit == _unit && count units group _unit > 1)
		} do {
			_unit = selectRandom _triggerList;
		};

		// Mark it for deletion (cf. first condition of while)
		_unit setDamage 0.9;
		deleteVehicle _unit;
	};
} forEach _triggerList;
