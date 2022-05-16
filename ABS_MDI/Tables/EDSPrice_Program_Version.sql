CREATE TABLE abs_mdi."EDSPrice_Program_Version" (
  "ProgramVersionId" NUMBER(10) NOT NULL,
  "Company" NUMBER(10),
  "Version" VARCHAR2(50 BYTE),
  CONSTRAINT "EDSPrice_Program_Version_PK" PRIMARY KEY ("ProgramVersionId")
);