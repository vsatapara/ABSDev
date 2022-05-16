CREATE TABLE abs_mdi.vv_geo_regions (
  georegionid NUMBER(38),
  "NAME" VARCHAR2(120 CHAR),
  isactive CHAR,
  createdby NUMBER(10),
  createddate TIMESTAMP,
  modifiedby NUMBER(10),
  modifieddate TIMESTAMP,
  ipaddress VARCHAR2(20 BYTE),
  kmlfileid NUMBER(10),
  isdelete CHAR,
  region CLOB,
  region_new sdo_geometry
);