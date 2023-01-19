/**
 * @ Author: Tova (https://forums.bohemia.net/forums/topic/226608-simple-convoy-script-release/)
 * @ Create Time: 2019-11-21 07:20:02
 * @ Version: 1.0.0
 * @ Description: Start a convoy a AI vehicules
 * @ Usage: convoyScript = [group this, 50, 50, true] execVM "scripts\convoy.sqf";
 *   Once final waypoint is reached :
 *	 terminate convoyScript;
 *	 {
 *	 	(vehicle _x) limitSpeed 5000;
 *	 	(vehicle _x) setUnloadInCombat [true, false];
 *	 } forEach (units convoyGroup);
 *   convoyGroup enableAttack true;
 */


params ["_convoyGroup", ["_convoySpeed", 50], ["_convoySeparation", 50], ["_pushThrough", true]];
if (_pushThrough) then {
	_convoyGroup enableAttack !(_pushThrough);
	{
		(vehicle _x) setUnloadInCombat [false, false];
	} forEach (units _convoyGroup);
};
_convoyGroup setFormation "COLUMN";
{
	(vehicle _x) limitSpeed _convoySpeed*1.15;
	(vehicle _x) setConvoySeparation _convoySeparation;
} forEach (units _convoyGroup);
(vehicle leader _convoyGroup) limitSpeed _convoySpeed;
while { sleep 5; !isNull _convoyGroup } do {
	{
		if ((speed vehicle _x < 5) && (_pushThrough || (behaviour _x != "COMBAT"))) then {
			(vehicle _x) doFollow (leader _convoyGroup);
		};
	} forEach (units _convoyGroup)-(crew (vehicle (leader _convoyGroup)))-allPlayers;
	{
		(vehicle _x) setConvoySeparation _convoySeparation;
	} forEach (units _convoyGroup);
};
