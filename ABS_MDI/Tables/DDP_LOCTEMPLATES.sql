CREATE TABLE abs_mdi.ddp_loctemplates (
  loctemplateid NUMBER NOT NULL,
  categoryid NUMBER,
  description NCLOB,
  createdby NUMBER,
  createddate TIMESTAMP,
  modifiedby NUMBER,
  isdelete CHAR DEFAULT 'N',
  modifieddate TIMESTAMP,
  ipaddress VARCHAR2(20 BYTE),
  loctemplateskeyward VARCHAR2(50 BYTE),
  CONSTRAINT ddp_loctemplates_pk PRIMARY KEY (loctemplateid)
);