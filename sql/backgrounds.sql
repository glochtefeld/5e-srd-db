CREATE TABLE background (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR (25) NOT NULL,
    description VARCHAR(500) NOT NULL,
    featureName VARCHAR (25) NOT NULL,
    featureDetail VARCHAR (500) NOT NULL,
    numLanguages INTEGER NOT NULL DEFAULT 0,
    anyLangauge BOOLEAN DEFAULT 0
);

CREATE TABLE backgroundLanguage (
    backgroundID REFERENCES background (id),
    languageID REFERENCES language (id),
    PRIMARY KEY (backgroundID, languageID)
);

CREATE TABLE backgroundSkill (
    backgroundID REFERENCES background (id),
    skillID REFERENCES skill (id),
    PRIMARY KEY (backgroundID, skillID)
);

CREATE TABLE backgroundTool (
    backgroundID REFERENCES background (id),
    itemID REFERENCES item (id),
    PRIMARY KEY (backgroundID, itemID)
);

CREATE TABLE backgroundToolType (
    backgroundID REFERENCES background (id),
    toolTypeID REFERENCES itemType (id),
    quantity INTEGER NOT NULL,
    PRIMARY KEY (backgroundID, toolTypeID)
);

CREATE TABLE backgroundEquipment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    backgroundID REFERENCES background (id),
    itemID REFERENCES item (id) DEFAULT NULL,
    quantity INTEGER NOT NULL DEFAULT 1,
    special VARCHAR (50) DEFAULT NULL
);

CREATE TABLE backgroundMoney (
    backgroundID REFERENCES background (id),
    coinID REFERENCES coin (id),
    amount INTEGER NOT NULL,
    PRIMARY KEY (backgroundID, coinID)
);

CREATE TABLE backgroundCharacteristicType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR (30) NOT NULL,
    backgroundID REFERENCES background (id) DEFAULT NULL
);

CREATE TABLE backgroundCharacteristic (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    backgroundID REFERENCES background (id),
    charTypeID REFERENCES backgroundCharacteristicType (id),
    title VARCHAR(25) NOT NULL,
    rollNum INTEGER NOT NULL,
    description VARCHAR(500)
);    
