DROP TABLE IF EXISTS class;
CREATE TABLE class (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    hitDice INTEGER NOT NULL, 
    hpPerLevelAvg INTEGER NOT NULL,
    numToolProfs INTEGER NOT NULL,
    numSkills INTEGER NOT NULL,
    casterTypeID INTEGER REFERENCES casterType (id),
    casterStyleID INTEGER REFERENCES casterStyle (id)
);

DROP TABLE IF EXISTS classArmorProficiency;
CREATE TABLE classArmorProficiency (
    classID INTEGER REFERENCES class (id),
    armorTypeID INTEGER REFERENCES armorType (id),
    PRIMARY KEY (classID, armorTypeID)
);

DROP TABLE IF EXISTS classWeaponPropProficiency;
CREATE TABLE classWeaponPropProficiency (
    classID INTEGER REFERENCES class (id),
    weaponPropertyID INTEGER REFERENCES weaponProperty (id),
    PRIMARY KEY (classID, weaponPropertyID)
);

DROP TABLE IF EXISTS classWeaponProficiency;
CREATE TABLE classWeaponProficiency (
    classID INTEGER REFERENCES class (id),
    weaponID INTEGER REFERENCES weapon (id),
    PRIMARY KEY (classID, weaponID)
);

DROP TABLE IF EXISTS classToolTypeProficiency;
CREATE TABLE classToolTypeProficiency (
    classID INTEGER REFERENCES class (id),
    toolTypeID INTEGER REFERENCES itemType (id),
    PRIMARY KEY (classID, toolTypeID)
);

DROP TABLE IF EXISTS classToolProficiency;
CREATE TABLE classToolProficiency (
    classID INTEGER REFERENCES class (id),
    toolID INTEGER REFERENCES item (id),
    PRIMARY KEY (classID, toolID)
);

DROP TABLE IF EXISTS classSavingThrow;
CREATE TABLE classSavingThrow (
    classID INTEGER REFERENCES class (id),
    abilityID INTEGER REFERENCES ability (id),
    PRIMARY KEY (classID, abilityID)
);

DROP TABLE IF EXISTS classSkill;
CREATE TABLE classSkill (
    classID INTEGER REFERENCES class (id),
    skillID INTEGER REFERENCES skill (id),
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
    classID INTEGER REFERENCES class (id),
    fightingStyleID INTEGER REFERENCES fightingStyle (id)
);

DROP TABLE IF EXISTS multiclassPrereq;
CREATE TABLE multiclassPrereq (
    classID INTEGER REFERENCES class (id),
    abilityID INTEGER REFERENCES ability (id),
    score INTEGER NOT NULL,
    /* Logical OR, one prereq must be satisfied */
    optional BOOLEAN NOT NULL,
    PRIMARY KEY (classID, abilityID)
);

DROP TABLE IF EXISTS multiclassArmorProficiency;
CREATE TABLE multiclassArmorProficiency (
    classID INTEGER REFERENCES class (id),
    armorTypeID INTEGER REFERENCES armorType (id),
    PRIMARY KEY (classID, armorTypeID)
);

DROP TABLE IF EXISTS multiclassWeaponPropProficiency;
CREATE TABLE multiclassWeaponPropProficiency (
    classID INTEGER REFERENCES class (id),
    weaponPropertyID INTEGER REFERENCES weaponProperty (id),
    PRIMARY KEY (classID, weaponPropertyID)
);

DROP TABLE IF EXISTS multiclassWeaponProficiency;
CREATE TABLE multiclassWeaponProficiency (
    classID INTEGER REFERENCES class (id),
    weaponID INTEGER REFERENCES weapon (id),
    PRIMARY KEY (classID, weaponID)
);

DROP TABLE IF EXISTS multiclassToolTypeProficiency;
CREATE TABLE multiclassToolTypeProficiency (
    classID INTEGER REFERENCES class (id),
    itemTypeID INTEGER REFERENCES itemType (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (classID, itemTypeID)
);

DROP TABLE IF EXISTS multiclassToolProficiency;
CREATE TABLE multiclassToolProficiency (
    classID INTEGER REFERENCES class (id),
    itemID INTEGER REFERENCES item (id),
    PRIMARY KEY (classID, itemID)
);

DROP TABLE IF EXISTS multiclassSkillProficiency;
CREATE TABLE multiclassSkillProficiency (
    classID INTEGER REFERENCES class (id) PRIMARY KEY,
    anyOneFromClass BOOLEAN NOT NULL
);
