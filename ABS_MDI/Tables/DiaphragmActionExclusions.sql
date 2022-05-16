CREATE TABLE abs_mdi."DiaphragmActionExclusions" (
  "DiaphragmActionExclusionId" NUMBER(10) NOT NULL,
  "IsGeoRegionExclude" CHAR NOT NULL,
  "IpAddress" VARCHAR2(20 BYTE),
  "GeoRegionId" NUMBER(10) NOT NULL,
  "CompanyId" NUMBER(10),
  "CreatedBy" NUMBER,
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER,
  "ModifiedDate" TIMESTAMP,
  CONSTRAINT "DiaphragmActionExclusions_PK" PRIMARY KEY ("DiaphragmActionExclusionId"),
  CONSTRAINT diaphragmcompany_fk FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId"),
  CONSTRAINT "DiaphragmGeoRegion_FK" FOREIGN KEY ("GeoRegionId") REFERENCES abs_mdi."GeoRegions" ("GeoRegionId")
);