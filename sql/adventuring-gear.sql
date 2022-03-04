DROP TABLE IF EXISTS itemType;
CREATE TABLE itemType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(25) NOT NULL
);

DROP TABLE IF EXISTS item;
CREATE TABLE item (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    itemType REFERENCES itemType (id),
    name VARCHAR(50) NOT NULL,
    description VARCHAR(1000) DEFAULT '',
    coinID REFERENCES coin (id),
    cost INTEGER NOT NULL,
    weight DECIMAL(18,10) NOT NULL,
    bcUseAction BLOB DEFAULT NULL
);

DROP TABLE IF EXISTS equipmentPack;
CREATE TABLE equipmentPack (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(25) NOT NULL,
    coinID REFERENCES coin (id),
    cost INTEGER NOT NULL
);

DROP TABLE IF EXISTS packItem;
CREATE TABLE packItem (
    packID REFERENCES equipmentPack (id),
    itemID REFERENCES item (id),
    quantity INTEGER NOT NULL,
    PRIMARY KEY (packID, itemID)
);
