DROP TABLE IF EXISTS classFeature;
CREATE TABLE classFeature (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    classID REFERENCES class (id),
    levelID REFERENCES level (id),
    name VARCHAR(50) NOT NULL,
    description VARCHAR(5000) NOT NULL
);
