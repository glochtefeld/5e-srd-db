/* Equipment. This is a section that is extremely difficult to make with just raw SQL:
 Classes have a choice between sets of items of variable length.
 These items can come from three different tables.
 The simplest solution is to just store everything as text, but that's barely a solution.
 The best solution I can think of is these four tables and punting the problem forward to software.
 I'm not the biggest fan of the idea but I want to avoid duplicating data.
 */
CREATE TABLE startEquipTbl (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(64) NOT NULL
);

CREATE TABLE startEquipItem (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    /* PK (tableID, itemID) could be possible, but that adds a lot more nullable columns in the other tables. */
    tableID REFERENCES startEquipTbl (id),
    itemID INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 1
);

/* Any items from the weaponProperty table should be intersected with each other. */
CREATE TABLE startEquipBundle (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    item1ID REFERENCES startEquipItem (id),
    item2ID REFERENCES startEquipItem (id) DEFAULT NULL,
    item3ID REFERENCES startEquipItem (id) DEFAULT NULL
);

CREATE TABLE classBundleOption (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    classID REFERENCES class (id),
    bundle1ID REFERENCES startEquipBundle (id),
    bundle2ID REFERENCES startEquipBundle (id) DEFAULT NULL,
    bundle3ID REFERENCES startEquipBundle (id) DEFAULT NULL
);
