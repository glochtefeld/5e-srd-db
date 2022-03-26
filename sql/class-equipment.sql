/* Equipment. This is a section that is extremely difficult to make with just raw SQL: */
/* Classes have a choice between sets of items of variable length. */
/* These items can come from three different tables. */
/* The simplest solution is to just store everything as text, but that's barely a solution. */
/* The best solution I can think of is these four tables and punting the problem forward to software. */
/* I'm not the biggest fan of the idea but I want to avoid duplicating data. */
DROP TABLE IF EXISTS startEquipTbl;
CREATE TABLE startEquipTbl (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(64) NOT NULL
);

DROP TABLE IF EXISTS startEquipItem;
CREATE TABLE startEquipItem (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    /* PK (tableID, itemID) could be possible, but that adds a lot more nullable columns in the other tables. */
    tableID INTEGER REFERENCES startEquipTbl (id),
    itemID INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1
);

/* note: Any items from the weaponProperty table should be intersected with each other. e.g. 'Martial', 'Ranged' becomes 'Martial Ranged' */
DROP TABLE IF EXISTS startEquipBundle;
CREATE TABLE startEquipBundle (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    item1ID INTEGER REFERENCES startEquipItem (id),
    item2ID INTEGER REFERENCES startEquipItem (id) DEFAULT NULL,
    item3ID INTEGER REFERENCES startEquipItem (id) DEFAULT NULL
);

DROP TABLE IF EXISTS classBundleOption;
CREATE TABLE classBundleOption (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    classID INTEGER REFERENCES class (id),
    bundle1ID INTEGER REFERENCES startEquipBundle (id),
    bundle2ID INTEGER REFERENCES startEquipBundle (id) DEFAULT NULL,
    bundle3ID INTEGER REFERENCES startEquipBundle (id) DEFAULT NULL
);
