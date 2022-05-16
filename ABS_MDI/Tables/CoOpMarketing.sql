CREATE TABLE abs_mdi."CoOpMarketing" (
  "CoOpMarketingId" NUMBER(10) NOT NULL,
  "BrandAssetsTitle" VARCHAR2(30 BYTE),
  "BrandAssetsContent" NCLOB,
  "ProgramGuideLinesTitle" VARCHAR2(30 BYTE),
  "ProgramGuideLinesContent" NCLOB,
  "RequestForApprovalTitle" VARCHAR2(30 BYTE),
  "RequestForApprovalContent" NCLOB,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "CompanyID" NUMBER(10),
  CONSTRAINT coopmarketing_pk PRIMARY KEY ("CoOpMarketingId"),
  CONSTRAINT "CoOpMarketingCompany_FK" FOREIGN KEY ("CompanyID") REFERENCES abs_mdi."Company" ("CompanyId")
);