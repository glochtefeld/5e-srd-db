CREATE TABLE disease (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(30) NOT NULL,
    description VARCHAR (1000) NOT NULL,
    bc BLOB DEFAULT NULL
);
