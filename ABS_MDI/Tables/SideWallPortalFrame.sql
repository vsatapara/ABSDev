CREATE TABLE abs_mdi."SideWallPortalFrame" (
  "PortalFrameId" NUMBER(10) NOT NULL,
  "SW1Height" CHAR,
  "SW1HeightValue" NUMBER(10,5),
  "SW1RodTiers" CHAR,
  "SW1WebDepthMaxColumn" NUMBER(10,5),
  "SW1WebDepthMaxRafter" NUMBER(10,5),
  "SW2Height" CHAR,
  "SW2HeightValue" NUMBER(10,5),
  "SW2RodTiers" CHAR,
  "SW2WebDepthMaxColumn" NUMBER(10,5),
  "SW2WebDepthMaxRafter" NUMBER(10,5),
  "BracingId" NUMBER(10),
  "BuildingInformationId" NUMBER(10),
  CONSTRAINT "SideWallPortalFrame_PK" PRIMARY KEY ("PortalFrameId"),
  CONSTRAINT "SideWall_BracingId_FK" FOREIGN KEY ("BracingId") REFERENCES abs_mdi."Bracing" ("BracingId")
);