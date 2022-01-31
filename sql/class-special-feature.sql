CREATE TABLE rageProgression (
    levelID REFERENCES level (id),
    amount INTEGER NOT NULL,
    damageBonus INTEGER NOT NULL,
    PRIMARY KEY (levelID)
);

CREATE TABLE martialDamage (
    levelID REFERENCES level (id),
    dieSize INTEGER NOT NULL,
    PRIMARY KEY (levelID)
);

CREATE TABLE movementBonus (
    levelID REFERENCES level(id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (levelID)
);
/* Sneak attack damage is always [ceil(level/2)]d6 */
/* Ki points, sorcery points  follow this pattern: (level) => level == 1 ? 0 : level */
CREATE TABLE invocationsKnown (
    levelID REFERENCES level (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (levelID)
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

