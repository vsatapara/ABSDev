CREATE TABLE abs_mdi."CustomerReassignment" (
  "ID" NUMBER(10) NOT NULL,
  "CustomerNumber" VARCHAR2(128 BYTE),
  "CustomerName" VARCHAR2(30 BYTE),
  "SourceCompanyId" NUMBER(5),
  "SourceCompanyName" VARCHAR2(128 BYTE),
  "TargetCompanyId" NUMBER(5),
  "TargetCompanyName" VARCHAR2(128 BYTE),
  "IsMigrated" CHAR,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IsDelete" CHAR,
  "UserId" NUMBER(5),
  CONSTRAINT customerreassignment_pk PRIMARY KEY ("ID")
);