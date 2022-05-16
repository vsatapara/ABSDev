CREATE TABLE abs_mdi."USR_Brand_PermissionGroup" (
  "UsrBrandPermissionId" NUMBER(10) NOT NULL,
  "BrandId" NUMBER(10),
  "PermissionGroupId" NUMBER(10),
  "IsEnable" CHAR,
  "UserDetailId" NUMBER(10),
  CONSTRAINT "USR_Brand_PermissionGroup_PK" PRIMARY KEY ("UsrBrandPermissionId")
);