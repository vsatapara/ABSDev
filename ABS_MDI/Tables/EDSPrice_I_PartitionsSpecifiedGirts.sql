CREATE TABLE abs_mdi."EDSPrice_I_PartitionsSpecifiedGirts" (
  "PartitionsSpecifiedGirtsId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10),
  "BuildingNumber" NUMBER(10),
  "PartitionNumber" NUMBER(10),
  "SpacingNumber" NUMBER(10),
  "Spacing" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  CONSTRAINT "Pk_EDSPrice_I_PartitionsSpecifiedGirts_ProjectId" PRIMARY KEY ("PartitionsSpecifiedGirtsId")
);