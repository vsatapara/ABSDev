CREATE TABLE abs_mdi."PermissionBrand" (
  "PermissionBrandId" NUMBER(10) NOT NULL,
  "PermissionId" NUMBER(10),
  "BrandId" NUMBER(5),
  "UserTypeId" NUMBER(5),
  "IsActive" CHAR,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(50 BYTE),
  "UserType" VARCHAR2(10 BYTE) DEFAULT 'None',
  CONSTRAINT "PermissionBrand_PK" PRIMARY KEY ("PermissionBrandId")
);