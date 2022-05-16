CREATE TABLE abs_mdi.ddp_tsservers (
  serverid NUMBER NOT NULL,
  servername VARCHAR2(200 BYTE),
  prettyname VARCHAR2(200 BYTE),
  "PATH" VARCHAR2(500 BYTE),
  createdby NUMBER,
  createddate TIMESTAMP,
  modifiedby NUMBER,
  modifieddate TIMESTAMP,
  ipaddress VARCHAR2(100 BYTE),
  isdelete CHAR DEFAULT 'N',
  CONSTRAINT ddp_tsservers_pk PRIMARY KEY (serverid)
);