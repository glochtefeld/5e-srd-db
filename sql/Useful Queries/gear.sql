SELECT
	gt.name AS [Item Type],
	g.name AS [Item],
	g.description AS [Description],
	g.cost || ' ' || LOWER(c.abbreviation) AS [Cost],
	g.weight || ' lb.' AS [Weight]
FROM gear g
	INNER JOIN gearType gt ON g.gearType = gt.id
	INNER JOIN coin c ON g.coinID = c.id
