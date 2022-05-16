CREATE TABLE abs_mdi.ddp_defaultnotedrawing (
  notedrawingid NUMBER NOT NULL,
  categoryid NUMBER,
  subcategoryid NUMBER,
  description NCLOB,
  createdby NUMBER,
  createddate TIMESTAMP,
  modifiedby NUMBER,
  modifieddate TIMESTAMP,
  isdelete NCHAR DEFAULT 'N',
  ipaddress VARCHAR2(20 BYTE),
  edskey NUMBER(38),
  ddpkey NUMBER,
  CONSTRAINT ddp_defaultnotedrawing_pk PRIMARY KEY (notedrawingid),
  CONSTRAINT ddp_defaultnotedrawing_fk1 FOREIGN KEY (categoryid) REFERENCES abs_mdi.ddp_defaultnotesondrawingcategory (categoryid),
  CONSTRAINT ddp_defaultnotedrawing_fk2 FOREIGN KEY (subcategoryid) REFERENCES abs_mdi.ddp_defaultnotesondrawingsubcategory (subcategoryid)
);