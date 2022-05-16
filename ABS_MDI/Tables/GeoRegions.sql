CREATE TABLE abs_mdi."GeoRegions" (
  "Name" NVARCHAR2(120) NOT NULL,
  "IsActive" CHAR NOT NULL,
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "KMLFileId" NUMBER(10),
  "IsDelete" CHAR,
  "Region" CLOB,
  "Region_New" sdo_geometry,
  "GeoRegionId" NUMBER(10) NOT NULL,
  CONSTRAINT georegion_pk PRIMARY KEY ("GeoRegionId")
);