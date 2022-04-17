/**
 * @ Author: OxyTom
 * @ Create Time: 2021-10-23 23:11:16
 * @ Version: 1.0.0
 * @ Description: Add intel to a document with vanilla framework
 * @ Usage: [this, "TITRE", "DESCRIPTION"] execVM "script\addIntel.sqf";
 *  		[this, "TITRE", "DESCRIPTION", east] execVM "script\addIntel.sqf";
 */

params ["_el", "_title", "_desc", ["_playersSide", west]];

[_el] call BIS_fnc_initIntelObject;

if (isServer) then {
	// Diary picture:
	_el setVariable [
		"RscAttributeDiaryRecord_texture",
		"a3\structures_f_epc\Items\Documents\Data\document_secret_01_co.paa", // Path to picture
		true
	];

	// Diary Title and Description:
	[
		_el,
		"RscAttributeDiaryRecord",
		[_title, _desc]
	] call BIS_fnc_setServerVariable;

	// Diary entry shared with :
	_el setVariable ["recipients", _playersSide, true];

	// Sides that can interact with the intel object:
	_el setVariable ["RscAttributeOwners", [_playersSide], true];
};
