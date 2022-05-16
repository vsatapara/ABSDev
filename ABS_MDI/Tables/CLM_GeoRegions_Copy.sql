CREATE TABLE abs_mdi."CLM_GeoRegions_Copy" (
  "GeoRegionGUID" CHAR(255 BYTE) NOT NULL,
  "Description" NVARCHAR2(80) DEFAULT '' NOT NULL,
  "Comments" NVARCHAR2(1024) DEFAULT '' NOT NULL,
  "AnsiId" NVARCHAR2(50) DEFAULT '',
  "Shape" sdo_geometry,
  PRIMARY KEY ("GeoRegionGUID")
);