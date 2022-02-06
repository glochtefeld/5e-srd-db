INSERT INTO trapDanger (dangerLevel, saveDCLower, saveDCUpper, attackBonusLower, attackBonusUpper) VALUES ('Setback', 10, 11, 3, 5);
INSERT INTO trapDanger (dangerLevel, saveDCLower, saveDCUpper, attackBonusLower, attackBonusUpper) VALUES ('Dangerous', 12, 15, 6, 8);
INSERT INTO trapDanger (dangerLevel, saveDCLower, saveDCUpper, attackBonusLower, attackBonusUpper) VALUES ('Deadly', 16, 20, 9, 12);

INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (4, 1, '1d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (4, 2, '2d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (4, 3, '4d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (10, 1, '2d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (10, 2, '4d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (10, 3, '10d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (16, 1, '4d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (16, 2, '10d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (16, 3, '18d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (20, 1, '10d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (20, 2, '18d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (20, 3, '24d10');

INSERT INTO trapType ('Simple');
INSERT INTO trapType ('Complex');
INSERT INTO trapType ('Mechanical');
INSERT INTO trapType ('Magical');

INSERT INTO trap (name, upperLevel, trapDangerID, description, bc) VALUES ('Collapsing Roof', 10, 2, 'This trap uses a trip wire to collapse the supports keeping an unstable section of a ceiling in place.  The trip wire is 3 inches off the ground and stretches between two support beams. The DC to spot the trip wire is 10. A successful DC 15 Dexterity check using thieves’ tools disables the trip wire harmlessly. A character without thieves’ tools can attempt this check with disadvantage using any edged weapon or edged tool. On a failed check, the trap triggers.  Anyone who inspects the beams can easily determine that they are merely wedged in place. As an action, a character can knock over a beam, causing the trap to trigger.  The ceiling above the trip wire is in bad repair, and anyone who can see it can tell that it’s in danger of collapse.  When the trap is triggered, the unstable ceiling collapses. Any creature in the area beneath the unstable section must succeed on a DC 15 Dexterity saving throw, taking 22 (4d10) bludgeoning damage on a failed save, or half as much damage on a successful one. Once the trap is triggered, the floor of the area is filled with rubble and becomes difficult terrain.', NULL);
INSERT INTO trap (name, upperLevel, trapDangerID, description, bc) VALUES ('Falling Net', 4, 1, 'This trap uses a trip wire to release a net suspended from the ceiling.  The trip wire is 3 inches off the ground and stretches between two columns or trees. The net is hidden by cobwebs or foliage. The DC to spot the trip wire and net is 10. A successful DC 15 Dexterity check using thieves’ tools breaks the trip wire harmlessly. A character without thieves’ tools can attempt this check with disadvantage using any edged weapon or edged tool. On a failed check, the trap triggers.  When the trap is triggered, the net is released, covering a 10-­‐‑foot-­‐‑square area. Those in the area are trapped under the net and restrained, and those that fail a DC 10 Strength saving throw are also knocked prone. A creature can use its action to make a DC 10 Strength check, freeing itself or another creature within its reach on a success. The net has AC 10 and 20 hit points. Dealing 5 slashing damage to the net (AC 10) destroys a 5-­‐‑foot-­‐‑square section of it, freeing any creature trapped in that section.', NULL);
INSERT INTO trap (name, upperLevel, trapDangerID, description, bc) VALUES ('Fire-Breathing Statue', 10, 2, 'This trap is activated when an intruder steps on a hidden pressure plate, releasing a magical gout of flame from a nearby statue. The statue can be of anything, including a dragon or a wizard casting a spell.  The DC is 15 to spot the pressure plate, as well as faint scorch marks on the floor and walls. A spell or other effect that can sense the presence of magic, such as detect magic, reveals an aura of evocation magic around the statue.  The trap activates when more than 20 pounds of weight is placed on the pressure plate, causing the statue to release a 30-­‐‑foot cone of fire. Each creature in the fire must make a DC 13 Dexterity saving throw, taking 22 (4d10) fire damage on a failed save, or half as much damage on a successful one.  Wedging an iron spike or other object under the pressure plate prevents the trap from activating. A successful dispel magic (DC 13) cast on the statue destroys the trap.', NULL);
INSERT INTO trap (name, upperLevel, trapDangerID, description, bc) VALUES ('Simple Pit ', 4, 1, 'A simple pit trap is a hole dug in the ground. The hole is covered by a large cloth anchored on the pit’s edge and camouflaged with dirt and debris.  The DC to spot the pit is 10. Anyone stepping on the cloth falls through and pulls the cloth down into the pit, taking damage based on the pit’s depth (usually 10 feet, but some pits are deeper).', NULL);
INSERT INTO trap (name, upperLevel, trapDangerID, description, bc) VALUES ('Hidden Pit', 4, 1, 'This pit has a cover constructed from material identical to the floor around it.  A successful DC 15 Wisdom (Perception) check discerns an absence of foot traffic over the section of floor that forms the pit’s cover. A successful DC 15 Intelligence (Investigation) check is necessary to confirm that the trapped section of floor is actually the cover of a pit.  When a creature steps on the cover, it swings open like a trapdoor, causing the intruder to spill into the pit below. The pit is usually 10 or 20 feet deep but can be deeper.  Once the pit trap is detected, an iron spike or similar object can be wedged between the pit’s cover and the surrounding floor in such a way as to prevent the cover from opening, thereby making it safe to cross. The cover can also be magically held shut using the arcane lock spell or similar magic.', NULL);
INSERT INTO trap (name, upperLevel, trapDangerID, description, bc) VALUES ('Locking Pit', 4, 1, 'This pit trap is identical to a hidden pit trap, with one key exception: the trap door that covers the pit is spring-­‐‑loaded. After a creature falls into the pit, the cover snaps shut to trap its victim inside.  A successful DC 20 Strength check is necessary to pry the cover open. The cover can also be smashed open. A character in the pit can also attempt to disable the spring mechanism from the inside with a DC 15 Dexterity check using thieves’ tools, provided that the mechanism can be reached and the character can see. In some cases, a mechanism (usually hidden behind a secret door nearby) opens the pit.', NULL);
INSERT INTO trap (name, upperLevel, trapDangerID, description, bc) VALUES ('Spiked Pit', 10, 2, 'This pit trap is a simple, hidden, or locking pit trap with sharpened wooden or iron spikes at the bottom. A creature falling into the pit takes 11 (2d10) piercing damage from the spikes, in addition to any falling damage. Even nastier versions have poison smeared on the spikes. In that case, anyone taking piercing damage from the spikes must also make a DC 13 Constitution saving throw, taking an 22 (4d10) poison damage on a failed save, or half as much damage on a successful one.', NULL);
INSERT INTO trap (name, upperLevel, trapDangerID, description, bc) VALUES ('Poison Darts', 4, 2, 'When a creature steps on a hidden pressure plate, poison-­‐‑tipped darts shoot from spring-­‐‑loaded or pressurized tubes cleverly embedded in the surrounding walls. An area might include multiple pressure plates, each one rigged to its own set of darts.  The tiny holes in the walls are obscured by dust and cobwebs, or cleverly hidden amid bas-­‐‑reliefs, murals, or frescoes that adorn the walls. The DC to spot them is 15. With a successful DC 15 Intelligence (Investigation) check, a character can deduce the presence of the pressure plate from variations in the mortar and stone used to create it, compared to the surrounding floor. Wedging an iron spike or other object under the pressure plate prevents the trap from activating. Stuffing the holes with cloth or wax prevents the darts contained within from launching.  The trap activates when more than 20 pounds of weight is placed on the pressure plate, releasing four darts. Each dart makes a ranged attack with a +8 bonus against a random target within 10 feet of the pressure plate (vision is irrelevant to this attack roll).  (If there are no targets in the area, the darts don’t hit anything.) A target that is hit takes 2 (1d4) piercing damage and must succeed on a DC 15 Constitution saving throw, taking 11 (2d10) poison damage on a failed save, or half as much damage on a successful one.', NULL);
INSERT INTO trap (name, upperLevel, trapDangerID, description, bc) VALUES ('Poison Needle', 4, 2, 'A poisoned needle is hidden within a treasure chest’s lock, or in something else that a creature might open. Opening the chest without the proper key causes the needle to spring out, delivering a dose of poison.  When the trap is triggered, the needle extends 3 inches straight out from the lock. A creature within range takes 1 piercing damage and 11 (2d10) poison damage, and must succeed on a DC 15 Constitution saving throw or be poisoned for 1 hour.  A successful DC 20 Intelligence (Investigation) check allows a character to deduce the trap’s presence from alterations made to the lock to accommodate the needle. A successful DC 15 Dexterity check using thieves’ tools disarms the trap, removing the needle from the lock. Unsuccessfully attempting to pick the lock triggers the trap.', NULL);
INSERT INTO trap (name, upperLevel, trapDangerID, description, bc) VALUES ('Rolling Sphere', 16, 2, 'When 20 or more pounds of pressure are placed on this trap’s pressure plate, a hidden trapdoor in the ceiling opens, releasing a 10-­‐‑foot-­‐‑diameter rolling sphere of solid stone.  With a successful DC 15 Wisdom (Perception) check, a character can spot the trapdoor and pressure plate. A search of the floor accompanied by a successful DC 15 Intelligence (Investigation) check reveals variations in the mortar and stone that betray the pressure plate’s presence. The same check made while inspecting the ceiling notes variations in the stonework that reveal the trapdoor.  Wedging an iron spike or other object under the pressure plate prevents the trap from activating.  Activation of the sphere requires all creatures present to roll initiative. The sphere rolls initiative with a +8 bonus. On its turn, it moves 60 feet in a straight line. The sphere can move through creatures’ spaces, and creatures can move through its space, treating it as difficult terrain. Whenever the sphere enters a creature’s space or a creature enters its space while it’s rolling, that creature must succeed on a DC 15 Dexterity saving throw or take 55 (10d10) bludgeoning damage and be knocked prone.  The sphere stops when it hits a wall or similar barrier. It can’t go around corners, but smart dungeon builders incorporate gentle, curving turns into nearby passages that allow the sphere to keep moving.  As an action, a creature within 5 feet of the sphere can attempt to slow it down with a DC 20 Strength check. On a successful check, the sphere’s speed is reduced by 15 feet. If the sphere’s speed drops to 0, it stops moving and is no longer a threat.', NULL);
INSERT INTO trap (name, upperLevel, trapDangerID, description, bc) VALUES ('Sphere of Annihilation', 20, 3, 'Magical, impenetrable darkness fills the gaping mouth of a stone face carved into a wall. The mouth is 2 feet in diameter and roughly circular. No sound issues from it, no light can illuminate the inside of it, and any matter that enters it is instantly obliterated.  A successful DC 20 Intelligence (Arcana) check reveals that the mouth contains a sphere of annihilation that can’t be controlled or moved. It is otherwise identical to a normal sphere of annihilation.  Some versions of the trap include an enchantment placed on the stone face, such that specified creatures feel an overwhelming urge to approach it and crawl inside its mouth. This effect is otherwise like the sympathy aspect of the antipathy/sympathy spell. A successful dispel magic (DC 18) removes this enchantment.', NULL);

INSERT INTO trapByType (trapID, trapTypeID) VALUES (1, 1);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (1, 3);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (2, 1);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (2, 3);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (3, 1);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (3, 4);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (4, 1);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (4, 3);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (5, 1);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (5, 3);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (6, 1);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (6, 3);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (7, 1);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (7, 3);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (8, 1);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (8, 3);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (9, 1);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (9, 3);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (10, 1);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (10, 3);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (11, 1);
INSERT INTO trapByType (trapID, trapTypeID) VALUES (11, 4);
