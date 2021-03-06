CREATE TABLE abs_mdi.accesories_wainscot (
  fromcolumn NUMBER(2) NOT NULL,
  wainscotid NUMBER(10) NOT NULL,
  projectid NUMBER(10) NOT NULL,
  buildinginformationid NUMBER(10),
  quantity NUMBER(1),
  height FLOAT,
  tocolumn NUMBER(2),
  transitionstyleid NUMBER(10),
  paneltypeid NUMBER(10),
  panelthicknessid NUMBER(10),
  panelcolorid VARCHAR2(100 BYTE),
  transitiontrimcolorid VARCHAR2(100 BYTE),
  ipaddress VARCHAR2(50 BYTE),
  isdelete CHAR,
  createdby NUMBER(10),
  createddate TIMESTAMP,
  modifiedby NUMBER(10),
  modifieddate TIMESTAMP,
  userid NUMBER(10),
  elevation VARCHAR2(10 BYTE),
  PRIMARY KEY (wainscotid)
);