CREATE TABLE abs_mdi."CustomerArchiveFolders" (
  "CustomerArchiveFolderGuid" RAW(16) NOT NULL,
  "CustomerId" NUMBER(10) NOT NULL,
  "Name" NVARCHAR2(250),
  "ParentCustomerArchiveFolderGuid" RAW(16),
  "SortOrder" NUMBER(9),
  createdby NUMBER(5),
  createddate TIMESTAMP,
  modifiedby NUMBER(5),
  modifieddate TIMESTAMP,
  ipaddress VARCHAR2(20 BYTE),
  isdelete CHAR DEFAULT 'N',
  CONSTRAINT "CustomerArchiveFolders_PK" PRIMARY KEY ("CustomerArchiveFolderGuid")
);