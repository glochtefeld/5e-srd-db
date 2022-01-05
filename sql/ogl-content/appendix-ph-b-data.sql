INSERT INTO pantheon (name, description) VALUES ('Celtic','It’s said that something wild lurks in the heart of every soul, a space that thrills to the sound of geese calling at night, to the whispering wind through the pines, to the unexpected red of mistletoe on an oak—and it is in this space that the Celtic gods dwell. They sprang from the brook and stream, their might heightened by the strength of the oak and the beauty of the woodlands and open moor. When the first forester dared put a name to the face seen in the bole of a tree or the voice babbling in a brook, these gods forced themselves into being. The Celtic gods are as often served by druids as by clerics, for they are closely aligned with the forces of nature that druids revere.');

INSERT INTO pantheon (name, description) VALUES ('Greek', 'The gods of Olympus make themselves known with the gentle lap of waves against the shores and the crash of the thunder among the cloud-enshrouded peaks. The thick boar-infested woods and the sere, olive-covered hillsides hold evidence of their passing. Every aspect of nature echoes with their presence, and they’ve made a place for themselves inside the human heart, too');

INSERT INTO pantheon (name, description) VALUES ('Egyptian', 'These gods are a young dynasty of an ancient divine family, heirs to the rulership of the cosmos and the maintenance of the divine principle of Ma’at— the fundamental order of truth, justice, law, and order that puts gods, mortal pharaohs, and ordinary men and women in their logical and rightful place in the universe. The Egyptian pantheon is unusual in having three gods responsible for death, each with different alignments. Anubis is the lawful neutral god of the afterlife, who judges the souls of the dead. Set is a chaotic evil god of murder, perhaps best known for killing his brother Osiris. And Nephthys is a chaotic good goddess of mourning.');

INSERT INTO pantheon (name, description) VALUES ('Norse', 'Where the land plummets from the snowy hills into the icy fjords below, where the longboats draw up on to the beach, where the glaciers flow forward and retreat with every fall and spring—this is the land of the Vikings, the home of the Norse pantheon. It’s a brutal clime, and one that calls for brutal living. The warriors of the land have had to adapt to the harsh conditions in order to survive, but they haven’t been too twisted by the needs of their environment. Given the necessity of raiding for food and wealth, it’s surprising the mortals turned out as well as they did. Their powers reflect the need these warriors had for strong leadership and decisive action. Thus, they see their deities in every bend of a river, hear them in the crash of the thunder and the booming of the glaciers, and smell them in the smoke of a burning longhouse.\nThe Norse pantheon includes two main families, the Aesir (deities of war and destiny) and the Vanir (gods of fertility and prosperity). Once enemies, these two families are now closely allied against their common enemies, the giants (including the gods Surtur and Thrym).'); 

INSERT INTO alignment (abbreviation, name) VALUES ('LG', 'Lawful Good'); -- 1
INSERT INTO alignment (abbreviation, name) VALUES ('LN', 'Lawful Neutral');
INSERT INTO alignment (abbreviation, name) VALUES ('LE', 'Lawful Evil');
INSERT INTO alignment (abbreviation, name) VALUES ('NG', 'Neutral Good'); -- 4
INSERT INTO alignment (abbreviation, name) VALUES ('N', 'Neutral');
INSERT INTO alignment (abbreviation, name) VALUES ('NE', 'Neutral Evil');
INSERT INTO alignment (abbreviation, name) VALUES ('CG', 'Chaotic Good'); -- 7
INSERT INTO alignment (abbreviation, name) VALUES ('CN', 'Chaotic Neutral');
INSERT INTO alignment (abbreviation, name) VALUES ('CE', 'Chaotic Evil');

