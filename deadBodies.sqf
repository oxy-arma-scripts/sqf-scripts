/**
 * @ Author: OxyTom
 * @ Create Time: 2021-10-23 23:40:38
 * @ Version: 1.0.0
 * @ Description: Make dead bodies bleed for immersion.
 * @ Usage: [thislist] execVM "scripts\deadBodies.sqf";
 */

params ["_triggerList"];

{
  if(_x isKindOf "Man") then {
   _x setdamage 0.25;
   _x setBleedingRemaining 60;
   _x setdamage 1;
  }
} forEach _triggerList;
