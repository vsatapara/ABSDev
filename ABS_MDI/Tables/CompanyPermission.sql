CREATE TABLE abs_mdi."CompanyPermission" (
  "CompanyId" NUMBER(10) NOT NULL,
  "PermissionGroupId" NUMBER(10) NOT NULL,
  "IsActive" CHAR DEFAULT 'N' NOT NULL,
  "CreatedBy" NUMBER(5) NOT NULL,
  "CreatedDate" TIMESTAMP NOT NULL,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(50 BYTE),
  CONSTRAINT companypermission_pk PRIMARY KEY ("CompanyId","PermissionGroupId"),
  CONSTRAINT companypermission_fk1 FOREIGN KEY ("PermissionGroupId") REFERENCES abs_mdi."PermissionGroup" ("PermissionGroupId")
);