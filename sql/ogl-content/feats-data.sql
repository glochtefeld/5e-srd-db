DELETE FROM feat;
DELETE FROM sqlite_sequence where name='feat';
INSERT INTO feat (name, prerequisite, description) VALUES ('Grappler', 'Strength 13 or higher', 'You’ve developed the skills necessary to hold your  own in close-­‐‑quarters grappling. You gain the following benefits: • You have advantage on attack rolls against a creature you are grappling. • You can use your action to try to pin a creature grappled by you. To do so, make another grapple check. If you succeed, you and the creature are both restrained until the grapple ends.');
