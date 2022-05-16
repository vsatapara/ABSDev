CREATE TABLE abs_mdi."TermsConditions" (
  "TermsConditionsId" NUMBER(10) NOT NULL,
  "Title" NVARCHAR2(50) NOT NULL,
  "Content" NCLOB,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "FileId" VARCHAR2(200 BYTE),
  CONSTRAINT termsconditions_pk PRIMARY KEY ("TermsConditionsId")
);