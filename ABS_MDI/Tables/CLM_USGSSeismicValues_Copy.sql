CREATE TABLE abs_mdi."CLM_USGSSeismicValues_Copy" (
  "Id" NUMBER(10) NOT NULL,
  "DesignCodeID" NUMBER(10) NOT NULL,
  "Lat" FLOAT NOT NULL,
  "Lon" FLOAT NOT NULL,
  ss FLOAT NOT NULL,
  s1 FLOAT NOT NULL,
  "PGa" FLOAT NOT NULL,
  "GeoPoint" sdo_geometry,
  PRIMARY KEY ("Id")
);