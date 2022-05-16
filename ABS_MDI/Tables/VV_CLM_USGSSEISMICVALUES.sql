CREATE TABLE abs_mdi.vv_clm_usgsseismicvalues (
  "Id" NUMBER(10) NOT NULL,
  "DesignCodeID" NUMBER(10) NOT NULL,
  "Lat" FLOAT NOT NULL,
  "Lon" FLOAT NOT NULL,
  ss FLOAT NOT NULL,
  s1 FLOAT NOT NULL,
  "PGa" FLOAT NOT NULL,
  "GeoPoint" sdo_geometry,
  geopoint_clob CLOB
);