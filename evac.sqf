/**
 * @ Author: OxyTom
 * @ Create Time: 2021-07-16 19:53:12
 * @ Version: 1.0.0
 * @ Description: Remove every waypoint of the group _evac (from missionNamespace) that's before the waypoint evac_wp_land
 * @ Usage: [] execVM "scripts\evac.sqf";
 */

private _evacgroup = group (missionNamespace getVariable "_evac");

for "_i" from 0 to count waypoints _evacgroup do {
	// "evac_wp_land" is the waypoint for landing
    if (waypointName [_evacgroup, 0] == "evac_wp_land") exitWith {};
	// Since Waypoints are reindexed, first Waypoint is always something
	deleteWaypoint [_evacgroup, 0];
};
