CREATE TABLE abs_mdi."BuilderAccessSection" (
  "BuilderAccessSectionId" NUMBER(10) NOT NULL,
  "BuilderAccessPermissionId" NUMBER(10),
  "SectionId" NUMBER(10),
  "IsAvailable" CHAR,
  "MinValue" NUMBER(10,5),
  "MaxValue" NUMBER(10,5),
  "SelectiveTab" VARCHAR2(50 BYTE),
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" VARCHAR2(50 BYTE),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsFeetInchFormat" CHAR,
  CONSTRAINT "BuilderAccessSection_PK" PRIMARY KEY ("BuilderAccessSectionId")
);