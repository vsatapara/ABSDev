CREATE TABLE abs_mdi.ddp_usercustomnotes (
  customnotesid NUMBER NOT NULL,
  userdetailid NUMBER,
  customnote NCLOB,
  createdby NUMBER,
  createddate TIMESTAMP,
  modifiedby NUMBER,
  modifieddate TIMESTAMP,
  isdelete NCHAR DEFAULT 'N',
  ipaddress VARCHAR2(20 BYTE),
  CONSTRAINT ddp_usercustomnotes_pk PRIMARY KEY (customnotesid)
);