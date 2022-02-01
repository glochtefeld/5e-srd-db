CREATE TABLE componentType (
    bit INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(15) NOT NULL,
    abbreviation VARCHAR(1) NOT NULL
);

CREATE TABLE magicSchool (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE time (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    measure VARCHAR(15) NOT NULL
);

CREATE TABLE distance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    measure VARCHAR(15) NOT NULL
);

CREATE TABLE castArea (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    measure VARCHAR(15) NOT NULL
);

CREATE TABLE damageType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE spell (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(30) NOT NULL,
    level INTEGER NOT NULL,
    isRitual BOOLEAN DEFAULT FALSE,
    schoolID REFERENCES magicSchool (id) NOT NULL,
    timeID REFERENCES time (id) NOT NULL,
    time INTEGER NOT NULL DEFAULT 1,
    reactionTrigger VARCHAR(100) DEFAULT '',
    distanceID REFERENCES distance (id) NOT NULL,
    range INTEGER,
    areaID REFERENCES castArea (id) DEFAULT NULL,
    componentBits INT NOT NULL,
    specialMaterial VARCHAR(100) DEFAULT NULL,
    durationID REFERENCES time (id) NOT NULL,
    durationTime INT,
    concentration BOOLEAN DEFAULT FALSE,
    description VARCHAR(1000) NOT NULL DEFAULT '',
    higherLevels VARCHAR(1000) NOT NULL DEFAULT '',
    damageType REFERENCES damageType (id),
    bcArgs BLOB DEFAULT NULL,
    bcConstants BLOB DEFAULT NULL,
    bcFn BLOB DEFAULT NULL
);

