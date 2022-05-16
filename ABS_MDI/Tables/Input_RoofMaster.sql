CREATE TABLE abs_mdi."Input_RoofMaster" (
  "RoofPanelId" NUMBER(10) NOT NULL,
  "Category" VARCHAR2(50 BYTE),
  "SubCategory" VARCHAR2(100 BYTE),
  "CategoryValue" VARCHAR2(100 BYTE),
  "DisplayOrder" NUMBER(3),
  "EffectiveDate" TIMESTAMP,
  CONSTRAINT "Input_RoofMaster_PK" PRIMARY KEY ("RoofPanelId")
);