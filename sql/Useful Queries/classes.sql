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

create temp table if not exists starteq as
select sei.id, sei.quantity,
case
	when sei.tableID=1 then a.name
	when sei.tableID=2 then i.name
	when sei.tableID=3 then it.name
	when sei.tableID=4 then w.name
	when sei.tableID=5 then wp.name
	when sei.tableID=6 then ep.name
	end as item
from startEquipItem sei
left join armor a on sei.itemID=a.id
left join item i on sei.itemID=i.id
left join itemType it on sei.itemID=it.id
left join weapon w on sei.itemID=w.id
left join weaponProperty wp on sei.itemID=wp.id
left join equipmentPack ep on sei.itemID=ep.id;

select seb.id, 
sq.quantity || ' ' || sq.item || 
case when sq2.item is not null then ', ' || sq2.quantity || ' ' || sq2.item else '' end ||
case when sq3.item is not null then ', ' || sq3.quantity || ' ' || sq3.item else '' end 
as [items]
from startEquipBundle seb
inner join starteq sq on seb.item1ID=sq.id
left join starteq sq2 on seb.item2ID=sq2.id
left join starteq sq3 on seb.item3ID=sq3.id;