INSERT INTO domain (name) VALUES ('Death'); -- 1
INSERT INTO domain (name) VALUES ('Knowledge'); -- 2
INSERT INTO domain (name) VALUES ('Life'); -- 3
INSERT INTO domain (name) VALUES ('Light'); -- 4
INSERT INTO domain (name) VALUES ('Nature'); -- 5
INSERT INTO domain (name) VALUES ('Tempest'); -- 6
INSERT INTO domain (name) VALUES ('Trickery'); -- 7
INSERT INTO domain (name) VALUES ('War'); -- 8

INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'The Daghdha','god of weather and crops',7,'Bubbling cauldron or shield');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'Arawn','god of life and death',6,'Black star on gray background');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'Belenus','god of sun, light, and warmth',4,'Solar disk and standing stones');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'Brigantia','goddess of rivers and livestock',4,'Footbridge');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'Diancecht','god of medicine and healing',1,'Crossed oak and mistletoe branches');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'Dunatis','god of mountains and peaks',5,'Red sun-capped mountain peak');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'Goibhniu','god of smiths and healing',4,'Giant mallet over sword');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'Lugh','god of arts, travel, and commerce',8,'Pair of long hands');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'Manannan mac Lir','god of oceans and sea creatures',2,'Wave of white water on green');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'Math Mathonwy','god of magic',6,'Staff');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'Morrigan','goddess of battle',9,'Two crossed spears');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'Nuada','god of war and warriors',5,'Silver hand on black background');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'Oghma','god of speech and writing',4,'Unfurled scroll');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (1,'Silvanus','god of nature and forests',5,'Summer oak tree');

INSERT INTO deityDomain (deity, domain) VALUES (1,5);
INSERT INTO deityDomain (deity, domain) VALUES (1,7);
INSERT INTO deityDomain (deity, domain) VALUES (2,3);
INSERT INTO deityDomain (deity, domain) VALUES (2,1);
INSERT INTO deityDomain (deity, domain) VALUES (3,4);
INSERT INTO deityDomain (deity, domain) VALUES (4,3);
INSERT INTO deityDomain (deity, domain) VALUES (5,3);
INSERT INTO deityDomain (deity, domain) VALUES (6,5);
INSERT INTO deityDomain (deity, domain) VALUES (7,2);
INSERT INTO deityDomain (deity, domain) VALUES (7,3);
INSERT INTO deityDomain (deity, domain) VALUES (8,2);
INSERT INTO deityDomain (deity, domain) VALUES (8,3);
INSERT INTO deityDomain (deity, domain) VALUES (9,5);
INSERT INTO deityDomain (deity, domain) VALUES (9,6);
INSERT INTO deityDomain (deity, domain) VALUES (10,2);
INSERT INTO deityDomain (deity, domain) VALUES (11,8);
INSERT INTO deityDomain (deity, domain) VALUES (12,8);
INSERT INTO deityDomain (deity, domain) VALUES (13,2);
INSERT INTO deityDomain (deity, domain) VALUES (14,5);

INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Re-Horakhty','god of the sun, ruler of the gods',1,'Solar disk encircled by serpent');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Anubis','god of judgment and death',2,'Black jackal');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Apep','god of evil, fire, and serpents',6,'Flaming snake');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Bast','goddess of cats and vengeance',7,'Cat');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Bes','god of luck and music',8,'Image of the misshapen deity');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Hathor','goddess of love, music, and motherhood',4,'Horned cow’s head with lunar disk');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Imhotep','god of crafts and medicine',4,'Step pyramid');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Isis','goddess of fertility and magic',4,'Ankh and star');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Nephthys','goddess of death and grief',7,'Horns around a lunar disk');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Osiris','god of nature and the underworld',1,'Crook and flail');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Ptah','god of crafts, knowledge, and secrets',2,'Bull');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Set','god of darkness and desert storms',9,'Coiled cobra');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Sobek','god of water and crocodiles',3,'Crocodile head with horns and plumes');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (2,'Thoth','god of knowledge and wisdom',5,'Ibis');

