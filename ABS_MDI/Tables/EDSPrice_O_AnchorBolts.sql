CREATE TABLE abs_mdi."EDSPrice_O_AnchorBolts" (
  "AnchorBoltsId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10),
  "BuildingNumber" NUMBER(10),
  "Elevation" VARCHAR2(50 BYTE),
  "FramelineOrColNumber" NUMBER(10),
  "NumberOfBolts" NUMBER(10),
  "Diameter" NUMBER(10,2),
  "Projection" NUMBER(10,2),
  "Gauge" NUMBER(10,2),
  "Space" NUMBER(10,2),
  "DistFromWall" NUMBER(10,2),
  "DistFromLeftCorner" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  CONSTRAINT "Pk_EDSPrice_O_AnchorBolts_ProjectId" PRIMARY KEY ("AnchorBoltsId")
);