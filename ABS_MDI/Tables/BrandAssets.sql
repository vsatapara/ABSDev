CREATE TABLE abs_mdi."BrandAssets" (
  "BrandAssetsId" NUMBER(10) NOT NULL,
  "BrandAssetsDisplayName" NVARCHAR2(30),
  "IsDelete" CHAR,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "BrandAssetsFile" NUMBER(10),
  "IpAddress" VARCHAR2(20 BYTE),
  "CompanyID" NUMBER(10),
  CONSTRAINT brandassets_pk PRIMARY KEY ("BrandAssetsId"),
  CONSTRAINT brandassetcompany_fk FOREIGN KEY ("CompanyID") REFERENCES abs_mdi."Company" ("CompanyId")
);