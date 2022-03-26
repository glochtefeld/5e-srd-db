DROP TABLE IF EXISTS weaponProperty;
CREATE TABLE weaponProperty (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    description VARCHAR(1000) NOT NULL
);

DROP TABLE IF EXISTS weaponRange;
CREATE TABLE weaponRange (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    lowerRange INTEGER,
    upperRange INTEGER
);

DROP TABLE IF EXISTS weaponDice;
CREATE TABLE weaponDice (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dice VARCHAR(5) NOT NULL
);

DROP TABLE IF EXISTS weapon;
CREATE TABLE weapon (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(25) NOT NULL,
    coinID INTEGER REFERENCES coin (id) NOT NULL,
    cost INTEGER NOT NULL,
    damageTypeID INTEGER NOT NULL,
    diceID INTEGER REFERENCES weaponDice (id) NOT NULL,
    weight DECIMAL(18,10) NOT NULL
);

DROP TABLE IF EXISTS weaponWithProperty;
CREATE TABLE weaponWithProperty (
    weaponID INTEGER REFERENCES weapon (id) NOT NULL,
    propertyID INTEGER REFERENCES weaponProperty (id) NOT NULL,
    rangeID INTEGER REFERENCES weaponRange (id) NOT NULL,
    higherDiceID INTEGER REFERENCES weaponDice (id)
);
