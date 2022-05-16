CREATE TABLE abs_mdi.xx_ssis_georegions (
  georegionid NUMBER(38) NOT NULL,
  "NAME" NVARCHAR2(120) NOT NULL,
  isactive CHAR NOT NULL,
  createdby NUMBER(10),
  createddate TIMESTAMP,
  modifiedby NUMBER(10),
  modifieddate TIMESTAMP,
  ipaddress VARCHAR2(20 BYTE),
  kmlfileid NUMBER(10),
  isdelete CHAR,
  region sdo_geometry
);