CREATE TABLE planeType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    description VARCHAR(2500)
);

CREATE TABLE plane (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(50) NOT NULL,
    planeType REFERENCES planeType (id),
    description VARCHAR(2500)
);
