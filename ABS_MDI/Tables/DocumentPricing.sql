CREATE TABLE abs_mdi."DocumentPricing" (
  "DocumentPricingId" NUMBER(10) NOT NULL,
  "CompanyId" NUMBER(10),
  "NumberOfSetsFreeSealed" NUMBER(5),
  "NumberOfSetsFreeUnSealed" NUMBER(5),
  "PerSetFeeSealed" NUMBER(10,2),
  "PerSetFeeUnSealed" NUMBER(10,2),
  "CratedDate" TIMESTAMP,
  "CratedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "DocumentTypeId" NUMBER(10),
  CONSTRAINT documentpricing_pk PRIMARY KEY ("DocumentPricingId"),
  CONSTRAINT "DocumentPricingCompany_FK" FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);