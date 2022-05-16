CREATE TABLE abs_mdi."EDSPrice_IO_ExteriorColumns" (
  "ExteriorColumnsId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10),
  "BuildingNumber" NUMBER(10),
  "Elevation" VARCHAR2(50 BYTE),
  "FramelineNumber" NUMBER(10),
  "BeginningElevation" NUMBER(10),
  "EndingElevation" NUMBER(10),
  "MaximumElevation" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  CONSTRAINT "EDSPrice_IO_ExteriorColumns_PK" PRIMARY KEY ("ExteriorColumnsId")
);