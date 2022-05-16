CREATE TABLE abs_mdi."USR_PER_BuilderAccess" (
  "UsrPerBuilderAccessId" NUMBER(10) NOT NULL,
  "PermissionGroupId" NUMBER(10),
  "BuilderAccessPermissionId" NUMBER(10),
  "UserDetailId" NUMBER(10),
  "BrandId" NUMBER(10),
  CONSTRAINT "USR_PER_BuilderAccess_PK" PRIMARY KEY ("UsrPerBuilderAccessId")
);