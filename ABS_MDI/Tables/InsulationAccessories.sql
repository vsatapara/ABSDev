CREATE TABLE abs_mdi."InsulationAccessories" (
  "InsulationAccessoriesId" NUMBER(5) NOT NULL,
  "BuildingNumber" NUMBER(4),
  "ItemNumber" NUMBER(4),
  "Quantity" NUMBER(4),
  "Description" VARCHAR2(255 BYTE),
  "Facing" VARCHAR2(50 BYTE),
  "Width" NUMBER(8,4),
  "Weight" NUMBER(8,4),
  "Price" NUMBER(8,4),
  "IsPriced" NUMBER(4),
  "ErrorCode" NUMBER(4),
  "InsulationType" VARCHAR2(50 BYTE),
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDelete" CHAR,
  CONSTRAINT "InsulationAccessories_PK" PRIMARY KEY ("InsulationAccessoriesId")
);