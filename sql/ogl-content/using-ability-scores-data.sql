DELETE FROM difficulty;
DELETE FROM sqlite_sequence where name='difficulty';
INSERT INTO difficulty (difficulty, dc) VALUES ('Very Easy', 5);
INSERT INTO difficulty (difficulty, dc) VALUES ('Easy', 10);
INSERT INTO difficulty (difficulty, dc) VALUES ('Medium', 15);
INSERT INTO difficulty (difficulty, dc) VALUES ('Hard', 20);
INSERT INTO difficulty (difficulty, dc) VALUES ('Very Hard', 25);
INSERT INTO difficulty (difficulty, dc) VALUES ('Nearly Impossible', 30);

DELETE FROM ability;
DELETE FROM sqlite_sequence where name='ability';
INSERT INTO ability (name, explanation, otherChecks) VALUES ('Strength', 'Strength measures bodily power, athletic training, and the extent to which you can exert raw physical force.', 'The GM might also call for a Strength check when you try to accomplish tasks like the following: • Force open a stuck, locked, or barred door • Break free of bonds • Push through a tunnel that is too small • Hang on to a wagon while being dragged behind it • Tip over a statue • Keep a boulder from rolling');
INSERT INTO ability (name, explanation, otherChecks) VALUES ('Dexterity', 'Dexterity measures agility, reflexes, and balance.', 'The GM might call for a Dexterity check when you try to accomplish tasks like the following: • Control a heavily laden cart on a steep descent • Steer a chariot around a tight turn • Pick a lock • Disable a trap • Securely tie up a prisoner • Wriggle free of bonds • Play a stringed instrument • Craft a small or detailed object');
INSERT INTO ability (name, explanation, otherChecks) VALUES ('Constitution', 'Constitution measures health, stamina, and vital force.', 'The GM might call for a Constitution check when you try to accomplish tasks like the following: • Hold your breath • March or labor for hours without rest • Go without sleep • Survive without food or water • Quaff an entire stein of ale in one go');
INSERT INTO ability (name, explanation, otherChecks) VALUES ('Intelligence', 'Intelligence measures mental acuity, accuracy of recall, and the ability to reason.', 'The GM might call for an Intelligence check when you try to accomplish tasks like the following: • Communicate with a creature without using words • Estimate the value of a precious item • Pull together a disguise to pass as a city guard • Forge a document • Recall lore about a craft or trade • Win a game of skill');
INSERT INTO ability (name, explanation, otherChecks) VALUES ('Wisdom', 'Wisdom reflects how attuned you are to the world around you and represents perceptiveness and intuition.', 'The GM might call for a Wisdom check when you try to accomplish tasks like the following: • Get a gut feeling about what course of action to follow • Discern whether a seemingly dead or living creature is undead');
INSERT INTO ability (name, explanation, otherChecks) VALUES ('Charisma', 'Charisma measures your ability to interact effectively with others. It includes such factors as confidence and eloquence, and it can represent a charming or commanding personality.', 'The GM might call for a Charisma check when you try to accomplish tasks like the following: • Find the best person to talk to for news, rumors, and gossip • Blend into a crowd to get the sense of key topics of conversation');
INSERT INTO ability (name, explanation, otherChecks) VALUES ('Any', 'Any ability. [This is used to represent an ASI of the player’s choice. It is used for race ASIs.]','');

