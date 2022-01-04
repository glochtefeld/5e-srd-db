INSERT INTO srd.pantheon (name, description) VALUES ('Celtic','It’s said that something wild lurks in the heart of every soul, a space that thrills to the sound of geese calling at night, to the whispering wind through the pines, to the unexpected red of mistletoe on an oak—and it is in this space that the Celtic gods dwell. They sprang from the brook and stream, their might heightened by the strength of the oak and the beauty of the woodlands and open moor. When the first forester dared put a name to the face seen in the bole of a tree or the voice babbling in a brook, these gods forced themselves into being. The Celtic gods are as often served by druids as by clerics, for they are closely aligned with the forces of nature that druids revere.');

INSERT INTO srd.pantheon (name, description) VALUES ('Greek', 'The gods of Olympus make themselves known with the gentle lap of waves against the shores and the crash of the thunder among the cloud-enshrouded peaks. The thick boar-infested woods and the sere, olive-covered hillsides hold evidence of their passing. Every aspect of nature echoes with their presence, and they’ve made a place for themselves inside the human heart, too');

INSERT INTO srd.pantheon (name, description) VALUES ('Egyptian', 'These gods are a young dynasty of an ancient divine family, heirs to the rulership of the cosmos and the maintenance of the divine principle of Ma’at— the fundamental order of truth, justice, law, and order that puts gods, mortal pharaohs, and ordinary men and women in their logical and rightful place in the universe. The Egyptian pantheon is unusual in having three gods responsible for death, each with different alignments. Anubis is the lawful neutral god of the afterlife, who judges the souls of the dead. Set is a chaotic evil god of murder, perhaps best known for killing his brother Osiris. And Nephthys is a chaotic good goddess of mourning.');

INSERT INTO srd.pantheon (name, description) VALUES ('Norse', 'Where the land plummets from the snowy hills into the icy fjords below, where the longboats draw up on to the beach, where the glaciers flow forward and retreat with every fall and spring—this is the land of the Vikings, the home of the Norse pantheon. It’s a brutal clime, and one that calls for brutal living. The warriors of the land have had to adapt to the harsh conditions in order to survive, but they haven’t been too twisted by the needs of their environment. Given the necessity of raiding for food and wealth, it’s surprising the mortals turned out as well as they did. Their powers reflect the need these warriors had for strong leadership and decisive action. Thus, they see their deities in every bend of a river, hear them in the crash of the thunder and the booming of the glaciers, and smell them in the smoke of a burning longhouse.\nThe Norse pantheon includes two main families, the Aesir (deities of war and destiny) and the Vanir (gods of fertility and prosperity). Once enemies, these two families are now closely allied against their common enemies, the giants (including the gods Surtur and Thrym).'); 

INSERT INTO srd.alignment (abbreviation, name) VALUES ('LG', 'Lawful Good'); -- 1
INSERT INTO srd.alignment (abbreviation, name) VALUES ('LN', 'Lawful Neutral');
INSERT INTO srd.alignment (abbreviation, name) VALUES ('LE', 'Lawful Evil');
INSERT INTO srd.alignment (abbreviation, name) VALUES ('NG', 'Neutral Good'); -- 4
INSERT INTO srd.alignment (abbreviation, name) VALUES ('N', 'Neutral');
INSERT INTO srd.alignment (abbreviation, name) VALUES ('NE', 'Neutral Evil');
INSERT INTO srd.alignment (abbreviation, name) VALUES ('CG', 'Chaotic Good'); -- 7
INSERT INTO srd.alignment (abbreviation, name) VALUES ('CN', 'Chaotic Neutral');
INSERT INTO srd.alignment (abbreviation, name) VALUES ('CE', 'Chaotic Evil');

