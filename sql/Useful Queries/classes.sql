SELECT
name as [Class],
'1d' || hitDice || ' per ' || name || ' level' AS [Hit Dice],
hitDice || ' + your Constitution modifier' 
	AS [Hit Points at 1st Level],
'1d' || hitDice || ' (or ' || hpPerLevelAvg 
	|| ') your Constitution modifier per ' 
	|| name || ' level after 1st' AS [Hit Points at Higher Levels] 
FROM class

SELECT
c.name as [Class],
group_concat(distinct ' ' || at.name) as [Armor],
group_concat(distinct w.name) as [Weapons],
group_concat(distinct wp.name || ' weapons') as [Weapon Types],
tt.name as [Tool Type],
t.name as [Tool]
FROM class c
INNER JOIN classArmorProficiency cap on c.id = cap.classID
INNER JOIN armorType at on cap.armorTypeID = at.id
LEFT JOIN classWeaponPropProficiency cwpp on c.id = cwpp.classID
LEFT JOIN weaponProperty wp on cwpp.weaponPropertyID = wp.id
LEFT JOIN classWeaponProficiency cwp on c.id = cwp.classID
LEFT JOIN weapon w on cwp.weaponID = w.id
LEFT JOIN classToolTypeProficiency cttp on c.id = cttp.classID
LEFT JOIN itemType tt on cttp.toolTypeID = tt.id
LEFT JOIN classToolProficiency ctp on c.id = ctp.classID
LEFT JOIN item t on ctp.toolID = t.id
GROUP BY c.name
