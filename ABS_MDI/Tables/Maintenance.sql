CREATE TABLE abs_mdi."Maintenance" (
  "MaintenanceId" NUMBER(10) NOT NULL,
  "FromDate" TIMESTAMP,
  "ToDate" TIMESTAMP,
  "IsActive" CHAR,
  "Content" NCLOB,
  "IsDelete" CHAR,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT "Maintenance_PK" PRIMARY KEY ("MaintenanceId")
);