CREATE TABLE abs_mdi."EDSPrice_O_SagBracing" (
  "SagBracingId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "Elevation" VARCHAR2(50 BYTE),
  "BayNumber" NUMBER(10),
  "Type" VARCHAR2(50 BYTE),
  "Quantity" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "Pk_EDSPrice_O_SagBracing_ProjectId" PRIMARY KEY ("SagBracingId")
);