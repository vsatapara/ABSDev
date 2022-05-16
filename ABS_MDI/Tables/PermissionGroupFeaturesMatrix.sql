CREATE TABLE abs_mdi."PermissionGroupFeaturesMatrix" (
  "PermissionGroupFeaturesMatrixId" NUMBER(10) NOT NULL,
  "PermissionGroupId" NUMBER(10) NOT NULL,
  "FeatureId" NUMBER(10) NOT NULL,
  "IsEnabled" CHAR NOT NULL,
  "CreatedBy" NUMBER(5) NOT NULL,
  "CreatedDate" TIMESTAMP NOT NULL,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(50 BYTE),
  CONSTRAINT "PermissionGroupFeaturesMatrix_PK" PRIMARY KEY ("PermissionGroupFeaturesMatrixId")
);