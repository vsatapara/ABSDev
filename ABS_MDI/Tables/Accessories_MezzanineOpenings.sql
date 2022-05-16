CREATE TABLE abs_mdi."Accessories_MezzanineOpenings" (
  "MezzanineOpeningsId" NUMBER NOT NULL,
  "ProjectId" NUMBER,
  "BuildingId" NUMBER,
  "MezzanineId" NUMBER,
  "OpeningId" NUMBER,
  "OpenDistFromSw" NUMBER,
  "OpenWidthAlongEw" NUMBER,
  "OpenLengthAlongSw" NUMBER,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" CHAR,
  "CreatedBy" NUMBER,
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER,
  "ModifiedDate" TIMESTAMP,
  CONSTRAINT "Accessories_MezzanineOpenings_PK" PRIMARY KEY ("MezzanineOpeningsId")
);