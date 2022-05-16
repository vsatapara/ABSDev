CREATE TABLE abs_mdi."EDSPrice_CAD_Landscape" (
  "LandscapeId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10),
  "DrawingName" VARCHAR2(50 BYTE),
  "BlockName" VARCHAR2(50 BYTE),
  "XCoordinate" NUMBER(10,2),
  "YCoordinate" NUMBER(10,2),
  "ZCoordinate" NUMBER(10,2),
  "ScreenSize" NUMBER(10),
  "Rotation" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  CONSTRAINT "EDSPrice_CAD_Landscape_PK" PRIMARY KEY ("LandscapeId")
);