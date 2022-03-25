DROP TABLE IF EXISTS rarity;
CREATE TABLE rarity (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(15) NOT NULL
);

DROP TABLE IF EXISTS magicItemType;
CREATE TABLE magicItemType (
    id INTEGER NOT NULL,
    name VARCHAR(25) NOT NULL
);

DROP TABLE IF EXISTS magicItem;
CREATE TABLE magicItem (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(30) NOT NULL,
    itemType INTEGER REFERENCES magicItemType (id),
    typeClarification VARCHAR(25) NOT NULL DEFAULT '',
    rarityID INTEGER REFERENCES rarity (id),
    requiresAttunement BOOLEAN NOT NULL DEFAULT FALSE,
    attunementDetails VARCHAR(50) NOT NULL DEFAULT '',
    description VARCHAR(1000) NOT NULL
);
    
