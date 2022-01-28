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

/* Proficiencies */
CREATE TABLE classArmorProficiency (
    classID REFERENCES class (id),
    armorTypeID REFERENCES armorType (id),
    PRIMARY KEY (classID, armorTypeID)
);

CREATE TABLE classWeaponPropProficiency (
    classID REFERENCES class (id),
    weaponPropertyID REFERENCES weaponProperty (id),
    PRIMARY KEY (classID, weaponPropertyID)
);

CREATE TABLE classWeaponProficiency (
    classID REFERENCES class (id),
    weaponID REFERENCES weapon (id),
    PRIMARY KEY (classID, weaponID)
);

CREATE TABLE classToolTypeProficiency (
    classID REFERENCES class (id),
    toolTypeID REFERENCES itemType (id),
    PRIMARY KEY (classID, toolTypeID)
);

CREATE TABLE classToolProficiency (
    classID REFERENCES class (id),
    toolID REFERENCES item (id),
    PRIMARY KEY (classID, toolID)
);

CREATE TABLE classSavingThrow (
    classID REFERENCES class (id),
    abilityID REFERENCES ability (id),
    PRIMARY KEY (classID, abilityID)
);

CREATE TABLE classSkill (
    classID REFERENCES class (id),
    skillID REFERENCES skill (id),
    PRIMARY KEY (classID, skillID)
);

/* Equipment. This is a section that is extremely difficult to make with just raw SQL:
 Classes have a choice between sets of items of variable length.
 These items can come from three different tables.
 The simplest solution is to just store everything as text, but that's barely a solution.
 The best solution I can think of is these four tables and punting the problem forward to software.
 I'm not the biggest fan of the idea but I want to avoid duplicating data.
 */
CREATE TABLE startEquipTbl (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(64) NOT NULL
);

CREATE TABLE startEquipItem (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    /* PK (tableID, itemID) could be possible, but that adds a lot more nullable columns in the other tables. */
    tableID REFERENCES startEquipTbl (id),
    itemID INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1
);

/* Any items from the weaponProperty table should be intersected with each other. */
CREATE TABLE startEquipBundle (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    item1ID REFERENCES startEquipItem (id),
    item2ID REFERENCES startEquipItem (id) DEFAULT NULL,
    item3ID REFERENCES startEquipItem (id) DEFAULT NULL
);

CREATE TABLE classBundleOption (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    classID REFERENCES class (id),
    bundle1ID REFERENCES startEquipBundle (id),
    bundle2ID REFERENCES startEquipBundle (id) DEFAULT NULL,
    bundle3ID REFERENCES startEquipBundle (id) DEFAULT NULL
);

CREATE TABLE level (
    number INTEGER PRIMARY KEY AUTOINCREMENT,
    ordinal VARCHAR(3) NOT NULL,
    proficiencyBonus INTEGER NOT NULL
    /* Prof. bonus is ceil(level/4)+1, but APPARENTLY the python sqlite lib doesn't support it */
);

CREATE TABLE casterType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE casterStyle (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE metamagicOption (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    description VARCHAR(500) NOT NULL
);

CREATE TABLE fightingStyle (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(25) NOT NULL,
    description VARCHAR(500) NOT NULL
);

CREATE TABLE pactBoon (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    description VARCHAR(500) NOT NULL
);

CREATE TABLE warlockInvocation (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    levelPrereq REFERENCES level (id) DEFAULT NULL,
    otherPrereq VARCHAR(50) DEFAULT NULL,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(500) NOT NULL
);

CREATE TABLE classFightingStyle (
    classID REFERENCES class (id),
    fightingStyleID REFERENCES fightingStyle (id)
);

CREATE TABLE classFeature (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    classID REFERENCES class (id),
    levelID REFERENCES level (id),
    name VARCHAR(50) NOT NULL,
    description VARCHAR(5000) NOT NULL
);
