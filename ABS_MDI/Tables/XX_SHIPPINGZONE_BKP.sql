CREATE TABLE abs_mdi.xx_shippingzone_bkp (
  "ShippingZoneId" NUMBER(10) NOT NULL,
  "InclusionExclusionId" NUMBER(10),
  "GeoRegionId" NUMBER(10),
  "IsGeoRegionIncluded" CHAR,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "Zone" CHAR,
  "IpAddress" VARCHAR2(50 BYTE)
);