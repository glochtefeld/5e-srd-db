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
CREATE TABLE itemCubeOfForceChargeLoss (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    spellNotItem BOOLEAN NOT NULL DEFAULT TRUE,
    sourceID INTEGER NOT NULL,
    formula VARCHAR(25) NOT NULL
);

DROP TABLE IF EXISTS stdPlayingCardSuit;
CREATE TABLE stdPlayingCardSuit (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(10) NOT NULL
);

DROP TABLE IF EXISTS stdPlayingCardNumber;
CREATE TABLE stdPlayingCardNumber (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    value INTEGER,
    display VARCHAR(10) NOT NULL
);

DROP TABLE IF EXISTS stdPlayingCard;
CREATE TABLE stdPlayingCard (
    suitID INTEGER REFERENCES stdPlayingCardSuit (id),
    numID INTEGER REFERENCES stdPlayingCardNumber (id),
    PRIMARY KEY (suitID, numID)
);

DROP TABLE IF EXISTS itemDeckOfIllusionsMonster;
CREATE TABLE itemDeckOfIllusionsMonster (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    suitID INTEGER REFERENCES stdPlayingCard (suitID),
    numID INTEGER REFERENCES stdPlayingCard (numID),
    monsterID INTEGER REFERENCES monster (id) DEFAULT NULL,
    quantity INTEGER NOT NULL
);

DROP TABLE IF EXISTS itemDeckOfManyThingsCard;
CREATE TABLE itemDeckOfManyThingsCard (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    suitID INTEGER REFERENCES stdPlayingCard (suitID),
    numID INTEGER REFERENCES stdPlayingCard (numID),
    onlyIn22 BOOLEAN DEFAULT FALSE,
    name VARCHAR(25) NOT NULL,
    effect VARCHAR(200) NOT NULL
);

DROP TABLE IF EXISTS itemDragonScaleMailResistance;
CREATE TABLE itemDragonScaleMailResistance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dragonType VARCHAR(20) NOT NULL,
    damageTypeID INTEGER REFERENCES damageType (id)
);

DROP TABLE IF EXISTS itemEfreetiBottleEffect;
CREATE TABLE itemEfreetiBottleEffect (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    roll INTEGER NOT NULL,
    result VARCHAR(500) NOT NULL
);

DROP TABLE IF EXISTS itemElementalGemSummon;
CREATE TABLE itemElementalGemSummon (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    gem VARCHAR(25) NOT NULL,
    monsterID INTEGER REFERENCES monster (id)
);

DROP TABLE IF EXISTS itemFeatherTokenEffect;
CREATE TABLE itemFeatherTokenEffect (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    roll INTEGER NOT NULL,
    token VARCHAR(15) NOT NULL,
    description VARCHAR(500) NOT NULL
);

DROP TABLE IF EXISTS itemIronFlaskContents;
CREATE TABLE itemIronFlaskContents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    roll INTEGER NOT NULL,
    monsterID INTEGER REFERENCES monster (id)
);

DROP TABLE IF EXISTS itemManualOfGolemsType;
CREATE TABLE itemManualOfGolemsType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    roll INTEGER NOT NULL,
    monsterID INTEGER REFERENCES monster (id),
    buildingTime INTEGER NOT NULL,
    timeID INTEGER REFERENCES time (id),
    cost INTEGER NOT NULL,
    costID INTEGER REFERENCES coin (id)
);

DROP TABLE IF EXISTS itemNecklaceofPrayerBeadsType;
CREATE TABLE itemNecklaceofPrayerBeadsType (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    roll INTEGER NOT NULL,
    beadName VARCHAR(15) NOT NULL,
    spellID INTEGER REFERENCES spell (id),
    higherLevelMod INTEGER NOT NULL DEFAULT 0
);

DROP TABLE IF EXISTS itemPotionOfResistanceType;
CREATE TABLE itemPotionOfResistanceType (
    roll INTEGER PRIMARY KEY AUTOINCREMENT,
    damageTypeID INTEGER REFERENCES damageType (id)
);

DROP TABLE IF EXISTS itemRingOfResistanceType;
CREATE TABLE itemRingOfResistanceType (
    roll INTEGER PRIMARY KEY AUTOINCREMENT,
    stone VARCHAR(20) NOT NULL,
    damageTypeID INTEGER REFERENCES damageType (id)
);

DROP TABLE IF EXISTS itemRingOfShootingStarsBallLightning;
CREATE TABLE itemRingOfShootingStarsBallLightning (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    spheres INTEGER NOT NULL,
    sphereDamage VARCHAR(10) NOT NULL
);

DROP TABLE IF EXISTS itemRobeOfUsefulItemsItem;
CREATE TABLE itemRobeOfUsefulItemsItem (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    roll INTEGER NOT NULL,
    patch VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS itemSpellScroll;
CREATE TABLE itemSpellScroll (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    level INTEGER NOT NULL,
    rarityID INTEGER REFERENCES rarity (id),
    saveDC INTEGER NOT NULL,
    atkBonus INTEGER NOT NULL
);

DROP TABLE IF EXISTS itemSphereOfAnnihilationCollisionWithPortalEffect;
CREATE TABLE itemSphereOfAnnihilationCollisionWithPortalEffect (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    roll INTEGER NOT NULL,
    result VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS itemStaffDestructionEffect;
CREATE TABLE itemStaffDestructionEffect (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    distance INTEGER NOT NULL,
    distanceID INTEGER REFERENCES distance (id),
    chargeDmgMult INTEGER NOT NULL
);

DROP TABLE IF EXISTS itemWandOfWonderEffect;
CREATE TABLE itemWandOfWonderEffect (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    roll INTEGER NOT NULL,
    effect VARCHAR(500) NOT NULL
);

DROP TABLE IF EXISTS sentientMagicItemCommunication;
CREATE TABLE sentientMagicItemCommunication (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    roll INTEGER NOT NULL,
    effect VARCHAR(500) NOT NULL
);

DROP TABLE IF EXISTS sentientMagicItemSense;
CREATE TABLE sentientMagicItemSense (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    roll INTEGER NOT NULL,
    effect VARCHAR(500) NOT NULL
);

DROP TABLE IF EXISTS sentientMagicItemAlignment;
CREATE TABLE sentientMagicItemAlignment (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    roll INTEGER NOT NULL,
    alignment VARCHAR(500) NOT NULL
);

DROP TABLE IF EXISTS sentientMagicItemPurpose;
CREATE TABLE sentientMagicItemPurpose (
    roll INTEGER PRIMARY KEY AUTOINCREMENT,
    purpose VARCHAR(500) NOT NULL
);
