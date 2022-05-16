CREATE TABLE abs_mdi."BuilderAdministrator_Copy" (
  "BuilderAdministratorId" NUMBER NOT NULL,
  "Email" NVARCHAR2(128),
  "BuilderInformationInstruction" NCLOB,
  "BuilderContactInstruction" NCLOB,
  "SubmissionConfirmationInstruction" NCLOB,
  "CreatedBy" NUMBER,
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER,
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "CompanyId" NUMBER(10) NOT NULL,
  CONSTRAINT "BuilderAdministrator_PK" PRIMARY KEY ("BuilderAdministratorId"),
  CONSTRAINT "BuilderAdministrator_UK1" UNIQUE ("CompanyId")
);