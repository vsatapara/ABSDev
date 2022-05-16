CREATE TABLE abs_mdi."Permission" (
  "PermissionId" NUMBER(10) NOT NULL,
  "PermissionGrpName" VARCHAR2(50 BYTE) NOT NULL,
  "IsActive" CHAR,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(50 BYTE),
  "IsDelete" CHAR DEFAULT 'N',
  CONSTRAINT "Permission_PK" PRIMARY KEY ("PermissionId")
);