INSERT INTO deityDomain (deity, domain) VALUES (15,3);
INSERT INTO deityDomain (deity, domain) VALUES (15,4);
INSERT INTO deityDomain (deity, domain) VALUES (16,1);
INSERT INTO deityDomain (deity, domain) VALUES (17,7);
INSERT INTO deityDomain (deity, domain) VALUES (18,8);
INSERT INTO deityDomain (deity, domain) VALUES (19,7);
INSERT INTO deityDomain (deity, domain) VALUES (20,3);
INSERT INTO deityDomain (deity, domain) VALUES (20,4);
INSERT INTO deityDomain (deity, domain) VALUES (21,2);
INSERT INTO deityDomain (deity, domain) VALUES (22,2);
INSERT INTO deityDomain (deity, domain) VALUES (22,3);
INSERT INTO deityDomain (deity, domain) VALUES (23,1);
INSERT INTO deityDomain (deity, domain) VALUES (24,3);
INSERT INTO deityDomain (deity, domain) VALUES (24,5);
INSERT INTO deityDomain (deity, domain) VALUES (25,2);
INSERT INTO deityDomain (deity, domain) VALUES (26,1);
INSERT INTO deityDomain (deity, domain) VALUES (26,6);
INSERT INTO deityDomain (deity, domain) VALUES (26,7);
INSERT INTO deityDomain (deity, domain) VALUES (27,5);
INSERT INTO deityDomain (deity, domain) VALUES (27,6);
INSERT INTO deityDomain (deity, domain) VALUES (28,2);

INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Zeus','god of the sky, ruler of the gods',5,'Fist full of lightning bolts');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Aphrodite','goddess of love and beauty',7,'Sea shell');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Apollo','god of light, music, and healing',7,'Lyre');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Ares','god of war and strife',9,'Spear');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Artemis','goddess of hunting and childbirth',4,'Bow and arrow on lunar disk');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Athena','goddess of wisdom and civilization',1,'Owl');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Demeter','goddess of agriculture',4,'Mare’s head');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Dionysus','god of mirth and wine',8,'Thyrsus (staff tipped with pine cone)');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Hades','god of the underworld',3,'Black ram');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Hecate','goddess of magic and the moon',9,'Setting moon');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Hephaestus','god of smithing and craft',4,'Hammer and anvil');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Hera','goddess of marriage and intrigue',8,'Fan of peacock feathers');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Hercules','god of strength and adventure',7,'Lion’s head');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Hermes','god of travel and commerce',7,'Caduceus (winged staff and serpents)');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Hestia','goddess of home and family',4,'Hearth');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Nike','goddess of victory',2,'Winged woman');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Pan','god of nature',8,'Syrinx (pan pipes)');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Poseidon','god of the sea and earthquakes',8,'Trident');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (3,'Tyche','goddess of good fortune',5,'Red pentagram');

INSERT INTO deityDomain (deity, domain) VALUES (29,6);
INSERT INTO deityDomain (deity, domain) VALUES (30,4);
INSERT INTO deityDomain (deity, domain) VALUES (31,2);
INSERT INTO deityDomain (deity, domain) VALUES (31,3);
INSERT INTO deityDomain (deity, domain) VALUES (31,4);
INSERT INTO deityDomain (deity, domain) VALUES (32,8);
INSERT INTO deityDomain (deity, domain) VALUES (33,3);
INSERT INTO deityDomain (deity, domain) VALUES (33,5);
INSERT INTO deityDomain (deity, domain) VALUES (34,2);
INSERT INTO deityDomain (deity, domain) VALUES (34,8);
INSERT INTO deityDomain (deity, domain) VALUES (35,3);
INSERT INTO deityDomain (deity, domain) VALUES (36,3);
INSERT INTO deityDomain (deity, domain) VALUES (37,1);
INSERT INTO deityDomain (deity, domain) VALUES (38,2);
INSERT INTO deityDomain (deity, domain) VALUES (38,7);
INSERT INTO deityDomain (deity, domain) VALUES (39,2);
INSERT INTO deityDomain (deity, domain) VALUES (40,7);
INSERT INTO deityDomain (deity, domain) VALUES (41,6);
INSERT INTO deityDomain (deity, domain) VALUES (41,8);
INSERT INTO deityDomain (deity, domain) VALUES (42,7);
INSERT INTO deityDomain (deity, domain) VALUES (43,3);
INSERT INTO deityDomain (deity, domain) VALUES (44,8);
INSERT INTO deityDomain (deity, domain) VALUES (45,5);
INSERT INTO deityDomain (deity, domain) VALUES (46,6);
INSERT INTO deityDomain (deity, domain) VALUES (47,7);

INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Odin','god of knowledge and war',4,'Watching blue eye');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Aegir','god of the sea and storms',6,'Rough ocean waves');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Balder','god of beauty and poetry',4,'Gem-encrusted silver chalice');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Forseti','god of justice and law',5,'Head of a bearded man');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Frey','god of fertility and the sun',4,'Ice-blue greatsword');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Freya','goddess of fertility and love',4,'Falcon');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Frigga','goddess of birth and fertility',5,'Cat');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Heimdall','god of watchfulness and loyalty',1,'Curling musical horn');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Hel','goddess of the underworld',6,'Woman’s face, rotting on one side');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Hermod','god of luck',8,'Winged scroll');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Loki','god of thieves and trickery',9,'Flame');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Njord','god of sea and wind',4,'Gold coin');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Odur','god of light and the sun',7,'Solar disk');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Sif','goddess of war',7,'Upraised sword');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Skadi','god of earth and mountains',5,'Mountain peak');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Surtur','god of fire giants and war',3,'Flaming sword');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Thor','god of storms and thunder',7,'Hammer');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Thrym','god of frost giants and cold',9,'White double-bladed axe');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Tyr','god of courage and strategy',2,'Sword');
INSERT INTO deity (pantheon, name, description, alignment, symbol) VALUES (4,'Uller','god of hunting and winter',8,'Longbow');

INSERT INTO deityDomain (deity, domain) VALUES (48,2);
INSERT INTO deityDomain (deity, domain) VALUES (48,8);
INSERT INTO deityDomain (deity, domain) VALUES (49,6);
INSERT INTO deityDomain (deity, domain) VALUES (50,3);
INSERT INTO deityDomain (deity, domain) VALUES (50,4);
INSERT INTO deityDomain (deity, domain) VALUES (51,4);
INSERT INTO deityDomain (deity, domain) VALUES (52,3);
INSERT INTO deityDomain (deity, domain) VALUES (52,4);
INSERT INTO deityDomain (deity, domain) VALUES (53,3);
INSERT INTO deityDomain (deity, domain) VALUES (54,3);
INSERT INTO deityDomain (deity, domain) VALUES (54,4);
INSERT INTO deityDomain (deity, domain) VALUES (55,4);
INSERT INTO deityDomain (deity, domain) VALUES (55,8);
INSERT INTO deityDomain (deity, domain) VALUES (56,1);
INSERT INTO deityDomain (deity, domain) VALUES (57,7);
INSERT INTO deityDomain (deity, domain) VALUES (58,7);
INSERT INTO deityDomain (deity, domain) VALUES (59,5);
INSERT INTO deityDomain (deity, domain) VALUES (59,6);
INSERT INTO deityDomain (deity, domain) VALUES (60,4);
INSERT INTO deityDomain (deity, domain) VALUES (61,8);
INSERT INTO deityDomain (deity, domain) VALUES (62,5);
INSERT INTO deityDomain (deity, domain) VALUES (63,8);
INSERT INTO deityDomain (deity, domain) VALUES (64,6);
INSERT INTO deityDomain (deity, domain) VALUES (64,8);
INSERT INTO deityDomain (deity, domain) VALUES (65,8);
INSERT INTO deityDomain (deity, domain) VALUES (66,2);
INSERT INTO deityDomain (deity, domain) VALUES (66,8);
INSERT INTO deityDomain (deity, domain) VALUES (67,5);
