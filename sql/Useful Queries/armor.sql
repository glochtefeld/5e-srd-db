SELECT
    AT.name AS [Armor Type],
    a.name AS [Armor],
    a.cost AS [Cost (GP)],
    '+' || a.acBonus AS [AC Bonus], -- Sqlite equivalent of CONCAT
    a.maxDexMod AS [Maximum Dex Mod],
    a.minStrength AS [Minimum Strength],
    a.stealthPenalty AS [Stealth Penalty],
    a.weight AS [Weight (lbs)],
    AT.donTime AS [Don Time],
    t.measure AS [Don Time Measure],
    AT.doffTime AS [Doff Time],
    td.measure AS [Doff Time Measure] 
FROM
    armor a 
    INNER JOIN armorType AT ON a.typeID = AT.id 
    INNER JOIN time t ON AT.donTimeID = t.id 
    INNER JOIN time td ON AT.doffTimeID = td.id
