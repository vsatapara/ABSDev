CREATE TABLE abs_mdi."ProjectNotes" (
  "ProjectNoteId" NUMBER(10) NOT NULL,
  "CustomerId" NUMBER(10),
  "Year" NUMBER(2),
  "Type" NVARCHAR2(2),
  "Key" NUMBER,
  "Note" CLOB,
  createdby NUMBER(5),
  createddate TIMESTAMP,
  modifiedby NUMBER(5),
  modifieddate TIMESTAMP,
  ipaddress VARCHAR2(20 BYTE),
  isdelete CHAR DEFAULT 'Y',
  CONSTRAINT "ProjectNotes_PK" PRIMARY KEY ("ProjectNoteId"),
  CONSTRAINT "ProjectNotes_R01" FOREIGN KEY ("CustomerId") REFERENCES abs_mdi."Customer" ("CustomerID")
);