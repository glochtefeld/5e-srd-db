DELETE FROM class;
DELETE FROM sqlite_sequence where name='class';
INSERT INTO class (name, hitDice, hpPerLevelAvg, numToolProfs, numSkills, casterTypeID, casterStyleID) VALUES ('Barbarian', 12, 7, 0, 2, 1, 1);
INSERT INTO class (name, hitDice, hpPerLevelAvg, numToolProfs, numSkills, casterTypeID, casterStyleID) VALUES ('Bard', 8, 5, 3, 3, 2, 3);
INSERT INTO class (name, hitDice, hpPerLevelAvg, numToolProfs, numSkills, casterTypeID, casterStyleID) VALUES ('Cleric', 8, 5, 0, 2, 2, 2);
INSERT INTO class (name, hitDice, hpPerLevelAvg, numToolProfs, numSkills, casterTypeID, casterStyleID) VALUES ('Druid', 8, 5, 1, 2, 2, 2);
INSERT INTO class (name, hitDice, hpPerLevelAvg, numToolProfs, numSkills, casterTypeID, casterStyleID) VALUES ('Fighter', 10, 6, 0, 2, 1, 1);
INSERT INTO class (name, hitDice, hpPerLevelAvg, numToolProfs, numSkills, casterTypeID, casterStyleID) VALUES ('Monk', 8, 5, 1, 2, 1, 1);
INSERT INTO class (name, hitDice, hpPerLevelAvg, numToolProfs, numSkills, casterTypeID, casterStyleID) VALUES ('Paladin', 10, 6, 0, 2, 3, 2);
INSERT INTO class (name, hitDice, hpPerLevelAvg, numToolProfs, numSkills, casterTypeID, casterStyleID) VALUES ('Ranger', 10, 6, 0, 3, 3, 3);
INSERT INTO class (name, hitDice, hpPerLevelAvg, numToolProfs, numSkills, casterTypeID, casterStyleID) VALUES ('Rogue', 8, 5, 1, 4, 1, 1);
INSERT INTO class (name, hitDice, hpPerLevelAvg, numToolProfs, numSkills, casterTypeID, casterStyleID) VALUES ('Sorcerer', 6, 4, 0, 2, 2, 3);
INSERT INTO class (name, hitDice, hpPerLevelAvg, numToolProfs, numSkills, casterTypeID, casterStyleID) VALUES ('Warlock', 8, 5, 0, 2, 5, 3);
INSERT INTO class (name, hitDice, hpPerLevelAvg, numToolProfs, numSkills, casterTypeID, casterStyleID) VALUES ('Wizard', 6, 4, 0, 2, 1, 4);

DELETE FROM classArmorProficiency;
DELETE FROM sqlite_sequence where name='classArmorProficiency';
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (1, 1);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (1, 2);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (1, 3);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (1, 5);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (2, 1);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (2, 2);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (3, 1);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (3, 2);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (3, 3);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (3, 5);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (4, 1);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (4, 2);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (4, 3);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (4, 5);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (5, 1);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (5, 2);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (5, 3);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (5, 4);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (5, 5);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (6, 1);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (7, 1);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (7, 2);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (7, 3);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (7, 4);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (7, 5);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (8, 1);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (8, 2);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (8, 3);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (8, 5);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (9, 1);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (9, 2);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (10, 1);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (11, 1);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (11, 2);
INSERT INTO classArmorProficiency (classID, armorTypeID) VALUES (12, 1);

DELETE FROM classWeaponPropProficiency;
DELETE FROM sqlite_sequence where name='classWeaponPropProficiency';
INSERT INTO classWeaponPropProficiency (classID, weaponPropertyID) VALUES (1, 1);
INSERT INTO classWeaponPropProficiency (classID, weaponPropertyID) VALUES (1, 2);
INSERT INTO classWeaponPropProficiency (classID, weaponPropertyID) VALUES (2, 1);
INSERT INTO classWeaponPropProficiency (classID, weaponPropertyID) VALUES (3, 1);
INSERT INTO classWeaponPropProficiency (classID, weaponPropertyID) VALUES (5, 1);
INSERT INTO classWeaponPropProficiency (classID, weaponPropertyID) VALUES (5, 2);
INSERT INTO classWeaponPropProficiency (classID, weaponPropertyID) VALUES (6, 1);
INSERT INTO classWeaponPropProficiency (classID, weaponPropertyID) VALUES (7, 1);
INSERT INTO classWeaponPropProficiency (classID, weaponPropertyID) VALUES (7, 2);
INSERT INTO classWeaponPropProficiency (classID, weaponPropertyID) VALUES (8, 1);
INSERT INTO classWeaponPropProficiency (classID, weaponPropertyID) VALUES (8, 2);
INSERT INTO classWeaponPropProficiency (classID, weaponPropertyID) VALUES (9, 1);
INSERT INTO classWeaponPropProficiency (classID, weaponPropertyID) VALUES (11, 1);

