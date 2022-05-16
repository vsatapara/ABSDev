CREATE TABLE abs_mdi."Customer" (
  "CustomerID" NUMBER(10) NOT NULL,
  "CustomerNo" VARCHAR2(128 BYTE),
  "CustomerName" VARCHAR2(128 BYTE) NOT NULL,
  "IsDefault" CHAR NOT NULL,
  "IsActive" CHAR NOT NULL,
  "IsPrivateLabelBuilder" CHAR NOT NULL,
  "EnforceSignatureRule" CHAR NOT NULL,
  "IsDelete" CHAR NOT NULL,
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "CompanyId" NUMBER(10),
  CONSTRAINT "Customer_PK" PRIMARY KEY ("CustomerID"),
  CONSTRAINT "CustomerCompany_FK" FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);