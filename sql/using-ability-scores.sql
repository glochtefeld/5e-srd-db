CREATE TABLE difficulty (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    difficulty VARCHAR(20) NOT NULL,
    dc INTEGER NOT NULL
);

CREATE TABLE ability (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(10) NOT NULL,
    explanation VARCHAR(500) NOT NULL,
    otherChecks VARCHAR(500) NOT NULL
);

CREATE TABLE skill (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(20) NOT NULL,
    abilityID REFERENCES ability (id),
    example VARCHAR(500) NOT NULL
);


CREATE TABLE travelPace (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(10) NOT NULL,
    effect VARCHAR(50) NOT NULL
);

CREATE TABLE travel (
    paceID REFERENCES travelPace (id),
    distanceID REFERENCES distance (id),
    timeID REFERENCES time (id),
    quantity INTEGER NOT NULL
);
