CREATE TABLE abs_mdi."SBSAdmin" (
  "SBSAdminId" NUMBER(10) NOT NULL,
  "Title" VARCHAR2(128 BYTE) NOT NULL,
  "Content" CLOB NOT NULL,
  "BuilderWorxFileLink" VARCHAR2(256 BYTE),
  "BuilderWorxFileLinkText" VARCHAR2(256 BYTE),
  "ReleaseNotesFileLink" VARCHAR2(256 BYTE),
  "ReleaseNotesFileLinkText" VARCHAR2(256 BYTE),
  "Link1" VARCHAR2(256 BYTE),
  "Link1Text" VARCHAR2(128 BYTE),
  "Link2" VARCHAR2(256 BYTE),
  "Link2Text" VARCHAR2(128 BYTE),
  "Link3" VARCHAR2(256 BYTE),
  "Link3Text" VARCHAR2(128 BYTE),
  "Notes" CLOB,
  "CreatedBy" NUMBER(10) NOT NULL,
  "CreatedDate" TIMESTAMP NOT NULL,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "CompanyId" NUMBER(10),
  PRIMARY KEY ("SBSAdminId"),
  CONSTRAINT "SBSAdminComapny_FK" FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId")
);