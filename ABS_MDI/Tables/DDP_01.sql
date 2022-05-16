CREATE TABLE abs_mdi.ddp_01 (
  datanumber NUMBER NOT NULL,
  jobnumber VARCHAR2(20 BYTE),
  column1 VARCHAR2(20 BYTE),
  reportname VARCHAR2(20 BYTE),
  CONSTRAINT ddp_01_pk PRIMARY KEY (datanumber)
);