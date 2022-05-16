CREATE TABLE abs_mdi."EDSPrice_I_ProjectInformation" (
  "ProjectInformationId" NUMBER(10) NOT NULL,
  "NoteNumber" NUMBER(10),
  "Notes" VARCHAR2(255 BYTE),
  "ProjectNumber" NUMBER(10),
  "OrderWriter" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "Pk_EDSPrice_I_ProjectInformation_ProjectId" PRIMARY KEY ("ProjectInformationId")
);