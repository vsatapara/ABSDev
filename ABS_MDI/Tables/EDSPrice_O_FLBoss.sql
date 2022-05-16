CREATE TABLE abs_mdi."EDSPrice_O_FLBoss" (
  "FLBossId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "Elevation" VARCHAR2(50 BYTE),
  "FramelineNumber" NUMBER(10),
  "Length" NUMBER(10,2),
  "HeightLocation" NUMBER(10,2),
  "FlangeThick" NUMBER(10,2),
  "FlangeWidth" NUMBER(10,2),
  "WebThick" NUMBER(10,2),
  "WebDepth" NUMBER(10,2),
  "PlateDepth" NUMBER(10,2),
  "PlateWidth" NUMBER(10,2),
  "PlateThick" NUMBER(10,2),
  "BoltDiameter" NUMBER(10,2),
  "ConnectionCode" VARCHAR2(50 BYTE),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "Pk_EDSPrice_O_FLBoss_ProjectId" PRIMARY KEY ("FLBossId"),
  CONSTRAINT eds_price_o_flboss_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);