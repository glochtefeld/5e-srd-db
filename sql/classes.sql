DROP TABLE IF EXISTS class;
CREATE TABLE class (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    hitDice INTEGER NOT NULL, 
    hpPerLevelAvg INTEGER NOT NULL,
    numToolProfs INTEGER NOT NULL,
    numSkills INTEGER NOT NULL,
    casterTypeID REFERENCES casterType (id),
    casterStyleID REFERENCES casterStyle (id)
);

DROP TABLE IF EXISTS classArmorProficiency;
CREATE TABLE classArmorProficiency (
    classID REFERENCES class (id),
    armorTypeID REFERENCES armorType (id),
    PRIMARY KEY (classID, armorTypeID)
);

DROP TABLE IF EXISTS classWeaponPropProficiency;
CREATE TABLE classWeaponPropProficiency (
    classID REFERENCES class (id),
    weaponPropertyID REFERENCES weaponProperty (id),
    PRIMARY KEY (classID, weaponPropertyID)
);

DROP TABLE IF EXISTS classWeaponProficiency;
CREATE TABLE classWeaponProficiency (
    classID REFERENCES class (id),
    weaponID REFERENCES weapon (id),
    PRIMARY KEY (classID, weaponID)
);

DROP TABLE IF EXISTS classToolTypeProficiency;
CREATE TABLE classToolTypeProficiency (
    classID REFERENCES class (id),
    toolTypeID REFERENCES itemType (id),
    PRIMARY KEY (classID, toolTypeID)
);

DROP TABLE IF EXISTS classToolProficiency;
CREATE TABLE classToolProficiency (
    classID REFERENCES class (id),
    toolID REFERENCES item (id),
    PRIMARY KEY (classID, toolID)
);

DROP TABLE IF EXISTS classSavingThrow;
CREATE TABLE classSavingThrow (
    classID REFERENCES class (id),
    abilityID REFERENCES ability (id),
    PRIMARY KEY (classID, abilityID)
);

DROP TABLE IF EXISTS classSkill;
CREATE TABLE classSkill (
    classID REFERENCES class (id),
    skillID REFERENCES skill (id),
    PRIMARY KEY (classID, skillID)
);

DROP TABLE IF EXISTS level;
CREATE TABLE level (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ordinal VARCHAR(3) NOT NULL,
    proficiencyBonus INTEGER NOT NULL,
    xp INTEGER NOT NULL
    /* note: Prof. bonus is ceil(level/4)+1, but APPARENTLY the python sqlite lib doesn't support it */
);

DROP TABLE IF EXISTS casterType;
CREATE TABLE casterType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS casterStyle;
CREATE TABLE casterStyle (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS classFightingStyle;
CREATE TABLE classFightingStyle (
    classID REFERENCES class (id),
    fightingStyleID REFERENCES fightingStyle (id)
);

DROP TABLE IF EXISTS multiclassPrereq;
CREATE TABLE multiclassPrereq (
    classID REFERENCES class (id),
    abilityID REFERENCES ability (id),
    score INTEGER NOT NULL,
    /* Logical OR, one prereq must be satisfied */
    optional BOOLEAN NOT NULL,
    PRIMARY KEY (classID, abilityID)
);

DROP TABLE IF EXISTS multiclassArmorProficiency;
CREATE TABLE multiclassArmorProficiency (
    classID REFERENCES class (id),
    armorTypeID REFERENCES armorType (id),
    PRIMARY KEY (classID, armorTypeID)
);

DROP TABLE IF EXISTS multiclassWeaponPropProficiency;
CREATE TABLE multiclassWeaponPropProficiency (
    classID REFERENCES class (id),
    weaponPropertyID REFERENCES weaponProperty (id),
    PRIMARY KEY (classID, weaponPropertyID)
);

DROP TABLE IF EXISTS multiclassWeaponProficiency;
CREATE TABLE multiclassWeaponProficiency (
    classID REFERENCES class (id),
    weaponID REFERENCES weapon (id),
    PRIMARY KEY (classID, weaponID)
);

DROP TABLE IF EXISTS multiclassToolTypeProficiency;
CREATE TABLE multiclassToolTypeProficiency (
    classID REFERENCES class (id),
    itemTypeID REFERENCES itemType (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (classID, itemTypeID)
);

DROP TABLE IF EXISTS multiclassToolProficiency;
CREATE TABLE multiclassToolProficiency (
    classID REFERENCES class (id),
    itemID REFERENCES item (id),
    PRIMARY KEY (classID, itemID)
);

DROP TABLE IF EXISTS multiclassSkillProficiency;
CREATE TABLE multiclassSkillProficiency (
    classID REFERENCES class (id) PRIMARY KEY,
    anyOneFromClass BOOLEAN NOT NULL
);
