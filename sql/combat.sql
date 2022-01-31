CREATE TABLE creatureSize (
    id INTEGER NOT NULL,
    size VARCHAR(10) NOT NULL,
    measure REFERENCES distance (id), -- 3
    areaSquare DECIMAL(18,10)
);
