CREATE TABLE pantheon (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(15) NOT NULL,
    description VARCHAR(1500) NOT NULL
);

CREATE TABLE alignment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    abbreviation VARCHAR(2) NOT NULL,
    name VARCHAR(20) NOT NULL
);

CREATE TABLE domain (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(10) NOT NULL
);


CREATE TABLE deity (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pantheon REFERENCES pantheon (id),
    name VARCHAR(25) NOT NULL,
    description VARCHAR(50),
    alignment REFERENCES alignment (id),
    symbol VARCHAR(50) NOT NULL
);

CREATE TABLE deityDomain (
    deity REFERENCES deity (id),
    domain REFERENCES domain (id),
    PRIMARY KEY (deity, domain)
);
