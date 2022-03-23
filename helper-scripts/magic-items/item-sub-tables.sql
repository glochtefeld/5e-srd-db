DROP TABLE IF EXISTS itemApparatusOfTheCrabLever;
CREATE TABLE itemApparatusOfTheCrabLever (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    lever INTEGER NOT NULL,
    position BOOLEAN NOT NULL,
    effect VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS itemArmorOfResistanceResistance;
CREATE TABLE itemArmorOfResistanceResistance (
    roll INTEGER NOT NULL,
    damageID INTEGER REFERENCES damageType (id),
    PRIMARY KEY (roll, damageID)
);

DROP TABLE IF EXISTS itemBagOfBeansBean;
CREATE TABLE itemBagOfBeansBean (
    roll INTEGER NOT NULL PRIMARY KEY,
    effect VARCHAR(200) NOT NULL
);

DROP TABLE IF EXISTS itemBagOfTricksType;
CREATE TABLE itemBagOfTricksType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(5) NOT NULL
);

DROP TABLE IF EXISTS itemBagOfTricksTrick;
CREATE TABLE itemBagOfTricksTrick (
    bagID INTEGER REFERENCES itemBagOfTricksType (id),
    roll INTEGER NOT NULL,
    creatureID INTEGER REFERENCES monster (id),
    PRIMARY KEY (bagID, roll)
);

DROP TABLE IF EXISTS itemCandleOfInvocationType;
CREATE TABLE itemCandleOfInvocationType (
    roll INTEGER NOT NULL,
    alignmentID INTEGER REFERENCES alignment (id),
    PRIMARY KEY (roll, alignmentID)
);

DROP TABLE IF EXISTS itemCarpetOfFlyingType;
CREATE TABLE itemCarpetOfFlyingType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    roll INTEGER NOT NULL,
    width INTEGER NOT NULL,
    height INTEGER NOT NULL,
    measureID INTEGER REFERENCES distance (id),
    carryCapacity INTEGER NOT NULL,
    speed INTEGER NOT NULL,
    speedMeasureID INTEGER REFERENCES distance (id)
);

DROP TABLE IF EXISTS itemCubeOfForceFace;
CREATE TABLE itemCubeOfForceFace (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    face INTEGER NOT NULL,
    cost INTEGER NOT NULL,
    effect VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS itemCubeOfForceChargeLoss;
CREATE TABLE itemCubeOfForceSpellChargeLoss (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    spellNotItem BOOLEAN NOT NULL DEFAULT TRUE,
    sourceID INTEGER NOT NULL,
    formula VARCHAR(25) NOT NULL
);

DROP TABLE IF EXISTS itemDeckOfIllusionsCard;
CREATE TABLE itemDeckOfIllusionsCard (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemDeckOfManyThingsCard;
CREATE TABLE itemDeckOfManyThingsCard (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemDragonScaleMailResistance;
CREATE TABLE itemDragonScaleMailResistance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemEfreetiBottleEffect;
CREATE TABLE itemEfreetiBottleEffect (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemElementalGemSummon;
CREATE TABLE itemElementalGemSummon (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemFeatherTokenEffect;
CREATE TABLE itemFeatherTokenEffect (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemHornOfValhallaEffect;
CREATE TABLE itemHornOfValhallaEffect (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemIronFlaskContents;
CREATE TABLE itemIronFlaskContents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemManualOfGolemsType;
CREATE TABLE itemManualOfGolemsType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemNecklaceofPrayerBeadsType;
CREATE TABLE itemNecklaceofPrayerBeadsType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemPotionOfResistanceType;
CREATE TABLE itemPotionOfResistanceType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemRingOfResistanceType;
CREATE TABLE itemRingOfResistanceType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemRingOfShootingStarsBallLightning;
CREATE TABLE itemRingOfShootingStarsBallLightning (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemRobeOfUsefulItemsItem;
CREATE TABLE itemRobeOfUsefulItemsItem (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemSpellScroll;
CREATE TABLE itemSpellScroll (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemSphereOfAnnihilationCollisionWithPortalEffect;
CREATE TABLE itemSphereOfAnnihilationCollisionWithPortalEffect (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS itemStaffDestructionEffect;
CREATE TABLE itemStaffDestructionEffect (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS sentientMagicItemCommunication;
CREATE TABLE sentientMagicItemCommunication (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS sentientMagicItemSense;
CREATE TABLE sentientMagicItemSense (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS sentientMagicItemAlignment;
CREATE TABLE sentientMagicItemAlignment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS sentientMagicItemPurpose;
CREATE TABLE sentientMagicItemPurpose (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

DROP TABLE IF EXISTS sentientMagicItemConflict;
CREATE TABLE sentientMagicItemConflict (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
);

