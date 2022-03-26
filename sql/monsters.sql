DROP TABLE IF EXISTS monsterType;
CREATE TABLE monsterType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(25) NOT NULL,
    description VARCHAR(500) NOT NULL
);

DROP TABLE IF EXISTS challengeRating;
CREATE TABLE challengeRating (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cr DECIMAL NOT NULL,
    display VARCHAR(5) NOT NULL,
    xp INTEGER NOT NULL,
    proficiencyBonus INTEGER NOT NULL
);

DROP TABLE IF EXISTS movementType;
CREATE TABLE movementType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(15) NOT NULL
);

DROP TABLE IF EXISTS sense;
CREATE TABLE sense (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS monster;
CREATE TABLE monster (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    sizeID INTEGER REFERENCES creatureSize (id),
    monsterTypeID INTEGER REFERENCES monsterType (id),
    otherTypes VARCHAR(30) NOT NULL DEFAULT '',
    alignmentID INTEGER REFERENCES alignment (id),
    ac INTEGER NOT NULL DEFAULT 10,
    hp INTEGER NOT NULL DEFAULT 1,
    hpFormula VARCHAR(10) NOT NULL,
    passivePerception INTEGER NOT NULL,
    telepathy BOOLEAN NOT NULL DEFAULT FALSE,
    challengeID INTEGER REFERENCES challengeRating (id),
    multiattack INTEGER NOT NULL DEFAULT 0,
    legendaryActionsCount INTEGER NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS monsterSpeed;
CREATE TABLE monsterSpeed (
    monsterID INTEGER REFERENCES monster (id),
    movementTypeID INTEGER REFERENCES movementType (id),
    amount INTEGER NOT NULL,
    measureID INTEGER REFERENCES distance (id),
    qualifier VARCHAR(25) NOT NULL DEFAULT '',
    PRIMARY KEY (monsterID, movementTypeID)
);

DROP TABLE IF EXISTS monsterAbility;
CREATE TABLE monsterAbility (
    monsterID INTEGER REFERENCES monster (id),
    abilityID INTEGER REFERENCES ability(id),
    score INTEGER NOT NULL DEFAULT 10,
    PRIMARY KEY (monsterID, abilityID)
);

DROP TABLE IF EXISTS monsterSave;
CREATE TABLE monsterSave (
    monsterID INTEGER REFERENCES monster (id),
    abilityID INTEGER REFERENCES ability(id),
    saveBonus INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (monsterID, abilityID)

);

DROP TABLE IF EXISTS monsterSkill;
CREATE TABLE monsterSkill (
    monsterID INTEGER REFERENCES monster (id),
    skillID INTEGER REFERENCES skill (id),
    bonus INTEGER NOT NULL DEFAULT 0,
    PRIMARY KEY (monsterID, skillID)
);

DROP TABLE IF EXISTS monsterSense;
CREATE TABLE monsterSense (
    monsterID INTEGER REFERENCES monster (id),
    senseID INTEGER REFERENCES sense (id),
    range INTEGER NOT NULL,
    measureID INTEGER REFERENCES distance (id),
    PRIMARY KEY (monsterID, senseID)
);

DROP TABLE IF EXISTS monsterLanguage;
CREATE TABLE monsterLanguage (
    monsterID INTEGER REFERENCES monster (id),
    languageID INTEGER REFERENCES language (id),
    canSpeak BOOLEAN NOT NULL DEFAULT 0,
    PRIMARY KEY (monsterID, languageID)
);

DROP TABLE IF EXISTS monsterDamageModifier;
CREATE TABLE monsterDamageModifier (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    monsterID INTEGER REFERENCES monster (id),
    damageTypeID INTEGER REFERENCES damageType (id),
    onlyNonmagical BOOLEAN NOT NULL DEFAULT 0,
    exceptNMSilver BOOLEAN NOT NULL DEFAULT 0,
    exceptNMAdamantine BOOLEAN NOT NULL DEFAULT 0,
    magicalGood BOOLEAN NOT NULL DEFAULT 0,
    fromSpell BOOLEAN NOT NULL DEFAULT 0,
    dmgMultiplier DECIMAL(18,2) NOT NULL
);

DROP TABLE IF EXISTS monsterConditionImmunity;
CREATE TABLE monsterConditionImmunity (
    monsterID INTEGER REFERENCES monster (id),
    conditionID INTEGER REFERENCES condition (id),
    PRIMARY KEY (monsterID, conditionID)
);

DROP TABLE IF EXISTS monsterTrait;
CREATE TABLE monsterTrait (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    monsterID INTEGER REFERENCES monster (id),
    name VARCHAR(30) NOT NULL DEFAULT '',
    description VARCHAR(1000) NOT NULL DEFAULT ''
);

DROP TABLE IF EXISTS monsterAttack;
CREATE TABLE monsterAttack (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    monsterID INTEGER REFERENCES monster (id),
    name VARCHAR(30) NOT NULL DEFAULT '',
    toHitBonus INTEGER NOT NULL,
    isMelee BOOLEAN NOT NULL DEFAULT 0,
    isRanged BOOLEAN NOT NULL DEFAULT 0,
    isSpell BOOLEAN NOT NULL DEFAULT 0,
    isWeapon BOOLEAN NOT NULL DEFAULT 0,
    meleeRange INTEGER NOT NULL DEFAULT 0,
    meleeRangeDistID INTEGER REFERENCES distance (id),
    stdRange INTEGER NOT NULL DEFAULT 0,
    stdRangeDistID INTEGER REFERENCES distance (id),
    maxRange INTEGER NOT NULL DEFAULT 0,
    maxRangeDistID INTEGER REFERENCES distance (id),
    targetCount INTEGER NOT NULL DEFAULT 0,
    hitEffect VARCHAR(1000) NOT NULL DEFAULT ''
);

DROP TABLE IF EXISTS monsterAttackDmg;
CREATE TABLE monsterAttackDmg (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    attackID INTEGER REFERENCES monsterAttack (id),
    roll VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS monsterAction;
CREATE TABLE monsterAction (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    monsterID INTEGER REFERENCES monster (id),
    name VARCHAR(30) NOT NULL DEFAULT '',
    description VARCHAR(1000) NOT NULL DEFAULT ''
);

DROP TABLE IF EXISTS monsterLegendaryAction;
CREATE TABLE monsterLegendaryAction (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    monsterID INTEGER REFERENCES monster (id),
    name VARCHAR(30) NOT NULL DEFAULT '',
    description VARCHAR(1000) NOT NULL DEFAULT '',
    cost INTEGER NOT NULL DEFAULT 1
);

DROP TABLE IF EXISTS monsterReaction;
CREATE TABLE monsterReaction (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    monsterID INTEGER REFERENCES monster (id),
    name VARCHAR(30) NOT NULL DEFAULT '',
    description VARCHAR(1000) NOT NULL DEFAULT ''
);

