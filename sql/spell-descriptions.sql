DROP TABLE IF EXISTS componentType;
CREATE TABLE componentType (
    bit INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(15) NOT NULL,
    abbreviation VARCHAR(1) NOT NULL
);

DROP TABLE IF EXISTS magicSchool;
CREATE TABLE magicSchool (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS time;
CREATE TABLE time (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    measure VARCHAR(15) NOT NULL
);

DROP TABLE IF EXISTS distance;
CREATE TABLE distance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    measure VARCHAR(15) NOT NULL
);

DROP TABLE IF EXISTS castArea;
CREATE TABLE castArea (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    measure VARCHAR(15) NOT NULL
);

DROP TABLE IF EXISTS damageType;
CREATE TABLE damageType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL
);

DROP TABLE IF EXISTS spell;
CREATE TABLE spell (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(30) NOT NULL,
    level INTEGER NOT NULL,
    isRitual BOOLEAN DEFAULT FALSE,
    schoolID INTEGER REFERENCES magicSchool (id) NOT NULL,
    timeID INTEGER REFERENCES time (id) NOT NULL,
    time INTEGER NOT NULL DEFAULT 1,
    reactionTrigger VARCHAR(100) DEFAULT '',
    distanceID INTEGER REFERENCES distance (id) NOT NULL,
    range INTEGER,
    areaID INTEGER REFERENCES castArea (id) DEFAULT NULL,
    componentBits INT NOT NULL,
    specialMaterial VARCHAR(100) DEFAULT NULL,
    durationID INTEGER REFERENCES time (id) NOT NULL,
    durationTime INT,
    concentration BOOLEAN DEFAULT FALSE,
    description VARCHAR(1000) NOT NULL DEFAULT '',
    higherLevels VARCHAR(1000) NOT NULL DEFAULT '',
    damageType INTEGER REFERENCES damageType (id)
);

