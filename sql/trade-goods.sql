CREATE TABLE tradeGood (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(15) NOT NULL,
    coinID REFERENCES coin (id),
    cost INTEGER NOT NULL,
    measure VARCHAR(15) NOT NULL DEFAULT ''
);

CREATE TABLE livingExpense (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    lifestyle VARCHAR(20) NOT NULL,
    description VARCHAR(800) NOT NULL,
    coinID REFERENCES coin (id),
    dailyCost INTEGER NOT NULL
);

CREATE TABLE mount (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    coinID REFERENCES coin (id),
    cost INTEGER NOT NULL,
    speed INTEGER NOT NULL,
    carryCapacity INTEGER NOT NULL
);

CREATE TABLE drawnVehicle (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    coinID REFERENCES coin (id),
    cost INTEGER NOT NULL,
    acBonus INTEGER DEFAULT NULL,
    weight INTEGER NOT NULL
);

CREATE TABLE waterVehicle (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    coinID REFERENCES coin (id),
    cost INTEGER NOT NULL,
    speed DECIMAL(18,10) NOT NULL
);

CREATE TABLE food (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    coinID REFERENCES coin (id),
    cost INTEGER NOT NULL
);

CREATE TABLE drink (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    coinID REFERENCES coin (id),
    cost INTEGER NOT NULL
);

CREATE TABLE lodging (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    coinID REFERENCES coin (id),
    cost INTEGER NOT NULL
);

CREATE TABLE service (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    coinID REFERENCES coin (id),
    cost INTEGER NOT NULL
);
