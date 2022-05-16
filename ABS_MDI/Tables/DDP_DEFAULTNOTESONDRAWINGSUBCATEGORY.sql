CREATE TABLE abs_mdi.ddp_defaultnotesondrawingsubcategory (
  orderpriority NUMBER,
  categoryid NUMBER,
  subcategoryname VARCHAR2(256 BYTE),
  subcategoryid NUMBER NOT NULL,
  isdelete CHAR DEFAULT 'N',
  createdby NUMBER,
  createddate TIMESTAMP,
  modifiedby NUMBER,
  modifieddate TIMESTAMP,
  ipaddress VARCHAR2(50 BYTE),
  CONSTRAINT ddp_defaultnotesondrawingsubcategory_pk PRIMARY KEY (subcategoryid),
  CONSTRAINT ddp_defaultnotesondrawingsubcategory_fk1 FOREIGN KEY (categoryid) REFERENCES abs_mdi.ddp_defaultnotesondrawingcategory (categoryid)
);