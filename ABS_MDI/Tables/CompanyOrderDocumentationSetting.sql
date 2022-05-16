CREATE TABLE abs_mdi."CompanyOrderDocumentationSetting" (
  "OrderdocumentId" NUMBER(5) NOT NULL,
  "CompanyId" NUMBER(5) NOT NULL,
  "IsFinalDrawing" CHAR,
  "IsPermitDrawing" CHAR,
  "IsSalesChangeOrder" CHAR,
  "IsCalculationFiles" CHAR,
  "IsBOMFiles" CHAR,
  "IsApprovalDrawing" CHAR,
  "IsOpenRegistration" NCHAR,
  "IsLangualgeSelection" CHAR,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT "CompanyOrderDocumentationSetting_PK" PRIMARY KEY ("OrderdocumentId"),
  CONSTRAINT "CompanyOrder_FK" FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);