CREATE TABLE abs_mdi."ShipPlantLeadDays" (
  "PlantLeadDayId" NUMBER(10) NOT NULL,
  "ShipPlantCampaignId" NUMBER(10),
  "LeadDayClassId" NUMBER(10),
  "ShippingPlantId" NUMBER(10),
  "DayInput" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT "ShipPlantLeadDays_PK" PRIMARY KEY ("PlantLeadDayId"),
  CONSTRAINT "ShipPlantLeaCampaign_FK" FOREIGN KEY ("ShipPlantCampaignId") REFERENCES abs_mdi."TableOfTables" ("Id"),
  CONSTRAINT "ShipPlantLeadClass_FK" FOREIGN KEY ("LeadDayClassId") REFERENCES abs_mdi."TableOfTables" ("Id"),
  CONSTRAINT "ShipPlantLeadDaysPlant_FK" FOREIGN KEY ("ShippingPlantId") REFERENCES abs_mdi."ShippingPlants" ("ShippingPlantId")
);