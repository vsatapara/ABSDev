CREATE TABLE abs_mdi."Bracing_XBraceAnchor" (
  "XBraceAnchorId" NUMBER(10) NOT NULL,
  "BayNumber" VARCHAR2(50 BYTE),
  "DistFromLeftCornerLeft" NUMBER(10,7),
  "DistFromLeftColumnLeft" NUMBER(10,7),
  "DistFromLeftCornerRight" NUMBER(10,7),
  "DistFromLeftColumnRight" NUMBER(10,7),
  "LeftSteelLine" CHAR,
  "BracingId" NUMBER(10),
  "BuildingInformationId" NUMBER(10),
  "Elevation" VARCHAR2(20 BYTE),
  CONSTRAINT "XBraceAnchor_PK" PRIMARY KEY ("XBraceAnchorId"),
  CONSTRAINT "BracingId_FK" FOREIGN KEY ("BracingId") REFERENCES abs_mdi."Bracing" ("BracingId")
);