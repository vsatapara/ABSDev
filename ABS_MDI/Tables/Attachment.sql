CREATE TABLE abs_mdi."Attachment" (
  "AttachmentType" VARCHAR2(50 BYTE) NOT NULL,
  "AttachmentName" NVARCHAR2(200),
  "AttachmentPath" NCLOB,
  "IsDelete" CHAR,
  "AttachedDate" TIMESTAMP,
  "AttachmentId" NUMBER(10) NOT NULL,
  "AttachmentBase64" CLOB,
  CONSTRAINT attachment_pk PRIMARY KEY ("AttachmentId")
);