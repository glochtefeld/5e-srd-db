DROP TABLE IF EXISTS subclass;
CREATE TABLE subclass (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    classID INTEGER REFERENCES class (id),
    name VARCHAR(50) NOT NULL,
    description VARCHAR(500) NOT NULL
);

DROP TABLE IF EXISTS subclassFeature;
CREATE TABLE subclassFeature (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    levelID INTEGER REFERENCES level (id),
    subclassID INTEGER REFERENCES subclass (id),
    name VARCHAR(30) NOT NULL,
    description VARCHAR(500) NOT NULL
);
