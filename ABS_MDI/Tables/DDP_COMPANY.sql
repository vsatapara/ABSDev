CREATE TABLE abs_mdi.ddp_company (
  companyid NUMBER(*,0) NOT NULL,
  companyprefix VARCHAR2(50 BYTE) NOT NULL,
  companyname VARCHAR2(200 BYTE) NOT NULL,
  createdby NUMBER(5),
  createddate TIMESTAMP,
  modifiedby NUMBER(5),
  modifieddate TIMESTAMP,
  isdelete CHAR DEFAULT 'N' NOT NULL,
  ipaddress VARCHAR2(20 BYTE),
  CONSTRAINT ddp_company_pk PRIMARY KEY (companyid)
);