INSERT INTO srd.domain (name) VALUES ('Death'); -- 1
INSERT INTO srd.domain (name) VALUES ('Knowledge'); -- 2
INSERT INTO srd.domain (name) VALUES ('Life'); -- 3
INSERT INTO srd.domain (name) VALUES ('Light'); -- 4
INSERT INTO srd.domain (name) VALUES ('Nature'); -- 5
INSERT INTO srd.domain (name) VALUES ('Tempest'); -- 6
INSERT INTO srd.domain (name) VALUES ('Trickery'); -- 7
INSERT INTO srd.domain (name) VALUES ('War'); -- 8

INSERT INTO srd.deity (pantheon, name, alignment, symbol) VALUES (1,'The Daghdha','god of weather and crops',7,'Bubbling cauldron or shield');
INSERT INTO srd.deity (pantheon, name, alignment, symbol) VALUES (1,'Arawn','god of life and death',6,'Black star on gray background');
INSERT INTO srd.deity (pantheon, name, alignment, symbol) VALUES (1,'Belenus','god of sun, light, and warmth',4,'Solar disk and standing stones');
INSERT INTO srd.deity (pantheon, name, alignment, symbol) VALUES (1,'Diancecht','goddess of rivers and livestock',1,'Footbridge');
INSERT INTO srd.deity (pantheon, name, alignment, symbol) VALUES (1,'Dunatis','god of mountains and peaks',5,'Crossed oak and mistletoe branches');
INSERT INTO srd.deity (pantheon, name, alignment, symbol) VALUES (1,'Goibhniu','god of smiths and healing',4,'Giant mallet over sword');
INSERT INTO srd.deity (pantheon, name, alignment, symbol) VALUES (1,'Lugh','god of arts, travel, and commerce',8,'Pair of long hands');
INSERT INTO srd.deity (pantheon, name, alignment, symbol) VALUES (1,'Manannan mac Lir','god of oceans and sea creatures',2,'Wave of white water on green');
INSERT INTO srd.deity (pantheon, name, alignment, symbol) VALUES (1,'Math Mathonwy','god of magic',6,'Staff');
INSERT INTO srd.deity (pantheon, name, alignment, symbol) VALUES (1,'Morrigan','goddess of battle',9,'Two crossed spears');
INSERT INTO srd.deity (pantheon, name, alignment, symbol) VALUES (1,'Nuada','god of war and warriors',5,'Silver hand on black background');
INSERT INTO srd.deity (pantheon, name, alignment, symbol) VALUES (1,'Oghma','god of speech and writing',4,'Unfurled scroll');
INSERT INTO srd.deity (pantheon, name, alignment, symbol) VALUES (1,'Silvanus','god of nature and forests',5,'Summer oak tree');

INSERT INTO srd.deityDomain (deity, domain) VALUES (1,5);
INSERT INTO srd.deityDomain (deity, domain) VALUES (1,7);
INSERT INTO srd.deityDomain (deity, domain) VALUES (2,3);
INSERT INTO srd.deityDomain (deity, domain) VALUES (2,1);
INSERT INTO srd.deityDomain (deity, domain) VALUES (3,4);
INSERT INTO srd.deityDomain (deity, domain) VALUES (4,3);
INSERT INTO srd.deityDomain (deity, domain) VALUES (5,3);
INSERT INTO srd.deityDomain (deity, domain) VALUES (6,5);
INSERT INTO srd.deityDomain (deity, domain) VALUES (7,2);
INSERT INTO srd.deityDomain (deity, domain) VALUES (7,3);
INSERT INTO srd.deityDomain (deity, domain) VALUES (8,2);
INSERT INTO srd.deityDomain (deity, domain) VALUES (8,3);
INSERT INTO srd.deityDomain (deity, domain) VALUES (9,5);
INSERT INTO srd.deityDomain (deity, domain) VALUES (9,6);
INSERT INTO srd.deityDomain (deity, domain) VALUES (10,2);
INSERT INTO srd.deityDomain (deity, domain) VALUES (11,8);
INSERT INTO srd.deityDomain (deity, domain) VALUES (12,8);
INSERT INTO srd.deityDomain (deity, domain) VALUES (13,2);
INSERT INTO srd.deityDomain (deity, domain) VALUES (14,5);
