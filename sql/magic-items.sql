CREATE TABLE rarity (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(15) NOT NULL
);

CREATE TABLE magicItemType (
    id INTEGER NOT NULL,
    name VARCHAR(25) NOT NULL
);

CREATE TABLE magicItem (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(30) NOT NULL,
    rarityID REFERENCES rarity (id),
    itemType REFERENCES magicItemType (id),
    attunable BOOLEAN NOT NULL DEFAULT FALSE
);
    