DELETE FROM classWeaponProficiency;
DELETE FROM sqlite_sequence where name='classWeaponProficiency';
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (2, 34);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (2, 22);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (2, 26);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (2, 28);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (4, 1);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (4, 2);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (4, 12);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (4, 5);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (4, 7);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (4, 8);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (4, 27);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (4, 9);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (4, 14);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (4, 10);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (6, 28);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (9, 34);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (9, 22);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (9, 26);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (9, 28);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (10, 2);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (10, 12);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (10, 14);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (10, 8);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (10, 11);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (12, 2);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (12, 12);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (12, 14);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (12, 8);
INSERT INTO classWeaponProficiency (classID, weaponID) VALUES (12, 11);

DELETE FROM classToolTypeProficiency;
DELETE FROM sqlite_sequence where name='classToolTypeProficiency';
INSERT INTO classToolTypeProficiency (classID, toolTypeID) VALUES (2, 9);
INSERT INTO classToolTypeProficiency (classID, toolTypeID) VALUES (6, 7);
INSERT INTO classToolTypeProficiency (classID, toolTypeID) VALUES (6, 9);

DELETE FROM classToolProficiency;
DELETE FROM sqlite_sequence where name='classToolProficiency';
INSERT INTO classToolProficiency (classID, toolID) VALUES (4, 138);
INSERT INTO classToolProficiency (classID, toolID) VALUES (9, 141);

DELETE FROM classSavingThrow;
DELETE FROM sqlite_sequence where name='classSavingThrow';
INSERT INTO classSavingThrow (classID, abilityID) VALUES (1, 1);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (1, 3);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (2, 2);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (2, 6);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (3, 5);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (3, 6);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (4, 4);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (4, 5);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (5, 1);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (5, 3);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (6, 1);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (6, 2);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (7, 5);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (7, 6);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (8, 1);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (8, 2);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (9, 2);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (9, 4);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (10, 3);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (10, 6);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (11, 5);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (11, 6);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (12, 4);
INSERT INTO classSavingThrow (classID, abilityID) VALUES (12, 5);

