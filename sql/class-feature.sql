DROP TABLE IF EXISTS classFeature;
CREATE TABLE classFeature (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    classID INTEGER REFERENCES class (id),
    levelID INTEGER REFERENCES level (id),
    name VARCHAR(50) NOT NULL,
    description VARCHAR(5000) NOT NULL
);
