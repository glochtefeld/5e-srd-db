DELETE FROM background;
DELETE FROM sqlite_sequence where name='background';
INSERT INTO background (name, description, featureName, featureDetail, numLanguages, anyLangauge) VALUES ('Acolyte', 'You have spent your life in the service of a temple to a specific god or pantheon of gods. You act as an intermediary between the realm of the holy and the mortal world, performing sacred rites and offering sacrifices in order to conduct worshipers into the presence of the divine. You are not necessarily a cleric—performing sacred rites is not the same thing as channeling divine power.  Not for resale. Permission granted to print or photocopy this document for personal use only.  System Reference Document 5.1 61 Choose a god, a pantheon of gods, or some other quasi-­‐‑divine being from among those listed in "Fantasy-­‐‑Historical Pantheons" or those specified by your GM, and work with your GM to detail the nature of your religious service. Were you a lesser functionary in a temple, raised from childhood to assist the priests in the sacred rites? Or were you a high priest who suddenly experienced a call to serve your god in a different way? Perhaps you were the leader of a small cult outside of any established temple structure, or even an occult group that served a fiendish master that you now deny.', 'Shelter of the Faithful', 'As an acolyte, you command the respect of those who share your faith, and you can perform the religious ceremonies of your deity. You and your adventuring companions can expect to receive free healing and care at a temple, shrine, or other established presence of your faith, though you must provide any material components needed for spells.  Those who share your religion will support you (but only you) at a modest lifestyle.  You might also have ties to a specific temple dedicated to your chosen deity or pantheon, and you have a residence there. This could be the temple where you used to serve, if you remain on good terms with it, or a temple where you have found a new home. While near your temple, you can call upon the priests for assistance, provided the assistance you ask for is not hazardous and you remain in good standing with your temple.', 2, TRUE);

DELETE FROM backgroundSkill;
DELETE FROM sqlite_sequence where name='backgroundSkill';
INSERT INTO backgroundSkill (backgroundID, skillID) VALUES (1, 10);
INSERT INTO backgroundSkill (backgroundID, skillID) VALUES (1, 12);

DELETE FROM backgroundToolType;
DELETE FROM sqlite_sequence where name='backgroundToolType';
INSERT INTO backgroundToolType (backgroundID, toolTypeID, quantity) VALUES (1, 6, 1);

DELETE FROM backgroundEquipment;
DELETE FROM sqlite_sequence where name='backgroundEquipment';
INSERT INTO backgroundEquipment (backgroundID, itemID, quantity, special) VALUES (1, NULL, 1, 'A prayer book or prayer wheel');
INSERT INTO backgroundEquipment (backgroundID, itemID, quantity, special) VALUES (1, 30, 5, NULL);
INSERT INTO backgroundEquipment (backgroundID, itemID, quantity, special) VALUES (1, 39, 1, NULL);
INSERT INTO backgroundEquipment (backgroundID, itemID, quantity, special) VALUES (1, 35, 1, NULL);
INSERT INTO backgroundEquipment (backgroundID, itemID, quantity, special) VALUES (1, 82, 1, NULL);

DELETE FROM backgroundMoney;
DELETE FROM sqlite_sequence where name='backgroundMoney';
INSERT INTO backgroundMoney (backgroundID, coinID, amount) VALUES (1, 1, 15);
