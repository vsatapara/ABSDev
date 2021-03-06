CREATE TABLE abs_mdi."Jobs" (
  "ProjectName" VARCHAR2(50 BYTE),
  "Builder" VARCHAR2(50 BYTE),
  "JobLocation" VARCHAR2(50 BYTE),
  "SquareFootage" NUMBER(10),
  "ServiceNeeded" VARCHAR2(200 BYTE),
  "ContactPhone" NUMBER(10),
  "ContactEmail" VARCHAR2(260 BYTE),
  "ContactName" VARCHAR2(50 BYTE),
  "DateNeeded" DATE,
  "JobId" NUMBER(10) NOT NULL,
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IsDelete" CHAR,
  "IpAddress" VARCHAR2(50 BYTE),
  "IsActive" CHAR,
  "CompanyId" NUMBER(10),
  CONSTRAINT "Jobs_PK" PRIMARY KEY ("JobId")
);