CREATE TABLE abs_mdi.xx_usgssvalues_new (
  "ID" NUMBER(10) GENERATED AS IDENTITY,
  designcodeid NUMBER(10) NOT NULL,
  geopoint sdo_geometry,
  lat FLOAT NOT NULL,
  lon FLOAT NOT NULL,
  ss FLOAT NOT NULL,
  s1 FLOAT NOT NULL,
  pga FLOAT NOT NULL
);