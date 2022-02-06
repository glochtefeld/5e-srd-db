CREATE TABLE poisonType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(10) NOT NULL
);

CREATE TABLE poison (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(25) NOT NULL,
    description VARCHAR (500) NOT NULL,
    poisonTypeID REFERENCES poisonType (id),
    coinID REFERENCES coin (id),
    price INTEGER NOT NULL
);
