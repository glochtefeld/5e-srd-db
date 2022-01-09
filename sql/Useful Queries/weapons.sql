SELECT w.id,
w.name AS [Weapon],
w.cost || ' ' || LOWER(c.abbreviation) AS [Cost],
w.dice || ' ' || dt.name AS [Damage],
w.weight || ' lb.' AS [Weight],
GROUP_CONCAT(
    wp.name 
    || CASE
        WHEN wp.id = 3 OR wp.id = 10 THEN ' (range ' || wwp.lowerRange || '/' || wwp.upperRange || ')'
        WHEN wp.id = 12 THEN ' (' || wwp.higherDice || ')'
        ELSE ''
        END, 
    ', ') AS [Properties]
FROM weapon w
    INNER JOIN coin c ON w.coinID = c.id
    INNER JOIN damageType dt ON w.damageTypeID = dt.id
    INNER JOIN weaponWithProperty wwp ON w.id = wwp.weaponID
    INNER JOIN weaponProperty wp ON wwp.propertyID = wp.id
GROUP BY w.id;
