DELETE FROM cantripProgression;
DELETE FROM sqlite_sequence where name='cantripProgression';
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (2, 1, 2);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (2, 4, 3);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (2, 10, 4);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (3, 1, 3);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (3, 4, 4);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (3, 10, 5);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (4, 1, 2);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (4, 4, 3);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (4, 10, 4);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (10, 1, 4);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (10, 4, 5);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (10, 10, 6);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (11, 1, 2);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (11, 4, 3);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (11, 10, 4);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (12, 1, 3);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (12, 4, 4);
INSERT INTO cantripProgression (classID, levelID, amount) VALUES (12, 10, 5);

DELETE FROM spellSlot;
DELETE FROM sqlite_sequence where name='spellSlot';
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (1, 1, 2);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (2, 1, 3);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (3, 1, 4);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (3, 2, 2);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (4, 2, 3);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (5, 3, 2);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (6, 3, 3);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (7, 4, 1);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (8, 4, 2);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (9, 4, 3);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (9, 5, 1);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (10, 5, 2);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (11, 6, 1);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (19, 6, 2);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (13, 7, 1);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (20, 7, 2);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (15, 8, 1);
INSERT INTO spellSlot (levelID, slotLevel, amount) VALUES (17, 9, 1);

DELETE FROM pactSpellSlot;
DELETE FROM sqlite_sequence where name='pactSpellSlot';
INSERT INTO pactSpellSlot (levelID, slotLevel, amount) VALUES (1, 1, 1);
INSERT INTO pactSpellSlot (levelID, slotLevel, amount) VALUES (2, 1, 2);
INSERT INTO pactSpellSlot (levelID, slotLevel, amount) VALUES (3, 2, 2);
INSERT INTO pactSpellSlot (levelID, slotLevel, amount) VALUES (5, 3, 2);
INSERT INTO pactSpellSlot (levelID, slotLevel, amount) VALUES (7, 4, 2);
INSERT INTO pactSpellSlot (levelID, slotLevel, amount) VALUES (9, 5, 2);
INSERT INTO pactSpellSlot (levelID, slotLevel, amount) VALUES (11, 5, 3);
INSERT INTO pactSpellSlot (levelID, slotLevel, amount) VALUES (17, 5, 4);

DELETE FROM innateSpellsKnown;
DELETE FROM sqlite_sequence where name='innateSpellsKnown';
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 1, 4);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 2, 5);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 3, 6);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 4, 7);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 5, 8);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 6, 9);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 7, 10);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 8, 11);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 9, 12);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 10, 14);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 11, 15);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 13, 16);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 14, 18);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 15, 19);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 17, 20);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (2, 18, 22);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (8, 1, 0);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (8, 2, 2);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (8, 3, 3);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (8, 5, 4);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (8, 7, 5);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (8, 9, 6);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (8, 11, 7);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (8, 13, 8);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (8, 15, 9);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (8, 17, 10);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (8, 19, 11);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 1, 2);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 2, 3);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 3, 4);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 4, 5);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 5, 6);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 6, 7);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 7, 8);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 8, 9);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 9, 10);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 10, 11);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 11, 12);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 13, 13);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 15, 14);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (10, 17, 15);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 1, 2);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 2, 3);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 3, 4);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 4, 5);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 5, 6);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 6, 7);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 7, 8);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 8, 9);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 9, 10);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 11, 11);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 13, 12);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 15, 13);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 17, 14);
INSERT INTO innateSpellsKnown (classID, levelID, amount) VALUES (11, 19, 15);
