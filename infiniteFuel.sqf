/**
 * @ Author: OxyTom
 * @ Create Time: 2021-07-16 19:11:48
 * @ Version: 1.0.0
 * @ Description: Refuel magicaly a vehicle forever
 * @ Usage: [this] execVM "scripts\infiniteFuel.sqf";
 */

params ['_heli'];

while { alive vehicle _heli } do {
 waitUntil { fuel vehicle _heli < 0.5 };
 vehicle _heli setFuel 1;
};
