CREATE TABLE abs_mdi."BuilderAccessBrands" (
  "BuilderAccessBrandId" NUMBER(10) NOT NULL,
  "BuilderAccessPermissionId" NUMBER(10),
  "CompanyId" NUMBER(10),
  "IpAddress" VARCHAR2(20 BYTE),
  "CreatedBy" VARCHAR2(20 BYTE),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" VARCHAR2(20 BYTE),
  "ModifiedDate" TIMESTAMP,
  "IsDelete" CHAR,
  CONSTRAINT "BuilderAccessBrands_PK" PRIMARY KEY ("BuilderAccessBrandId")
);