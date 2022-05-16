CREATE TABLE abs_mdi."EDSPrice_I_EWPlaza" (
  "EWPlazaId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10),
  "BuildingNumber" NUMBER(10),
  "Elevation" VARCHAR2(50 BYTE),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  CONSTRAINT "EDSPrice_I_EWPlaza_PK" PRIMARY KEY ("EWPlazaId")
);