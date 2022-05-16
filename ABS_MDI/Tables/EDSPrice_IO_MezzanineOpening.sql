CREATE TABLE abs_mdi."EDSPrice_IO_MezzanineOpening" (
  "MezzanineOpeningId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "MezzanineNumber" NUMBER(10),
  "OpeningNumber" NUMBER(10),
  "OpenDistFromSw" NUMBER(10,2),
  "OpenDistFromFrameline" NUMBER(10,2),
  "OpenWidthAlongEw" NUMBER(10,2),
  "OpenLengthAlongSw" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  "MezzaninesId" NUMBER(10),
  CONSTRAINT "EDSPrice_IO_MezzanineOpening_PK" PRIMARY KEY ("MezzanineOpeningId")
);