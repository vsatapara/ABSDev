CREATE TABLE abs_mdi."ShippingPlantGrouping" (
  "ID" NUMBER(10) NOT NULL,
  "ShippingGroupID" NUMBER(10) NOT NULL,
  "ShippingPlantID" NUMBER(10) NOT NULL,
  CONSTRAINT shippingplantgroupings_pk PRIMARY KEY ("ID"),
  CONSTRAINT "ShippingGroup_FK" FOREIGN KEY ("ShippingGroupID") REFERENCES abs_mdi."ShippingGroup" ("ShippingGroupId"),
  CONSTRAINT "ShippingPlant_FK" FOREIGN KEY ("ShippingPlantID") REFERENCES abs_mdi."ShippingPlants" ("ShippingPlantId")
);