CREATE TABLE creatureSize (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    size VARCHAR(10) NOT NULL,
    measure REFERENCES distance (id),
    areaSquare DECIMAL(18,10)
);
