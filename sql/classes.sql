CREATE TABLE class (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    hitDice INTEGER NOT NULL, 
    hpPerLevelAvg INTEGER NOT NULL,
    numToolProfs INTEGER NOT NULL,
    numSkills INTEGER NOT NULL
);

/* Proficiencies */
CREATE TABLE classArmorProfiency (
    classID REFERENCES class (id),
    armorTypeID REFERENCES armorType (id),
    PRIMARY KEY (classID, armorID)
);

CREATE TABLE classWeaponPropProficiency (
    classID REFERENCES class (id),
    weaponPropertyID REFERENCES weaponProperty (id),
    PRIMARY KEY (classID, weaponID)
);

CREATE TABLE classWeaponProficiency (
    classID REFERENCES class (id),
    weaponID REFERENCES weapon (id),
    PRIMARY KEY (classID, weaponID)
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

/* Equipment */
CREATE TABLE startEquipTbl (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(64) NOT NULL
);

CREATE TABLE startEquipItem (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    /* PK (tableID, itemID) could be possible, but that adds a lot more nullable columns in the other tables. */
    tableID REFERENCES startEquipTbl (id),
    /* I'd prefer an actual FK but I think this is a limitation of only using SQL */
    itemID INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1
);

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

