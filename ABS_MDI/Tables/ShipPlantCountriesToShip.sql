CREATE TABLE abs_mdi."ShipPlantCountriesToShip" (
  "CountriesToShipId" NUMBER(10) NOT NULL,
  "ShippingPlantId" NUMBER(*,0),
  "CountryId" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT "ShipPlantCountriesToShip_PK" PRIMARY KEY ("CountriesToShipId"),
  CONSTRAINT "ShipPlantCountriesPlant_FK" FOREIGN KEY ("ShippingPlantId") REFERENCES abs_mdi."ShippingPlants" ("ShippingPlantId"),
  CONSTRAINT "ShipPlantCountriesTable_FK" FOREIGN KEY ("CountryId") REFERENCES abs_mdi."TableOfTables" ("Id")
);