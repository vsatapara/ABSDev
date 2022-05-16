CREATE TABLE abs_mdi."EDSPrice_I_Taxes" (
  "TaxesId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10),
  "TaxApplied" NUMBER(10),
  "TaxRate" NUMBER(10,2),
  "TaxAmount" NUMBER(10,2),
  "Material" NUMBER(10),
  "Freight" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  CONSTRAINT "Pk_EDSPrice_I_Taxes_ProjectId" PRIMARY KEY ("TaxesId")
);