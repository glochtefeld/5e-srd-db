INSERT INTO coin (name, exchangeRate) VALUES ('Gold', 1);
INSERT INTO coin (name, exchangeRate) VALUES ('Copper', 100);
INSERT INTO coin (name, exchangeRate) VALUES ('Silver', 10);
INSERT INTO coin (name, exchangeRate) VALUES ('Electrum', 0.5);
INSERT INTO coin (name, exchangeRate) VALUES ('Platinum', 0.1);

INSERT INTO armorType (name, donTimeID, donTime, doffTimeID, doffTime) VALUES ('None',6,1,5,1);
INSERT INTO armorType (name, donTimeID, donTime, doffTimeID, doffTime) VALUES ('Light', 6, 1, 6, 1);
INSERT INTO armorType (name, donTimeID, donTime, doffTimeID, doffTime) VALUES ('Medium', 6, 5, 6, 1);
INSERT INTO armorType (name, donTimeID, donTime, doffTimeID, doffTime) VALUES ('Heavy', 6, 10, 6, 5);
INSERT INTO armorType (name, donTimeID, donTime, doffTimeID, doffTime) VALUES ('Shield', 1, 1, 1, 1);

INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (1, 'No Armor', 0, 10, 100, NULL, FALSE, 0);
INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (2, 'Padded', 5, 1, 100, NULL, TRUE, 8);
INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (2, 'Leather', 10, 1, 100, NULL, FALSE, 10);
INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (2, 'Studded leather', 45, 2, 100, NULL, FALSE, 13);
INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (3, 'Hide', 10, 2, 2, NULL, FALSE, 12);
INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (3, 'Chain shirt', 50, 3, 2, NULL, FALSE, 20);
INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (3, 'Scale mail', 50, 4, 2, NULL, TRUE, 45);
INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (3, 'Breastplate', 400, 4, 2, NULL, FALSE, 20);
INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (3, 'Half plate', 750, 5, 2, NULL, TRUE, 40);
INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (4, 'Ring mail', 30, 4, NULL, NULL, TRUE, 40);
INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (4, 'Chain mail', 75, 6, NULL, 13, TRUE, 55);
INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (4, 'Splint', 200, 7, NULL, 15, TRUE, 60);
INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (4, 'Plate', 1500, 8, NULL, 15, TRUE, 65);
INSERT INTO armor (typeID, name, cost, acBonus, maxDexMod, minStrength, stealthPenalty, weight) VALUES (5, 'Shield', 10, 2, NULL, NULL, FALSE, 6);
