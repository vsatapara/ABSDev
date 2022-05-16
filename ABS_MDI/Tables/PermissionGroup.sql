CREATE TABLE abs_mdi."PermissionGroup" (
  "PermissionGroupId" NUMBER(10) NOT NULL,
  "PermissionGroupName" VARCHAR2(50 BYTE) NOT NULL,
  "IsActive" CHAR DEFAULT 'N' NOT NULL,
  "CreatedBy" NUMBER(5) NOT NULL,
  "CreatedDate" TIMESTAMP NOT NULL,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(50 BYTE),
  "CompanyId" NUMBER(10),
  "IsDelete" CHAR DEFAULT 'N',
  CONSTRAINT permissiongroup_pk PRIMARY KEY ("PermissionGroupId")
);