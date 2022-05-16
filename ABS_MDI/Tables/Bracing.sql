CREATE TABLE abs_mdi."Bracing" (
  "BracingId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(5),
  "SW1BracingType" VARCHAR2(100 BYTE),
  "SW1Tiers" NUMBER(5),
  "SW1BracingLocations" VARCHAR2(100 BYTE),
  "SW1UnbraceableLocations" VARCHAR2(100 BYTE),
  "SW1ExcludeDiaphragm" NUMBER(5),
  "SW2BracingType" VARCHAR2(100 BYTE),
  "SW2Tiers" NUMBER(5),
  "SW2BracingLocations" VARCHAR2(50 BYTE),
  "SW2UnbraceableLocations" VARCHAR2(50 BYTE),
  "SW2ExcludeDiaphragm" NUMBER(5),
  "EW3BracingType" VARCHAR2(100 BYTE),
  "EW3Tiers" NUMBER(5),
  "EW3BracingLocations" VARCHAR2(100 BYTE),
  "EW3UnbraceableLocations" VARCHAR2(100 BYTE),
  "EW3ExcludeDiaphragm" NUMBER,
  "EW4BracingType" VARCHAR2(100 BYTE),
  "EW4Tiers" NUMBER(5),
  "EW4BracingLocations" VARCHAR2(100 BYTE),
  "EW4UnbraceableLocations" VARCHAR2(100 BYTE),
  "EW4ExcludeDiaphragm" NUMBER(5),
  "RoofBracingType" VARCHAR2(100 BYTE),
  "RoofBracingLocations" VARCHAR2(100 BYTE),
  "RoofUnbraceableLocations" VARCHAR2(100 BYTE),
  "RoofExcludeDiaphragm" NUMBER(5),
  "Purlins" VARCHAR2(100 BYTE),
  "Girts" VARCHAR2(100 BYTE),
  "ErectionRods" NUMBER(5),
  "AllowTorsion" NUMBER(5),
  "ErectionBayWidth" NUMBER(5),
  "RafterFlangeBrace" VARCHAR2(100 BYTE),
  "ColumnFlangeBrace" VARCHAR2(100 BYTE),
  "SW1PFrameType" NUMBER(5),
  "SW1PFrameHeight" NUMBER(5),
  "SW2PFrameType" NUMBER(5),
  "SW2PFrameHeight" NUMBER(5),
  "SW1FBBCRight" VARCHAR2(100 BYTE),
  "SW2FBBCRight" VARCHAR2(100 BYTE),
  "SW1Girts" VARCHAR2(100 BYTE) DEFAULT 'None',
  "SW2Girts" VARCHAR2(100 BYTE) DEFAULT 'None',
  "EW3Girts" VARCHAR2(100 BYTE) DEFAULT 'None',
  "EW4Girts" VARCHAR2(100 BYTE) DEFAULT 'None',
  "EW3PFrameType" NUMBER(5),
  "EW3PFrameHeight" NUMBER(5),
  "EW4PFrameType" NUMBER(5),
  "EW4PFrameHeight" NUMBER(5),
  "OverrideFlangeBraceRoof" NUMBER(5),
  "OverrideFlangeBraceWall" NUMBER(5),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "IsDelete" CHAR,
  "IpAddress" VARCHAR2(50 BYTE),
  "ModifiedDate" TIMESTAMP,
  "BuildingInformationId" NUMBER(10),
  "LBPBracingLocation" VARCHAR2(100 BYTE),
  "IsReset" CHAR DEFAULT 'N' NOT NULL,
  "PortalRafterDepth1" NUMBER,
  "PortalRafterDepth2" NUMBER,
  "PortalRafterDepth3" NUMBER,
  "PortalRafterDepth4" NUMBER,
  CONSTRAINT "Bracing_PK" PRIMARY KEY ("BracingId")
);