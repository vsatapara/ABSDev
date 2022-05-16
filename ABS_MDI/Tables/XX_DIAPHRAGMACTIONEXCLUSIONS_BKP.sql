CREATE TABLE abs_mdi.xx_diaphragmactionexclusions_bkp (
  "DiaphragmActionExclusionId" NUMBER(10) NOT NULL,
  "IsGeoRegionExclude" CHAR NOT NULL,
  "IpAddress" VARCHAR2(20 BYTE),
  "GeoRegionId" NUMBER(10) NOT NULL,
  "CompanyId" NUMBER(10),
  "CreatedBy" NUMBER,
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER,
  "ModifiedDate" TIMESTAMP
);