CREATE TABLE abs_mdi.weblinksmaster (
  weblinkid NUMBER(*,0) NOT NULL,
  tabs VARCHAR2(200 BYTE),
  weblinks VARCHAR2(1000 BYTE),
  extra_material VARCHAR2(1000 BYTE),
  CONSTRAINT weblinksmaster_pk PRIMARY KEY (weblinkid)
);