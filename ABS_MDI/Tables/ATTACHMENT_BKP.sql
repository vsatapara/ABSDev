CREATE TABLE abs_mdi.attachment_bkp (
  "AttachmentId" NUMBER(18) NOT NULL,
  "AttachmentType" VARCHAR2(50 BYTE) NOT NULL,
  "AttachmentName" NVARCHAR2(200),
  "AttachmentPath" NCLOB,
  "IsDelete" CHAR,
  "AttachedDate" TIMESTAMP
);