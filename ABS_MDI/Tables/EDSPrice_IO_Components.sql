CREATE TABLE abs_mdi."EDSPrice_IO_Components" (
  "ComponentsId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10),
  "ProductID" NUMBER(10),
  "BasePart" VARCHAR2(50 BYTE),
  "Quantity" NUMBER(10),
  "UnitOfMeasure" VARCHAR2(50 BYTE),
  "Description" VARCHAR2(255 BYTE),
  "Length" NUMBER(10,2),
  "Width1" NUMBER(10,2),
  "Width2" NUMBER(10,2),
  "Gauge" VARCHAR2(50 BYTE),
  "ColorCode" VARCHAR2(50 BYTE),
  "PunchCode" VARCHAR2(50 BYTE),
  "BevelCode" VARCHAR2(50 BYTE),
  "Handed" VARCHAR2(50 BYTE),
  "RoofSlope" VARCHAR2(50 BYTE),
  "PartCategory" VARCHAR2(50 BYTE),
  "ItemCategory" VARCHAR2(50 BYTE),
  "RawMaterialCode" VARCHAR2(50 BYTE),
  "TotalWeight" NUMBER(10,2),
  "TotalListPrice" NUMBER(10,2),
  "TotalNetPrice" NUMBER(10,2),
  "AnidType" VARCHAR2(50 BYTE),
  "Slope" NUMBER(10),
  "Buyout" NUMBER(10),
  "HideWeightPrice" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  CONSTRAINT "EDSPrice_IO_Components_PK" PRIMARY KEY ("ComponentsId")
);