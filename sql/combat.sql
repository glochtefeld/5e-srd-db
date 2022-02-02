CREATE TABLE creatureSize (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    size VARCHAR(10) NOT NULL,
    measure REFERENCES distance (id),
    areaSquare DECIMAL(18,10)
);

CREATE TABLE combatAction (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(25) NOT NULL,
    description VARCHAR(500) NOT NULL,
    bc BLOB DEFAULT NULL
);
