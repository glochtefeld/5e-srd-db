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

CREATE TABLE level (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ordinal VARCHAR(3) NOT NULL,
    proficiencyBonus INTEGER NOT NULL,
    xp INTEGER NOT NULL
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
CREATE TABLE classFightingStyle (
    classID REFERENCES class (id),
    fightingStyleID REFERENCES fightingStyle (id)
);

CREATE TABLE multiclassPrereq (
    classID REFERENCES class (id),
    abilityID REFERENCES ability (id),
    score INTEGER NOT NULL,
    optional BOOLEAN NOT NULL, /* Logical OR, one prereq must be satisfied */
    PRIMARY KEY (classID, abilityID)
);

CREATE TABLE multiclassArmorProficiency (
    classID REFERENCES class (id),
    armorTypeID REFERENCES armorType (id),
    PRIMARY KEY (classID, armorTypeID)
);

CREATE TABLE multiclassWeaponPropProficiency (
    classID REFERENCES class (id),
    weaponTypeID REFERENCES weaponType (id),
    PRIMARY KEY (classID, weaponTypeID)
);

CREATE TABLE multiclassWeaponProficiency (
    classID REFERENCES class (id),
    weaponID REFERENCES weapon (id),
    PRIMARY KEY (classID, weaponID)
);

CREATE TABLE multiclassToolTypeProficiency (
    classID REFERENCES class (id),
    itemTypeID REFERENCES itemType (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (classID, itemTypeID)
);

CREATE TABLE multiclassToolProficiency (
    classID REFERENCES class (id),
    itemID REFERENCES item (id),
    PRIMARY KEY (classID, itemID)
);

CREATE TABLE multiclassSkillProficiency (
    classID REFERENCES class (id) PRIMARY KEY,
    anyOneFromClass BOOLEAN NOT NULL
);
