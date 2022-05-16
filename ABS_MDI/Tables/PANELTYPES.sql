CREATE TABLE abs_mdi.paneltypes (
  panelid NUMBER NOT NULL,
  panelname VARCHAR2(20 BYTE) NOT NULL,
  isactive CHAR NOT NULL,
  CONSTRAINT paneltypes_pk PRIMARY KEY (panelid)
);