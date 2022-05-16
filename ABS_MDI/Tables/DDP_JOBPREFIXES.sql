CREATE TABLE abs_mdi.ddp_jobprefixes (
  jobprefixid NUMBER NOT NULL,
  prefix VARCHAR2(20 BYTE) NOT NULL,
  isdefault CHAR DEFAULT 'N',
  createdby NUMBER(5),
  createddate TIMESTAMP,
  modifiedby NUMBER(5),
  modifieddate TIMESTAMP,
  isdelete CHAR DEFAULT 'N',
  ipaddress VARCHAR2(20 BYTE)
);