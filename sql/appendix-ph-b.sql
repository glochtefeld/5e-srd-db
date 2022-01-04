CREATE TABLE srd.pantheon (
    id INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(15) NOT NULL,
    description VARCHAR(1500) not null
);

create table srd.alignment (
    id int primary key autoincrement,
    abbreviation varchar(2) not null,
    name varchar(20) not null
);

create table srd.domain (
    id int primary key autoincrement,
    name varchar(10) not null
);


CREATE TABLE srd.deity (
    pantheon int REFERENCES srd.pantheonName (id),
    name varchar(25) not null,
    description varchar(50),
    alignment int REFERENCES srd.alignment (id),
    symbol varchar(50) not null
);

create table srd.deityDomain (
    deity int REFERENCES srd.deity (id),
    domain int REFERENCES srd.domain (id)
    CONSTRAINT PRIMARY KEY (deity, domain)
);
