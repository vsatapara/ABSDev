CREATE TABLE abs_mdi."ShippingZone" (
  "ShippingZoneId" NUMBER(10) NOT NULL,
  "CompanyId" NUMBER(10),
  "GeoRegionId" NUMBER(10),
  "IsGeoRegionIncluded" CHAR,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "Zone" CHAR,
  "IpAddress" VARCHAR2(50 BYTE),
  CONSTRAINT "ShippingZone_PK" PRIMARY KEY ("ShippingZoneId"),
  CONSTRAINT "ShippingZoneGeoRegion_FK" FOREIGN KEY ("GeoRegionId") REFERENCES abs_mdi."GeoRegions" ("GeoRegionId")
);