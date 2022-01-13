CREATE TABLE damageType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE weaponProperty (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    description VARCHAR(1000) NOT NULL
);

CREATE TABLE weaponRange (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    lowerRange INTEGER,
    upperRange INTEGER
);

CREATE TABLE weaponDice (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dice VARCHAR(5) NOT NULL
);

CREATE TABLE weapon (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(25) NOT NULL,
    coinID REFERENCES coin (id) NOT NULL,
    cost INTEGER NOT NULL,
    damageTypeID INTEGER NOT NULL,
    diceID REFERENCES weaponDice (id) NOT NULL,
    weight DECIMAL(18,10) NOT NULL,
    roll BLOB DEFAULT NULL
);


CREATE TABLE weaponWithProperty (
    weaponID REFERENCES weapon (id) NOT NULL,
    propertyID REFERENCES weaponProperty (id) NOT NULL,
    rangeID REFERENCES weaponRange (id) NOT NULL,
    higherDiceID REFERENCES weaponDice (id)
);
