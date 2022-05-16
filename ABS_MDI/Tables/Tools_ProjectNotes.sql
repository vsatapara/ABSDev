CREATE TABLE abs_mdi."Tools_ProjectNotes" (
  "ProjectNotesId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10),
  "NotesContent" NCLOB,
  "CreatedBy" VARCHAR2(200 BYTE),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" VARCHAR2(200 BYTE),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  CONSTRAINT "Tools_ProjectNotes_PK" PRIMARY KEY ("ProjectNotesId")
);