CREATE TABLE abs_mdi."EDSPrice_O_XBracing" (
  "XBracingId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "Elevation" VARCHAR2(50 BYTE),
  "BayNumber" NUMBER(10),
  "Diameter" NUMBER(10,2),
  "StartHeight" NUMBER(10,2),
  "EndHeight" NUMBER(10,2),
  "LengthRight" NUMBER(10,2),
  "LengthLeft" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "Pk_EDSPrice_O_XBracing_ProjectId" PRIMARY KEY ("XBracingId")
);