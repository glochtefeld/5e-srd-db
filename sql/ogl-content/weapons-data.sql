INSERT INTO damageType (name) VALUES ('None');
INSERT INTO damageType (name) VALUES ('bludgeoning');
INSERT INTO damageType (name) VALUES ('piercing');
INSERT INTO damageType (name) VALUES ('slashing');

INSERT INTO weaponProperty (name, description) VALUES('Simple','Most people can use simple weapons with proficiency. These weapons include clubes, maces, and other weapons often found in the hands of commoners.');
INSERT INTO weaponProperty (name, description) VALUES('Martial','Martial weapons, including swords, axes, and polearms, require more specialized training to use effectively. Most warriors use marial weapons because these weapons put thier fighting style and training to the best use.');
INSERT INTO weaponProperty (name, description) VALUES('Ammunition','You can use a weapon that has the ammunition property to make a ranged attack only if you have ammunition to fire from the weapon. Each time you attack with the weapon, you expend one piece of ammunition. Drawing the ammunition from a quiver, case, or other container is part of the attack (you need a free hand to load a one-­‐‑handed weapon).  At the end of the battle, you can recover half your expended ammunition by taking a minute to search the battlefield.  If you use a weapon that has the ammunition property to make a melee attack, you treat the weapon as an improvised weapon (see “Improvised Weapons” later in the section). A sling must be loaded to deal any damage when used in this way.');
INSERT INTO weaponProperty (name, description) VALUES('Finesse','When making an attack with a finesse weapon, you use your choice of your Strength or Dexterity modifier for the attack and damage rolls.  You must use the same modifier for both rolls.');
INSERT INTO weaponProperty (name, description) VALUES('Heavy','Small creatures have disadvantage on attack rolls with heavy weapons. A heavy weapon’s size and bulk make it too large for a Small creature to use effectively.');
INSERT INTO weaponProperty (name, description) VALUES('Light','A light weapon is small and easy to handle, making it ideal for use when fighting with two weapons.');
INSERT INTO weaponProperty (name, description) VALUES('Loading','Because of the time required to load this weapon, you can fire only one piece of ammunition from it when you use an action, bonus action, or reaction to fire it, regardless of the number of attacks you can normally make.');
INSERT INTO weaponProperty (name, description) VALUES('Range','A weapon that can be used to make a ranged attack has a range in parentheses after the ammunition or thrown property. The range lists two numbers. The first is the weapon’s normal range in feet, and the second indicates the weapon’s long range. When attacking a target beyond normal range, you have disadvantage on the attack roll. You can’t attack a target beyond the weapon’s long range.');
INSERT INTO weaponProperty (name, description) VALUES ('Reach','This weapon adds 5 feet to your reach when you attack with it, as well as when determining your reach for opportunity attacks with it.');
INSERT INTO weaponProperty (name, description) VALUES ('Thrown','If a weapon has the thrown property, you can throw the weapon to make a ranged attack. If the weapon is a melee weapon, you use the same ability modifier for that attack roll and damage roll that you would use for a melee attack with the weapon. For example, if you throw a handaxe, you use your Strength, but if you throw a dagger, you can use either your Strength or your Dexterity, since the dagger has the finesse property.');
INSERT INTO weaponProperty (name, description) VALUES ('Two-Handed','This weapon requires two hands when you attack with it.');
INSERT INTO weaponProperty (name, description) VALUES ('Versatile','This weapon can be used with one or two hands. A damage value in parentheses appears with the property—the damage when the weapon is used with two hands to make a melee attack.');
INSERT INTO weaponProperty (name, description) VALUES ('Lance','You have disadvantage when you use a lance to attack a target within 5 feet of you. Also, a lance requires two hands to wield when you aren’t mounted.');
INSERT INTO weaponProperty (name, description) VALUES ('Net','A Large or smaller creature hit by a net is restrained until it is freed. A net has no effect on creatures that are formless, or creatures that are Huge or larger. A creature can use its action to make a DC 10 Strength check, freeing itself or another creature within its reach on a success. Dealing 5 slashing damage to the net (AC 10) also frees the creature without harming it, ending the effect and destroying the net.  When you use an action, bonus action, or reaction to attack with a net, you can make only one attack regardless of the number of attacks you can normally make. ');

INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Club', 0.1, 2, '1d4', 2);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Dagger', 2, 3, '1d4', 1);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Greatclub', 0.2, 2, '1d8', 10);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Handaxe', 5, 4, '1d6', 2);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Javelin', 5, 3, '1d6', 2);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Light hammer', 3, 2, '1d4', 2);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Mace', 5, 2, '1d6', 4);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Quarterstaff', 0.2, 2, '1d6', 4);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Sickle', 1, 4, '1d4', 2);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Spear', 1, 3, '1d6', 3);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Crossbow, light', 25, 3,'1d8', 5);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Dart', 0.05, 3, '1d4', 0.25);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Shortbow', 25, 3, '1d6', 2);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Sling', 1, 2, '1d4', 0);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Battleaxe', 10, 4, '1d8', 4);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Flail', 10, 2, '1d8', 2);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Glaive', 20, 4, '1d10', 6);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Greataxe', 30, 4, '1d12', 7);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Greatsword', 50, 4, '2d6', 6);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Halberd', 20, 4, '1d10', 6);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Lance', 10, 3, '1d12', 6);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Longsword', 15, 4, '1d8', 3);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Maul', 10, 2, '2d6', 10);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Morningstar', 15, 3, '1d8', 4);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Pike', 5, 3, '1d10', 18);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Rapier', 25, 3, '1d8', 2);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Scimitar', 25, 4, '1d6', 3);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Shortsword', 10, 3, '1d6', 2);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Trident', 5, 3, '1d6', 4);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('War pick', 5, 3, '1d8', 2);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Warhammer', 15, 2, '1d8', 2);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Whip', 2, 4, '1d4', 3);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Blowgun', 10, 3, '1d1', 1);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Crossbow, hand', 75, 3,'1d6', 3);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Crossbow, heavy', 50, 3, '1d10', 18);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Longbow', 50, 3, '1d8', 2);
INSERT INTO weapon (name, cost, damageTypeID, dice, weight) VALUES ('Net', 1, NULL, 1, 3);

1, 1 
1, 6 
2, 1
2, 4 
2, 6 
2, 10, 20, 60
3, 1
3, 11
4, 1
4, 6
4, 10, 20, 60
5, 1
5, 10, 30, 120
6, 1
6, 6
6, 10, 20, 60
8, 1
8, versatile '1d8'
9, 1 
9, 6 
10, 1
10, 10, 20, 60
10, versatile '1d8'
11, 1
11, Ammunition (range 80/320), loading, 11
12, 1
12, 4
12, 10, 20, 60
13, 1
13, Ammunition (range 80/320), 11
14, 1
14, Ammunition (range 30/120)
15, Versatile '1d10' -- MM
17, 5, reach, 11
18, 5, 11
19, 5, 11
20, 5, reach, 11
21, Reach, 13
22, Versatile '1d10'
23, 5, 11
25, 5, reach, 11
26, 4
27, 4, 6
28, 4, 6
29, 10 (range 20/60), versatile '1d8'
31, Versatile '1d10'
32, 4, reach
33, Ammunition (range 25/100), loading
34, Ammunition (range 30/120), 6, loading
35, Ammunition (range 100/400), 5, loading, 11
36, Ammunition (range 150/600), 5, 11
37, 14, 10 (range 5/15)
