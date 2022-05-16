CREATE TABLE abs_mdi."EndWallPotalFrame" (
  "EndWallProtalFrameId" NUMBER(10) NOT NULL,
  "EW3Height" CHAR,
  "EW3HeightValue" NUMBER(10,5),
  "EW3RodTiers" CHAR,
  "EW3WebDepthMaxColumn" NUMBER(10,5),
  "EW3WebDepthMaxRafter" NUMBER(10,5),
  "EW4Height" CHAR,
  "EW4HeightValue" NUMBER(10,5),
  "EW4RodTiers" CHAR,
  "EW4WebDepthMaxColumn" NUMBER(10,5),
  "EW4WebDepthMaxRafter" NUMBER(10,5),
  "BracingId" NUMBER(10),
  "BuildingInformationId" NUMBER(10),
  CONSTRAINT "EndWallPotalFrame_PK" PRIMARY KEY ("EndWallProtalFrameId"),
  CONSTRAINT bracing_bracingid_fk FOREIGN KEY ("BracingId") REFERENCES abs_mdi."Bracing" ("BracingId")
);