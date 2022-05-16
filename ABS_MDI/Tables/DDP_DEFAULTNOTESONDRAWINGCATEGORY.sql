CREATE TABLE abs_mdi.ddp_defaultnotesondrawingcategory (
  categoryid NUMBER NOT NULL,
  categoryname VARCHAR2(256 BYTE),
  orderpriority NUMBER,
  isdelete CHAR DEFAULT 'N',
  createdby NUMBER,
  createddate TIMESTAMP,
  modifiedby NUMBER,
  modifieddate TIMESTAMP,
  ipaddress VARCHAR2(50 BYTE),
  CONSTRAINT ddp_defaultnotesondrawingcategory_pk PRIMARY KEY (categoryid)
);