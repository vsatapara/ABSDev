CREATE TABLE abs_mdi.ddp_bookmark (
  bookmarkid NUMBER NOT NULL,
  bookmarkname NVARCHAR2(256),
  regexpression NVARCHAR2(256),
  grab0 NVARCHAR2(256),
  grab1 NVARCHAR2(256),
  isdelete CHAR DEFAULT 'N',
  createdby NUMBER,
  createddate TIMESTAMP,
  modifiedby NUMBER,
  modifieddate TIMESTAMP,
  ipaddress VARCHAR2(50 BYTE),
  CONSTRAINT ddp_bookmark_pk PRIMARY KEY (bookmarkid)
);