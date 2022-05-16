CREATE TABLE abs_mdi.xx_usgsseismicvalues_big (
  guid VARCHAR2(500 BYTE),
  designcodeid NUMBER(10),
  geopoint sdo_geometry,
  lat FLOAT,
  lon FLOAT,
  ss FLOAT,
  s1 FLOAT,
  pga FLOAT
);