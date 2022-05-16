CREATE TABLE abs_mdi."EDSPrice_O_Reports" (
  "ReportsId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "Item" VARCHAR2(50 BYTE),
  "Description" VARCHAR2(100 BYTE),
  "Quantity" NUMBER(10),
  "Length" NUMBER(10,2),
  "UnitWeight" NUMBER(10,2),
  "UnitPrice" NUMBER(10,2),
  "UnitLabor" NUMBER(10,2),
  "PriceAppliedTo" VARCHAR2(50 BYTE),
  "Hours" NUMBER(10,2),
  "PartNumber" VARCHAR2(50 BYTE),
  uom VARCHAR2(50 BYTE),
  "TempInteger1" NUMBER(10),
  "TempInteger2" NUMBER(10),
  "TempDouble1" NUMBER(10,2),
  "TempDouble2" NUMBER(10,2),
  "TempString1" VARCHAR2(50 BYTE),
  "TempString2" VARCHAR2(50 BYTE),
  "Elevation" VARCHAR2(50 BYTE),
  "Category" NUMBER(10),
  "TotalPrice" NUMBER(10,2),
  "TotalWeight" NUMBER(10,2),
  "CustServHours" NUMBER(10,2),
  "EngHours" NUMBER(10,2),
  "DraftingHours" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "EDSPrice_O_Reports_PK" PRIMARY KEY ("ReportsId"),
  CONSTRAINT eds_price_o_reports_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);