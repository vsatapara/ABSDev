CREATE TABLE abs_mdi."BuildingComplexityLeadDay" (
  "BuildingComplexityLeadDaysId" NUMBER(10) NOT NULL,
  "BuildingQuoteTypeId" NUMBER(5),
  "ClassMasterId" NUMBER(5),
  "ClassInput" NUMBER(5,2),
  "CreatedBy" NUMBER(2),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(2),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT "BuildingComplexityLeadDay_PK" PRIMARY KEY ("BuildingComplexityLeadDaysId"),
  CONSTRAINT buildingquotetype_fk FOREIGN KEY ("BuildingQuoteTypeId") REFERENCES abs_mdi."TableOfTables" ("Id"),
  CONSTRAINT classmaster_fk FOREIGN KEY ("ClassMasterId") REFERENCES abs_mdi."TableOfTables" ("Id")
);