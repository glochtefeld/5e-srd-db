INSERT INTO trapDanger (dangerLevel, saveDCLower, saveDCUpper, attackBonusLower, attackBonusUpper) VALUES ('Setback', 10, 11, 3, 5);
INSERT INTO trapDanger (dangerLevel, saveDCLower, saveDCUpper, attackBonusLower, attackBonusUpper) VALUES ('Dangerous', 12, 15, 6, 8);
INSERT INTO trapDanger (dangerLevel, saveDCLower, saveDCUpper, attackBonusLower, attackBonusUpper) VALUES ('Deadly', 16, 20, 9, 12);

INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (4, 1, '1d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (4, 2, '2d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (4, 3, '4d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (10, 1, '2d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (10, 2, '4d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (10, 3, '10d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (16, 1, '4d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (16, 2, '10d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (16, 3, '18d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (20, 1, '10d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (20, 2, '18d10');
INSERT INTO trapSeverity (upperLevel, trapDangerID, damage) VALUES (20, 3, '24d10');
