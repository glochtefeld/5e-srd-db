CREATE TABLE coin (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(15) NOT NULL,
    abbreviation VARCHAR(2) NOT NULL,
    exchangeRate DECIMAL(18,10)
);

CREATE TABLE armorType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    donTimeID REFERENCES time (id),
    donTime INTEGER NOT NULL,
    doffTimeID REFERENCES time (id),
    doffTime INTEGER NOT NULL
);

CREATE TABLE armor (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    typeID REFERENCES armorType (id),
    name VARCHAR(20) NOT NULL,
    coinID REFERENCES coin (id) NOT NULL,
    cost INTEGER NOT NULL,
    acBonus INTEGER NOT NULL,
    maxDexMod INTEGER,
    minStrength INTEGER,
    stealthPenalty BOOLEAN NOT NULL,
    weight INTEGER NOT NULL
);

CREATE TABLE objectAC (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    substance VARCHAR(15) NOT NULL,
    ac INTEGER NOT NULL
);

CREATE TABLE objectHP (
    sizeID REFERENCES creatureSize (id) PRIMARY KEY,
    fragile VARCHAR(5) NOT NULL,
    resilient VARCHAR(5) NOT NULL
);
