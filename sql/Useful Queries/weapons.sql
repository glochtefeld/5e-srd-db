SELECT w.id,
w.name AS [Weapon],
w.cost || ' ' || LOWER(c.abbreviation) AS [Cost],
wd.dice || ' ' || dt.name AS [Damage],
w.weight || ' lb.' AS [Weight],
GROUP_CONCAT(
    wp.name 
    || CASE
        WHEN wp.id = 3 OR wp.id = 10 THEN ' (range ' || wr.lowerRange || '/' || wr.upperRange || ')'
        WHEN wp.id = 12 THEN ' (' || wd2.dice || ')'
        ELSE ''
        END, 
    ', ') AS [Properties]
FROM weapon w
    INNER JOIN coin c ON w.coinID = c.id
		INNER JOIN weaponDice wd ON w.diceID = wd.id
    INNER JOIN damageType dt ON w.damageTypeID = dt.id
    INNER JOIN weaponWithProperty wwp ON w.id = wwp.weaponID
		INNER JOIN weaponRange wr on wwp.rangeID = wr.id
		INNER JOIN weaponDice wd2 ON wwp.higherDiceID = wd2.id
    INNER JOIN weaponProperty wp ON wwp.propertyID = wp.id
GROUP BY w.id;
