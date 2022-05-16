CREATE TABLE abs_mdi."GeoRegions_Copy1" (
  "GeoRegionGUID" CHAR(255 BYTE) NOT NULL,
  "Shape" BLOB,
  "Description" NVARCHAR2(80) DEFAULT '',
  "Comments" NVARCHAR2(1024) DEFAULT '',
  "AnsiId" NVARCHAR2(50) DEFAULT '',
  PRIMARY KEY ("GeoRegionGUID")
);