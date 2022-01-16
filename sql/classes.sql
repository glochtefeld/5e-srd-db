CREATE TABLE class (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    hitDice VARCHAR (5) NOT NULL, 
    baseHPAtFirst INTEGER NOT NULL,
    hpPerLevelAvg INTEGER NOT NULL
);

/* Proficiencies */
CREATE TABLE classArmorProfiency (
    classID REFERENCES class (id),
    armorID REFERENCES armor (id),
    PRIMARY KEY (classID, armorID)
);

CREATE TABLE classWeaponProficiency (
    classID REFERENCES class (id),
    weaponID REFERENCES weapon (id),
    PRIMARY KEY (classID, weaponID)
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
    number INTEGER PRIMARY KEY AUTOINCREMENT,
    ordinal VARCHAR(3) NOT NULL,
    proficiencyBonus INTEGER NOT NULL
    /* Prof. bonus is ceil(level/4)+1, but APPARENTLY the python sqlite lib doesn't support it */
);

