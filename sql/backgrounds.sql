DROP TABLE IF EXISTS background;
CREATE TABLE background (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR (25) NOT NULL,
    description VARCHAR(500) NOT NULL,
    featureName VARCHAR (25) NOT NULL,
    featureDetail VARCHAR (500) NOT NULL,
    numLanguages INTEGER NOT NULL DEFAULT 0,
    anyLangauge BOOLEAN DEFAULT 0
);

DROP TABLE IF EXISTS backgroundLanguage;
CREATE TABLE backgroundLanguage (
    backgroundID INTEGER REFERENCES background (id),
    languageID INTEGER REFERENCES language (id),
    PRIMARY KEY (backgroundID, languageID)
);

DROP TABLE IF EXISTS backgroundSkill;
CREATE TABLE backgroundSkill (
    backgroundID INTEGER REFERENCES background (id),
    skillID INTEGER REFERENCES skill (id),
    PRIMARY KEY (backgroundID, skillID)
);

DROP TABLE IF EXISTS backgroundTool;
CREATE TABLE backgroundTool (
    backgroundID INTEGER REFERENCES background (id),
    itemID INTEGER REFERENCES item (id),
    PRIMARY KEY (backgroundID, itemID)
);

DROP TABLE IF EXISTS backgroundToolType;
CREATE TABLE backgroundToolType (
    backgroundID INTEGER REFERENCES background (id),
    toolTypeID INTEGER REFERENCES itemType (id),
    quantity INTEGER NOT NULL,
    PRIMARY KEY (backgroundID, toolTypeID)
);

DROP TABLE IF EXISTS backgroundEquipment;
CREATE TABLE backgroundEquipment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    backgroundID INTEGER REFERENCES background (id),
    itemID INTEGER REFERENCES item (id) DEFAULT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    special VARCHAR (50) DEFAULT NULL
);

DROP TABLE IF EXISTS backgroundMoney;
CREATE TABLE backgroundMoney (
    backgroundID INTEGER REFERENCES background (id),
    coinID INTEGER REFERENCES coin (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (backgroundID, coinID)
);

DROP TABLE IF EXISTS backgroundCharacteristicType;
CREATE TABLE backgroundCharacteristicType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR (30) NOT NULL,
    backgroundID INTEGER REFERENCES background (id) DEFAULT NULL
);

DROP TABLE IF EXISTS backgroundCharacteristic;
CREATE TABLE backgroundCharacteristic (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    backgroundID INTEGER REFERENCES background (id),
    charTypeID INTEGER REFERENCES backgroundCharacteristicType (id),
    title VARCHAR(25) NOT NULL,
    rollNum INTEGER NOT NULL,
    description VARCHAR(500)
);    
