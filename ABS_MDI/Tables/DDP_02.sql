CREATE TABLE abs_mdi.ddp_02 (
  tableno NUMBER,
  reactionname VARCHAR2(20 BYTE),
  column1 VARCHAR2(20 BYTE),
  fkddp01 NUMBER NOT NULL,
  CONSTRAINT ddp_02_pk PRIMARY KEY (fkddp01),
  CONSTRAINT fk_forddp_02 FOREIGN KEY (fkddp01) REFERENCES abs_mdi.ddp_01 (datanumber)
);