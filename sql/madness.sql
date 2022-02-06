CREATE TABLE madnessType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(30) NOT NULL,
    durationID REFERENCES time (id),
    durationLength VARCHAR(5) NOT NULL
);

CREATE TABLE madnessEffect (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    higherRoll INTEGER NOT NULL,
    description VARCHAR(500) NOT NULL,
    madnessTypeID REFERENCES madnessType (id)
);