DELETE FROM skill;
DELETE FROM sqlite_sequence where name='skill';
INSERT INTO skill (name, abilityID, example) VALUES ('Any', 0, 'Any skill. [This is used only for class proficiencies.]');
INSERT INTO skill (name, abilityID, example) VALUES ('Athletics', 1, ' Your Strength (Athletics) check covers difficult situations you encounter while climbing, jumping, or swimming. Examples include the following activities: • You attempt to climb a sheer or slippery cliff, avoid hazards while scaling a wall, or cling to a surface while something is trying to knock you off.  • You try to jump an unusually long distance or pull off a stunt midjump.  • You struggle to swim or stay afloat in treacherous currents, storm-­‐‑tossed waves, or areas of thick seaweed. Or another creature tries to push or pull you underwater or otherwise interfere with your swimming.');
INSERT INTO skill (name, abilityID, example) VALUES ('Acrobatics', 2, 'Your Dexterity (Acrobatics) check covers your attempt to stay on your feet in a tricky situation, such as when you’re trying to run across a sheet of ice, balance on a tightrope, or stay upright on a rocking ship’s deck. The GM might also call for a Dexterity (Acrobatics) check to see if you can perform acrobatic stunts, including dives, rolls, somersaults, and flips.');
INSERT INTO skill (name, abilityID, example) VALUES ('Sleight of Hand', 2, 'Whenever you attempt an act of legerdemain or manual trickery, such as planting something on someone else or concealing an object on your person, make a Dexterity (Sleight of Hand) check. The GM might also call for a Dexterity (Sleight of Hand) check to determine whether you can lift a coin purse off another person or slip something out of another person’s pocket.');
INSERT INTO skill (name, abilityID, example) VALUES ('Stealth', 2, 'Make a Dexterity (Stealth) check when you attempt to conceal yourself from enemies, slink past guards, slip away without being noticed, or sneak up on someone without being seen or heard.');
INSERT INTO skill (name, abilityID, example) VALUES ('Arcana', 4, 'Your Intelligence (Arcana) check measures your ability to recall lore about spells, magic items, eldritch symbols, magical traditions, the planes of existence, and the inhabitants of those planes.');
INSERT INTO skill (name, abilityID, example) VALUES ('History', 4, 'Your Intelligence (History) check measures your ability to recall lore about historical events, legendary people, ancient kingdoms, past disputes, recent wars, and lost civilizations.');
INSERT INTO skill (name, abilityID, example) VALUES ('Investigation', 4, 'When you look around for clues and make deductions based on those clues, you make an Intelligence (Investigation) check. You might deduce the location of a hidden object, discern from the appearance of a wound what kind of weapon dealt it, or determine the weakest point in a tunnel that could cause it to collapse. Poring through ancient scrolls in search of a hidden fragment of knowledge might also call for an Intelligence (Investigation) check.');
INSERT INTO skill (name, abilityID, example) VALUES ('Nature', 4, 'Your Intelligence (Nature) check measures your ability to recall lore about terrain, plants and animals, the weather, and natural cycles.');
INSERT INTO skill (name, abilityID, example) VALUES ('Religion', 4, 'Your Intelligence (Religion) check measures your ability to recall lore about deities, rites and prayers, religious hierarchies, holy symbols, and the practices of secret cults.');
INSERT INTO skill (name, abilityID, example) VALUES ('Animal Handling', 5, 'When there is any question whether you can calm down a domesticated animal, keep a mount from getting spooked, or intuit an animal’s intentions, the GM might call for a Wisdom (Animal Handling) check. You also make a Wisdom (Animal Handling) check to control your mount when you attempt a risky maneuver.');
INSERT INTO skill (name, abilityID, example) VALUES ('Insight', 5, 'Your Wisdom (Insight) check decides whether you can determine the true intentions of a creature, such as when searching out a lie or predicting someone’s next move. Doing so involves gleaning clues from body language, speech habits, and changes in mannerisms.');
INSERT INTO skill (name, abilityID, example) VALUES ('Medicine', 5, 'A Wisdom (Medicine) check lets you try to stabilize a dying companion or diagnose an illness.');
INSERT INTO skill (name, abilityID, example) VALUES ('Perception', 5, 'Your Wisdom (Perception) check lets you spot, hear, or otherwise detect the presence of something. It measures your general awareness of your surroundings and the keenness of your senses.  For example, you might try to hear a conversation through a closed door, eavesdrop under an open window, or hear monsters moving stealthily in the forest. Or you might try to spot things that are obscured or easy to miss, whether they are orcs lying in ambush on a road, thugs hiding in the shadows of an alley, or candlelight under a closed secret door.');
INSERT INTO skill (name, abilityID, example) VALUES ('Survival', 5, 'The GM might ask you to make a Wisdom (Survival) check to follow tracks, hunt wild game, guide your group through frozen wastelands, identify signs that owlbears live nearby, predict the weather, or avoid quicksand and other natural hazards.');
INSERT INTO skill (name, abilityID, example) VALUES ('Deception', 6, 'Your Charisma (Deception) check determines whether you can convincingly hide the truth, either verbally or through your actions. This deception can encompass everything from misleading others through ambiguity to telling outright lies. Typical situations include trying to fast-­‐‑ talk a guard, con a merchant, earn money through gambling, pass yourself off in a disguise, dull someone’s suspicions with false assurances, or maintain a straight face while telling a blatant lie.');
INSERT INTO skill (name, abilityID, example) VALUES ('Intimidation', 6, 'When you attempt to influence someone through overt threats, hostile actions, and physical violence, the GM might ask you to make a Charisma (Intimidation) check. Examples include trying to pry information out of a prisoner, convincing street thugs to back down from a confrontation, or using the edge of a broken bottle to convince a sneering vizier to reconsider a decision.');
INSERT INTO skill (name, abilityID, example) VALUES ('Performance', 6, 'Your Charisma (Performance) check determines how well you can delight an audience with music, dance, acting, storytelling, or some other form of entertainment.');
INSERT INTO skill (name, abilityID, example) VALUES ('Persuasion', 6, 'When you attempt to influence someone or a group of people with tact, social graces, or good nature, the GM might ask you to make a Charisma (Persuasion) check. Typically, you use persuasion when acting in good faith, to foster friendships, make cordial requests, or exhibit proper etiquette. Examples of persuading others include convincing a chamberlain to let your party see the king, negotiating peace between warring tribes, or inspiring a crowd of townsfolk.');

DELETE FROM travelPace;
DELETE FROM sqlite_sequence where name='travelPace';
INSERT INTO travelPace (name, effect) VALUES ('Fast', '-5 penalty to passive Wisdom (Perception) scores');
INSERT INTO travelPace (name, effect) VALUES ('Normal', 'None');
INSERT INTO travelPace (name, effect) VALUES ('Slow', 'Able to use stealth');

DELETE FROM travel;
DELETE FROM sqlite_sequence where name='travel';
INSERT INTO travel (paceID, distanceID, timeID, quantity) VALUES (1, 2, 3, 400);
INSERT INTO travel (paceID, distanceID, timeID, quantity) VALUES (1, 3, 4, 4);
INSERT INTO travel (paceID, distanceID, timeID, quantity) VALUES (1, 4, 4, 30);
INSERT INTO travel (paceID, distanceID, timeID, quantity) VALUES (2, 2, 3, 300);
INSERT INTO travel (paceID, distanceID, timeID, quantity) VALUES (2, 3, 4, 3);
INSERT INTO travel (paceID, distanceID, timeID, quantity) VALUES (2, 4, 4, 24);
INSERT INTO travel (paceID, distanceID, timeID, quantity) VALUES (3, 2, 3, 200);
INSERT INTO travel (paceID, distanceID, timeID, quantity) VALUES (3, 3, 4, 2);
INSERT INTO travel (paceID, distanceID, timeID, quantity) VALUES (3, 4, 4, 18);
