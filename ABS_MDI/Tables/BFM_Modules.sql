CREATE TABLE abs_mdi."BFM_Modules" (
  "ModuleId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "GroupNumber" NUMBER(10),
  "Width" NUMBER(10,4),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" CHAR,
  "ProjectId" NUMBER(10),
  "ModuleNumber" NUMBER(10),
  CONSTRAINT "BFM_Modules_PK" PRIMARY KEY ("ModuleId"),
  CONSTRAINT bnid_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);
COMMENT ON COLUMN abs_mdi."BFM_Modules"."BuildingNumber" IS 'BuildingNumberId';
COMMENT ON COLUMN abs_mdi."BFM_Modules"."GroupNumber" IS 'GroupNumberId';
COMMENT ON COLUMN abs_mdi."BFM_Modules"."Width" IS 'point value';
COMMENT ON COLUMN abs_mdi."BFM_Modules"."ModuleNumber" IS 'ModuleNumberId';