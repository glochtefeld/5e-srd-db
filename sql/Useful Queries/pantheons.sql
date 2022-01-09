SELECT
	p.name AS [Pantheon],
	d.name AS [Deity],
	d.description AS [Description],
	GROUP_CONCAT(dm.name, ', ') AS [Domain],
	a.abbreviation AS [Alignment],
	d.symbol AS [Symbol]
FROM deityDomain dd
	INNER JOIN deity d ON dd.deity = d.id
	INNER JOIN domain dm ON dd.domain = dm.id
	INNER JOIN pantheon p ON d.pantheon = p.id
	INNER JOIN alignment a ON d.alignment = a.id
GROUP BY d.name
ORDER BY d.id ASC
