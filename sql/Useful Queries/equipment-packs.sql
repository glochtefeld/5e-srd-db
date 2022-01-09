SELECT
	ep.name AS [Equipment Pack],
	ep.cost || ' ' || LOWER(c.abbreviation) as [Cost],
	GROUP_CONCAT(pi.quantity || ' ' || g.name, '. ') AS [Items]
FROM packItem pi
	INNER JOIN equipmentPack ep ON pi.packID = ep.id
	INNER JOIN gear g ON pi.itemID = g.id
	INNER JOIN gearType gt ON g.gearType = gt.id
	INNER JOIN coin c ON g.coinID = c.id
GROUP BY ep.name
