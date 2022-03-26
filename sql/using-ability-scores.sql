DROP TABLE IF EXISTS difficulty;
CREATE TABLE difficulty (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    difficulty VARCHAR(20) NOT NULL,
    dc INTEGER NOT NULL
);

DROP TABLE IF EXISTS ability;
CREATE TABLE ability (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(10) NOT NULL,
    explanation VARCHAR(500) NOT NULL,
    otherChecks VARCHAR(500) NOT NULL
);

DROP TABLE IF EXISTS skill;
CREATE TABLE skill (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    abilityID INTEGER REFERENCES ability (id),
    example VARCHAR(500) NOT NULL
);

DROP TABLE IF EXISTS travelPace;
CREATE TABLE travelPace (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(10) NOT NULL,
    effect VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS travel;
CREATE TABLE travel (
    paceID INTEGER REFERENCES travelPace (id),
    distanceID INTEGER REFERENCES distance (id),
    timeID INTEGER REFERENCES time (id),
    quantity INTEGER NOT NULL
);

