CREATE TABLE abs_mdi."BuilderAccessPermission" (
  "BuilderAccessPermissionId" NUMBER(10) NOT NULL,
  "GroupName" VARCHAR2(50 BYTE),
  "IsActive" CHAR,
  "PredefineTemplateId" NUMBER(10),
  "IpAddress" VARCHAR2(20 BYTE),
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" VARCHAR2(50 BYTE),
  "ModifiedDate" TIMESTAMP,
  "IsInternal" CHAR,
  "IsExternal" CHAR,
  "IsDelete" CHAR,
  "ProjectBuildingType" NUMBER(2) DEFAULT 0 NOT NULL,
  CONSTRAINT "BuilderAccessPermission_PK" PRIMARY KEY ("BuilderAccessPermissionId")
);