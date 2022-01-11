SELECT
	it.name AS [Item Type],
	i.name AS [Item],
	i.description AS [Description],
	i.cost || ' ' || LOWER(c.abbreviation) AS [Cost],
	i.weight || ' lb.' AS [Weight]
FROM item i
	INNER JOIN itemType it ON i.itemType = it.id
	INNER JOIN coin c ON i.coinID = c.id