DELETE FROM classSkill;
DELETE FROM sqlite_sequence where name='classSkill';
INSERT INTO classSkill (classID, skillID) VALUES (1, 11);
INSERT INTO classSkill (classID, skillID) VALUES (1, 2);
INSERT INTO classSkill (classID, skillID) VALUES (1, 17);
INSERT INTO classSkill (classID, skillID) VALUES (1, 9);
INSERT INTO classSkill (classID, skillID) VALUES (1, 14);
INSERT INTO classSkill (classID, skillID) VALUES (1, 15);
INSERT INTO classSkill (classID, skillID) VALUES (2, 1);
INSERT INTO classSkill (classID, skillID) VALUES (3, 7);
INSERT INTO classSkill (classID, skillID) VALUES (3, 12);
INSERT INTO classSkill (classID, skillID) VALUES (3, 13);
INSERT INTO classSkill (classID, skillID) VALUES (3, 19);
INSERT INTO classSkill (classID, skillID) VALUES (3, 10);
INSERT INTO classSkill (classID, skillID) VALUES (4, 6);
INSERT INTO classSkill (classID, skillID) VALUES (4, 11);
INSERT INTO classSkill (classID, skillID) VALUES (4, 12);
INSERT INTO classSkill (classID, skillID) VALUES (4, 13);
INSERT INTO classSkill (classID, skillID) VALUES (4, 9);
INSERT INTO classSkill (classID, skillID) VALUES (4, 14);
INSERT INTO classSkill (classID, skillID) VALUES (4, 10);
INSERT INTO classSkill (classID, skillID) VALUES (4, 15);
INSERT INTO classSkill (classID, skillID) VALUES (5, 3);
INSERT INTO classSkill (classID, skillID) VALUES (5, 11);
INSERT INTO classSkill (classID, skillID) VALUES (5, 2);
INSERT INTO classSkill (classID, skillID) VALUES (5, 7);
INSERT INTO classSkill (classID, skillID) VALUES (5, 12);
INSERT INTO classSkill (classID, skillID) VALUES (5, 17);
INSERT INTO classSkill (classID, skillID) VALUES (5, 14);
INSERT INTO classSkill (classID, skillID) VALUES (5, 15);
INSERT INTO classSkill (classID, skillID) VALUES (6, 3);
INSERT INTO classSkill (classID, skillID) VALUES (6, 2);
INSERT INTO classSkill (classID, skillID) VALUES (6, 7);
INSERT INTO classSkill (classID, skillID) VALUES (6, 12);
INSERT INTO classSkill (classID, skillID) VALUES (6, 10);
INSERT INTO classSkill (classID, skillID) VALUES (6, 5);
INSERT INTO classSkill (classID, skillID) VALUES (7, 2);
INSERT INTO classSkill (classID, skillID) VALUES (7, 12);
INSERT INTO classSkill (classID, skillID) VALUES (7, 17);
INSERT INTO classSkill (classID, skillID) VALUES (7, 13);
INSERT INTO classSkill (classID, skillID) VALUES (7, 19);
INSERT INTO classSkill (classID, skillID) VALUES (7, 10);
INSERT INTO classSkill (classID, skillID) VALUES (8, 11);
INSERT INTO classSkill (classID, skillID) VALUES (8, 2);
INSERT INTO classSkill (classID, skillID) VALUES (8, 12);
INSERT INTO classSkill (classID, skillID) VALUES (8, 8);
INSERT INTO classSkill (classID, skillID) VALUES (8, 9);
INSERT INTO classSkill (classID, skillID) VALUES (8, 14);
INSERT INTO classSkill (classID, skillID) VALUES (8, 5);
INSERT INTO classSkill (classID, skillID) VALUES (8, 15);
INSERT INTO classSkill (classID, skillID) VALUES (9, 3);
INSERT INTO classSkill (classID, skillID) VALUES (9, 2);
INSERT INTO classSkill (classID, skillID) VALUES (9, 16);
INSERT INTO classSkill (classID, skillID) VALUES (9, 12);
INSERT INTO classSkill (classID, skillID) VALUES (9, 17);
INSERT INTO classSkill (classID, skillID) VALUES (9, 8);
INSERT INTO classSkill (classID, skillID) VALUES (9, 14);
INSERT INTO classSkill (classID, skillID) VALUES (9, 18);
INSERT INTO classSkill (classID, skillID) VALUES (9, 19);
INSERT INTO classSkill (classID, skillID) VALUES (9, 4);
INSERT INTO classSkill (classID, skillID) VALUES (9, 5);
INSERT INTO classSkill (classID, skillID) VALUES (10, 6);
INSERT INTO classSkill (classID, skillID) VALUES (10, 16);
INSERT INTO classSkill (classID, skillID) VALUES (10, 12);
INSERT INTO classSkill (classID, skillID) VALUES (10, 17);
INSERT INTO classSkill (classID, skillID) VALUES (10, 19);
INSERT INTO classSkill (classID, skillID) VALUES (10, 10);
INSERT INTO classSkill (classID, skillID) VALUES (11, 6);
INSERT INTO classSkill (classID, skillID) VALUES (11, 16);
INSERT INTO classSkill (classID, skillID) VALUES (11, 7);
INSERT INTO classSkill (classID, skillID) VALUES (11, 17);
INSERT INTO classSkill (classID, skillID) VALUES (11, 8);
INSERT INTO classSkill (classID, skillID) VALUES (11, 9);
INSERT INTO classSkill (classID, skillID) VALUES (11, 10);
INSERT INTO classSkill (classID, skillID) VALUES (12, 6);
INSERT INTO classSkill (classID, skillID) VALUES (12, 7);
INSERT INTO classSkill (classID, skillID) VALUES (12, 12);
INSERT INTO classSkill (classID, skillID) VALUES (12, 8);
INSERT INTO classSkill (classID, skillID) VALUES (12, 13);
INSERT INTO classSkill (classID, skillID) VALUES (12, 10);

DELETE FROM level;
DELETE FROM sqlite_sequence where name='level';
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('st', 2, 0);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('nd', 2, 300);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('rd', 2, 900);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 2, 2700);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 3, 6500);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 3, 14000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 3, 23000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 3, 34000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 4, 48000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 4, 64000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 4, 85000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 4, 100000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 5, 120000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 5, 140000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 5, 165000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 5, 195000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 6, 225000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 6, 265000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 6, 305000);
INSERT INTO level (ordinal, proficiencyBonus, xp) VALUES ('th', 6, 355000);

DELETE FROM casterType;
DELETE FROM sqlite_sequence where name='casterType';
INSERT INTO casterType (name) VALUES ('Mundane');
INSERT INTO casterType (name) VALUES ('Full Caster');
INSERT INTO casterType (name) VALUES ('Half Caster');
INSERT INTO casterType (name) VALUES ('Third Caster');
INSERT INTO casterType (name) VALUES ('Pact Caster');

DELETE FROM casterStyle;
DELETE FROM sqlite_sequence where name='casterStyle';
INSERT INTO casterStyle (name) VALUES ('Mundane');
INSERT INTO casterStyle (name) VALUES ('Prepared');
INSERT INTO casterStyle (name) VALUES ('Innate');
INSERT INTO casterSTyle (name) VALUES ('Spellbook');

