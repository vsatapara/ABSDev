CREATE TABLE abs_mdi."MarketingAdmin" (
  "MarketingAdminId" NUMBER(10) NOT NULL,
  "Title" VARCHAR2(128 BYTE) NOT NULL,
  "SortOrder" NUMBER(5) NOT NULL,
  "Content" CLOB NOT NULL,
  "ActionButtonTitle" VARCHAR2(256 BYTE),
  "ActionButtonUrl" VARCHAR2(256 BYTE),
  "IsActive" CHAR NOT NULL,
  "IsDelete" CHAR NOT NULL,
  "CreatedBy" NUMBER(10) NOT NULL,
  "CreatedDate" TIMESTAMP NOT NULL,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "FileId" NUMBER(10),
  "CompanyId" NUMBER(10),
  CONSTRAINT "MarketingAdmin_PK" PRIMARY KEY ("MarketingAdminId"),
  CONSTRAINT "MarketingAdminCompany_FK" FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);