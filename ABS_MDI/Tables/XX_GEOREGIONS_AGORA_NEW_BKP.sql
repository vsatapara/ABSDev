CREATE TABLE abs_mdi.xx_georegions_agora_new_bkp (
  "GeoRegionId" NUMBER(*,0) NOT NULL,
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
  region_new sdo_geometry
);