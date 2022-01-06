INSERT INTO componentType (bit, name, abbreviation) VALUES (1,'Verbal','V');
INSERT INTO componentType (bit, name, abbreviation) VALUES (2,'Somatic','S');
INSERT INTO componentType (bit, name, abbreviation) VALUES (4,'Material','M');

INSERT INTO magicSchool (name) VALUES ('Abjuration');
INSERT INTO magicSchool (name) VALUES ('Conjuration');
INSERT INTO magicSchool (name) VALUES ('Divination');
INSERT INTO magicSchool (name) VALUES ('Enchantment');
INSERT INTO magicSchool (name) VALUES ('Evocation');
INSERT INTO magicSchool (name) VALUES ('Illusion');
INSERT INTO magicSchool (name) VALUES ('Necromancy');
INSERT INTO magicSchool (name) VALUES ('Transmutation');

INSERT INTO castTime (measure) VALUES ('Action');
INSERT INTO castTime (measure) VALUES ('Bonus Action');
INSERT INTO castTime (measure) VALUES ('Reaction');
INSERT INTO castTime (measure) VALUES ('Instantaneous');
INSERT INTO castTime (measure) VALUES ('Round');
INSERT INTO castTime (measure) VALUES ('Minute');
INSERT INTO castTime (measure) VALUES ('Hour');
INSERT INTO castTime (measure) VALUES ('Day');
INSERT INTO castTime (measure) VALUES ('Month');
INSERT INTO castTime (measure) VALUES ('Year');

INSERT INTO castDistance (measure) VALUES ('Self');
INSERT INTO castDistance (measure) VALUES ('Touch');
INSERT INTO castDistance (measure) VALUES ('Feet');
INSERT INTO castDistance (measure) VALUES ('Miles');

INSERT INTO castArea (measure) VALUES ('Cone');
INSERT INTO castArea (measure) VALUES ('Cube');
INSERT INTO castArea (measure) VALUES ('Cylinder');
INSERT INTO castArea (measure) VALUES ('Line');
INSERT INTO castArea (measure) VALUES ('Sphere');