DELETE FROM multiclassPrereq;
DELETE FROM sqlite_sequence where name='multiclassPrereq';
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (1, 1, 13, 0);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (2, 6, 13, 0);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (3, 5, 13, 0);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (4, 5, 13, 0);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (5, 1, 13, 1);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (5, 2, 13, 1);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (6, 2, 13, 0);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (6, 5, 13, 0);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (7, 1, 13, 0);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (7, 6, 13, 0);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (8, 2, 13, 0);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (8, 5, 13, 0);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (9, 2, 13, 0);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (10, 6, 13, 0);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (11, 6, 13, 0);
INSERT INTO multiclassPrereq (classID, abilityID, score, optional) VALUES (12, 4, 13, 0);

DELETE FROM multiclassArmorProficiency;
DELETE FROM sqlite_sequence where name='multiclassArmorProficiency';
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (1, 5);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (2, 2);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (3, 2);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (3, 3);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (3, 5);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (4, 2);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (4, 3);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (4, 5);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (5, 2);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (5, 3);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (5, 5);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (7, 2);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (7, 3);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (7, 5);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (8, 2);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (8, 3);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (8, 5);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (9, 2);
INSERT INTO multiclassArmorProficiency (classID, armorTypeID) VALUES (11, 2);

DELETE FROM multiclassWeaponPropProficiency;
DELETE FROM sqlite_sequence where name='multiclassWeaponPropProficiency';
INSERT INTO multiclassWeaponPropProficiency (classID, weaponPropertyID) VALUES (1, 1);
INSERT INTO multiclassWeaponPropProficiency (classID, weaponPropertyID) VALUES (1, 2);
INSERT INTO multiclassWeaponPropProficiency (classID, weaponPropertyID) VALUES (5, 1);
INSERT INTO multiclassWeaponPropProficiency (classID, weaponPropertyID) VALUES (5, 2);
INSERT INTO multiclassWeaponPropProficiency (classID, weaponPropertyID) VALUES (6, 1);
INSERT INTO multiclassWeaponPropProficiency (classID, weaponPropertyID) VALUES (7, 1);
INSERT INTO multiclassWeaponPropProficiency (classID, weaponPropertyID) VALUES (7, 2);
INSERT INTO multiclassWeaponPropProficiency (classID, weaponPropertyID) VALUES (8, 1);
INSERT INTO multiclassWeaponPropProficiency (classID, weaponPropertyID) VALUES (8, 2);
INSERT INTO multiclassWeaponPropProficiency (classID, weaponPropertyID) VALUES (11, 1);

DELETE FROM multiclassWeaponProficiency;
DELETE FROM sqlite_sequence where name='multiclassWeaponProficiency';
INSERT INTO multiclassWeaponProficiency (classID, weaponID) VALUES (6, 28);

DELETE FROM multiclassToolTypeProficiency;
DELETE FROM sqlite_sequence where name='multiclassToolTypeProficiency';
INSERT INTO multiclassToolTypeProficiency (classID, itemTypeID, amount) VALUES (2, 9, 1);

DELETE FROM multiclassToolProficiency;
DELETE FROM sqlite_sequence where name='multiclassToolProficiency';
INSERT INTO multiclassToolProficiency (classID, itemID) VALUES (9, 141);

DELETE FROM multiclassSkillProficiency;
DELETE FROM sqlite_sequence where name='multiclassSkillProficiency';
INSERT INTO multiclassSkillProficiency (classID, anyOneFromClass) VALUES (1, 0);
INSERT INTO multiclassSkillProficiency (classID, anyOneFromClass) VALUES (2, 1);
INSERT INTO multiclassSkillProficiency (classID, anyOneFromClass) VALUES (3, 0);
INSERT INTO multiclassSkillProficiency (classID, anyOneFromClass) VALUES (4, 0);
INSERT INTO multiclassSkillProficiency (classID, anyOneFromClass) VALUES (5, 0);
INSERT INTO multiclassSkillProficiency (classID, anyOneFromClass) VALUES (6, 0);
INSERT INTO multiclassSkillProficiency (classID, anyOneFromClass) VALUES (7, 0);
INSERT INTO multiclassSkillProficiency (classID, anyOneFromClass) VALUES (8, 1);
INSERT INTO multiclassSkillProficiency (classID, anyOneFromClass) VALUES (9, 1);
INSERT INTO multiclassSkillProficiency (classID, anyOneFromClass) VALUES (10, 0);
INSERT INTO multiclassSkillProficiency (classID, anyOneFromClass) VALUES (11, 0);
INSERT INTO multiclassSkillProficiency (classID, anyOneFromClass) VALUES (12, 0);
