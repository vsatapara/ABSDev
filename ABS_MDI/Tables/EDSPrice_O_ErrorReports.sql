CREATE TABLE abs_mdi."EDSPrice_O_ErrorReports" (
  "ErrorReportsId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10),
  "BuildingNumber" NUMBER(10),
  "Category" VARCHAR2(50 BYTE),
  "FullMessage" VARCHAR2(255 BYTE),
  "Suggestion" VARCHAR2(255 BYTE),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  CONSTRAINT "Pk_EDSPrice_O_ErrorReports_ProjectId" PRIMARY KEY ("ErrorReportsId")
);