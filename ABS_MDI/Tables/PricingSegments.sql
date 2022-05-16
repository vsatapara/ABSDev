CREATE TABLE abs_mdi."PricingSegments" (
  "PricingSegmentId" NUMBER(10) NOT NULL,
  "Description" NVARCHAR2(50) NOT NULL,
  "SortOrder" NUMBER(5),
  "IsActive" CHAR DEFAULT 'N',
  "IsDefault" CHAR DEFAULT 'F',
  "IsForComponents" CHAR DEFAULT 'F',
  "CreatedBy" NUMBER(5) NOT NULL,
  "CreatedDate" TIMESTAMP NOT NULL,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(50 BYTE),
  "CompanyId" NUMBER(10),
  CONSTRAINT "PricingSegments_PK" PRIMARY KEY ("PricingSegmentId"),
  CONSTRAINT "PricingSegmentCompany_FK" FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);