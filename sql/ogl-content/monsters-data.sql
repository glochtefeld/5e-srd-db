DELETE FROM monsterType;
DELETE FROM sqlite_sequence where name='monsterType';
INSERT INTO monsterType (name, description) VALUES ('Abberation', 'Aberrations are utterly alien beings. Many of them have innate magical abilities drawn from the creature’s alien mind rather than the mystical forces of the world. The quintessential aberrations are aboleths, beholders, mind flayers, and slaadi.');
INSERT INTO monsterType (name, description) VALUES ('Beast', 'Beasts are nonhumanoid creatures that are a natural part of the fantasy ecology. Some of them have magical powers, but most are unintelligent and lack any society or language. Beasts include all varieties of ordinary animals, dinosaurs, and giant versions of animals.');
INSERT INTO monsterType (name, description) VALUES ('Celestials', 'Celestials are creatures native to the Upper Planes. Many of them are the servants of deities, employed as messengers or agents in the mortal realm and throughout the planes. Celestials are good by nature, so the exceptional celestial who strays from a good alignment is a horrifying rarity.  Celestials include angels, couatls, and pegasi.');
INSERT INTO monsterType (name, description) VALUES ('Construct', 'Constructs are made, not born. Some are programmed by their creators to follow a simple set of instructions, while others are imbued with sentience and capable of independent thought.  Golems are the iconic constructs. Many creatures native to the outer plane of Mechanus, such as modrons, are constructs shaped from the raw material of the plane by the will of more powerful creatures.');
INSERT INTO monsterType (name, description) VALUES ('Dragon', 'Dragons are large reptilian creatures of ancient origin and tremendous power. True dragons, including the good metallic dragons and the evil chromatic dragons, are highly intelligent and have innate magic. Also in this category are creatures distantly related to true dragons, but less powerful, less intelligent, and less magical, such as wyverns and pseudodragons.');
INSERT INTO monsterType (name, description) VALUES ('Elemental', 'Elementals are creatures native to the elemental planes. Some creatures of this type are little more than animate masses of their respective elements, including the creatures simply called elementals.  Others have biological forms infused with elemental energy. The races of genies, including djinn and efreet, form the most important civilizations on the elemental planes. Other elemental creatures include azers and invisible stalkers.');
INSERT INTO monsterType (name, description) VALUES ('Fey', 'Fey are magical creatures closely tied to the forces of nature. They dwell in twilight groves and misty forests. In some worlds, they are closely tied to the Feywild, also called the Plane of Faerie. Some are also found in the Outer Planes, particularly the planes of Arborea and the Beastlands. Fey include dryads, pixies, and satyrs.');
INSERT INTO monsterType (name, description) VALUES ('Fiend', 'Fiends are creatures of wickedness that are native to the Lower Planes. A few are the servants of deities, but many more labor under the leadership of archdevils and demon princes. Evil priests and mages sometimes summon fiends to the material world to do their bidding. If an evil celestial is a rarity, a good fiend is almost inconceivable. Fiends include demons, devils, hell hounds, rakshasas, and yugoloths.');
INSERT INTO monsterType (name, description) VALUES ('Giant', 'Giants tower over humans and their kind. They are humanlike in shape, though some have multiple heads (ettins) or deformities (fomorians). The six varieties of true giant are hill giants, stone giants, frost giants, fire giants, cloud giants, and storm giants. Besides these, creatures such as ogres and trolls are giants.');
INSERT INTO monsterType (name, description) VALUES ('Humanoid', 'Humanoids are the main peoples of a fantasy gaming world, both civilized and savage, including humans and a tremendous variety of other species.  They have language and culture, few if any innate magical abilities (though most humanoids can learn spellcasting), and a bipedal form. The most common humanoid races are the ones most suitable as player characters: humans, dwarves, elves, and halflings.  Almost as numerous but far more savage and brutal, and almost uniformly evil, are the races of goblinoids (goblins, hobgoblins, and bugbears), orcs, gnolls, lizardfolk, and kobolds.');
INSERT INTO monsterType (name, description) VALUES ('Monstrosity', 'Monstrosities are monsters in the strictest sense—frightening creatures that are not ordinary, not truly natural, and almost never benign. Some are the results of magical experimentation gone awry (such as owlbears), and others are the product of terrible curses (including minotaurs and yuan-­‐‑ti).  They defy categorization, and in some sense serve as a catch-­‐‑all category for creatures that don’t fit into any other type.');
INSERT INTO monsterType (name, description) VALUES ('Ooze', 'Oozes are gelatinous creatures that rarely have a fixed shape. They are mostly subterranean, dwelling in caves and dungeons and feeding on refuse, carrion, or creatures unlucky enough to get in their way.  Black puddings and gelatinous cubes are among the most recognizable oozes.  Plants in this context are vegetable creatures, not ordinary flora. Most of them are ambulatory, and some are carnivorous. The quintessential plants are the shambling mound and the treant. Fungal creatures such as the gas spore and the myconid also fall into this category.');
INSERT INTO monsterType (name, description) VALUES ('Undead', 'Undead are once-­‐‑living creatures brought to a horrifying state of undeath through the practice of necromantic magic or some unholy curse. Undead include walking corpses, such as vampires and zombies, as well as bodiless spirits, such as ghosts and specters. ');

DELETE FROM challengeRating;
DELETE FROM sqlite_sequence where name='challengeRating';
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (0, 0, 2);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (0.125, 25, 2);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (0.25, 50, 2);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (0.5, 100, 2);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (1, 200, 2);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (2, 450, 2);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (3, 700, 2);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (4, 1100, 2);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (5, 1800, 3);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (6, 2300, 3);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (7, 2900, 3);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (8, 3900, 3);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (9, 5000, 4);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (10, 5900, 4);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (11, 7200, 4);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (12, 8400, 4);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (13, 10000, 5);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (14, 11500, 5);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (15, 13000, 5);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (16, 15000, 5);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (17, 18000, 6);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (18, 20000, 6);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (19, 22000, 6);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (20, 25000, 6);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (21, 33000, 7);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (22, 41000, 7);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (23, 50000, 7);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (24, 62000, 7);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (25, 75000, 8);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (26, 90000, 8);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (27, 105000, 8);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (28, 120000, 8);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (29, 135000, 9);
INSERT INTO challengeRating (cr, xp, proficiencyBonus) VALUES (30, 155000, 9);
