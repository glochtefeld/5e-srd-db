SELECT s.name AS [Spell], s.level AS [Level], ms.name AS [School], s.isRitual AS [Ritual],
s.time AS [Casting Time], t.measure AS [Casting Time Measure],
s.range AS [Range], cd.measure AS [Range Measure], 
s.componentBits & 1 AS [Verbal], s.componentBits & 2 AS [Somatic], s.componentBits & 4 AS [Material],
s.specialMaterial AS [Material Component],
s.durationTime AS [Duration], td.measure AS [Duration Measure],
s.concentration AS [Concentration],
s.description AS [Description],
s.higherLevels AS [At Higher Levels]
FROM spell s
INNER JOIN magicSchool ms on s.schoolID = ms.id
INNER JOIN time t on s.timeID = t.id
INNER JOIN time td on s.durationID = td.id
INNER JOIN castDistance cd on s.distanceID = cd.id
