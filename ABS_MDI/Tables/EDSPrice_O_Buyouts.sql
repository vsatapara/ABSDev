CREATE TABLE abs_mdi."EDSPrice_O_Buyouts" (
  "BuildingNumber" NUMBER(10),
  "Buyout_Id" NUMBER(10) NOT NULL,
  "Description" VARCHAR2(50 BYTE),
  "Weight" NUMBER(10),
  "Price" NUMBER(10,2),
  "Square_Feet" NUMBER(10),
  "Linear_Feet" NUMBER(10),
  "Elevation" VARCHAR2(50 BYTE),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  "BuyoutsId" NUMBER(10),
  CONSTRAINT "EDSPrice_O_Buyouts_PK" PRIMARY KEY ("Buyout_Id"),
  CONSTRAINT eds_price_o_buyouts_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId") DISABLE NOVALIDATE
);