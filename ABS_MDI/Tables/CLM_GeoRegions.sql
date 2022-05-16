CREATE TABLE abs_mdi."CLM_GeoRegions" (
  "GeoRegionId" VARCHAR2(50 BYTE) NOT NULL,
  "Description" NVARCHAR2(80) NOT NULL,
  "Comments" NVARCHAR2(1024) NOT NULL,
  "AnsiId" NVARCHAR2(50),
  "Shape" sdo_geometry,
  CONSTRAINT "CLM_GeoRegions_PK" PRIMARY KEY ("GeoRegionId")
);