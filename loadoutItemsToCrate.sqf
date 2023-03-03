/**
 * @ Author: OxyTom
 * @ Create Time: 2023-03-03 17:15:22
 * @ Version: 1.0.1
 * @ Description: Add the content of a loadout (exported with ACE Arsenal) in a object compatible with `addItemCargo`
 * @ Usage: [this, "loadout.json"] execVM "loadoutItemsToCrate.sqf";
 */

params ["_crate", "_loadoutPath"];

private _loadout = call compile loadFile _loadoutPath;

_fnc_recursiveAddItemsToCrate =
{
	params ["_crate", "_items"];

	private ["_item", "_quantity", "_val"];

	{
		_item = nil;
		_quantity = nil;

		// if current is a an array of 2 (or more)
		if (_x isEqualType [] && count _x >= 2) then {
			_item = _x#0;
			_val = _x#1;

			// if second element is a number: it's probably a quantity
			if (_val isEqualType 0) then {
				_quantity = _val;
			};

			// if second element is an array: then keep searching for items
			if (_val isEqualType []) then {
				[_crate, _val] call OXY_fnc_recursiveAddItemsToCrate;
			};
		};

		// if current is a string: it's probably a classname
		if (_x isEqualType "") then {
			_item = _x;
		};

		// if an item was found and is a valid string (hoping it's a valid classname)
		if (!isNil "_item" && { _item isEqualType "" && count _item > 0 }) then {
			if (isNil "_quantity") then {
				_quantity = 1;
			};

			if (_quantity > 0) then {
				_crate addItemCargoGlobal [_item, _quantity];
			};
		};
	} forEach _items;
};

[_crate, _loadout] call _fnc_recursiveAddItemsToCrate;
