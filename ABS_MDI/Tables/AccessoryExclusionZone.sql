CREATE TABLE abs_mdi."AccessoryExclusionZone" (
  "AccessoryExclusionId" NUMBER(10) NOT NULL,
  "CompanyId" NUMBER(5),
  "GeoRegionId" NUMBER(5),
  "AccessoryId" NUMBER(5),
  "IsExcluded" CHAR,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(50 BYTE),
  CONSTRAINT accessoryexclusionzone_pk PRIMARY KEY ("AccessoryExclusionId"),
  CONSTRAINT accessorytype_fk FOREIGN KEY ("AccessoryId") REFERENCES abs_mdi."AccessoryType" ("AccessoryTypeId"),
  CONSTRAINT accessory_fk FOREIGN KEY ("AccessoryId") REFERENCES abs_mdi."Accessory" ("AccessoryId") DISABLE NOVALIDATE,
  CONSTRAINT company_fk FOREIGN KEY ("CompanyId") REFERENCES abs_mdi."Company" ("CompanyId"),
  CONSTRAINT georegion_fk FOREIGN KEY ("GeoRegionId") REFERENCES abs_mdi."GeoRegions" ("GeoRegionId")
);