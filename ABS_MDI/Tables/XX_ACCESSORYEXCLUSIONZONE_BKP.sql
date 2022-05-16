CREATE TABLE abs_mdi.xx_accessoryexclusionzone_bkp (
  "AccessoryExclusionId" NUMBER(10) NOT NULL,
  "CompanyId" NUMBER(5),
  "GeoRegionId" NUMBER(5),
  "AccessoryId" NUMBER(5),
  "IsExcluded" CHAR,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(50 BYTE)
);