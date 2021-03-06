CREATE TABLE abs_mdi."Input_GirtsBaySpacing" (
  "GirtSpacingId" NUMBER(10) NOT NULL,
  "BuildingInformationId" NUMBER(10),
  "SW1Style" NUMBER(10),
  "SW2Style" NUMBER(10),
  "EW1Style" NUMBER(10),
  "EW2Style" NUMBER(10),
  "RoofPurlinStyle" NUMBER(10),
  "SW1Depth" NUMBER(10),
  "SW2Depth" NUMBER(10),
  "EW1Depth" NUMBER(10),
  "EW2Depth" NUMBER(10),
  "RoofPurlinDepth" NUMBER(10),
  "SW1Optimize" CHAR,
  "SW2Optimize" CHAR,
  "EW1Optimize" CHAR,
  "EW2Optimize" CHAR,
  "RoofPurlinOptimize" CHAR,
  "RoofBaySpacing" NUMBER(10),
  "WallBaySpacing" VARCHAR2(20 BYTE),
  "GirtSpacing" VARCHAR2(20 BYTE),
  "PurlinSpacing" VARCHAR2(20 BYTE),
  "LBPMinDepth" FLOAT,
  "LBPMaxDepth" FLOAT,
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IsDelete" CHAR,
  "IpAddress" VARCHAR2(20 BYTE),
  "FrameBoltWashers" NUMBER(10),
  "GrayPrimer" NUMBER(10),
  "OptimizeGirt1" NUMBER(10),
  "OptimizeGirt2" NUMBER(10),
  "OptimizePurlin" NUMBER(10),
  "GirtWidth1" NUMBER(10,2),
  "GirtWidth2" NUMBER(10,2),
  "PurlinWidth" NUMBER(10,2),
  "PortalRafterDepth1" NUMBER(10,2),
  "PortalRafterDepth2" NUMBER(10,2),
  "PortalColumnDepth1" NUMBER(10,2),
  "PortalColumnDepth2" NUMBER(10,2),
  "LBPBracingLoc" VARCHAR2(50 BYTE),
  CONSTRAINT "Input_GirtsBaySpacing_PK" PRIMARY KEY ("GirtSpacingId"),
  CONSTRAINT "FK_Input_GirtsAndPurlin_BuildingNo" FOREIGN KEY ("BuildingInformationId") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId"),
  CONSTRAINT "FK_Input_GirtsAndPurlin_EWBDepth" FOREIGN KEY ("EW1Depth") REFERENCES abs_mdi."GirtsAndPurlinDepth" ("DepthId") DISABLE NOVALIDATE,
  CONSTRAINT "FK_Input_GirtsAndPurlin_EWBStyle" FOREIGN KEY ("EW1Style") REFERENCES abs_mdi."GirtsAndPurlinStyle" ("StyleId"),
  CONSTRAINT "FK_Input_GirtsAndPurlin_EWDDepth" FOREIGN KEY ("EW2Depth") REFERENCES abs_mdi."GirtsAndPurlinDepth" ("DepthId") DISABLE NOVALIDATE,
  CONSTRAINT "FK_Input_GirtsAndPurlin_EWDStyle" FOREIGN KEY ("EW2Style") REFERENCES abs_mdi."GirtsAndPurlinStyle" ("StyleId"),
  CONSTRAINT "FK_Input_GirtsAndPurlin_RoofPurlinDepth" FOREIGN KEY ("RoofPurlinDepth") REFERENCES abs_mdi."GirtsAndPurlinDepth" ("DepthId"),
  CONSTRAINT "FK_Input_GirtsAndPurlin_RoofPurlinStyle" FOREIGN KEY ("RoofPurlinStyle") REFERENCES abs_mdi."GirtsAndPurlinStyle" ("StyleId"),
  CONSTRAINT "FK_Input_GirtsAndPurlin_SWADepth" FOREIGN KEY ("SW1Depth") REFERENCES abs_mdi."GirtsAndPurlinDepth" ("DepthId"),
  CONSTRAINT "FK_Input_GirtsAndPurlin_SWAStyle" FOREIGN KEY ("SW1Style") REFERENCES abs_mdi."GirtsAndPurlinStyle" ("StyleId"),
  CONSTRAINT "FK_Input_GirtsAndPurlin_SWCDepth" FOREIGN KEY ("SW2Depth") REFERENCES abs_mdi."GirtsAndPurlinDepth" ("DepthId"),
  CONSTRAINT "FK_Input_GirtsAndPurlin_SWCStyle" FOREIGN KEY ("SW2Style") REFERENCES abs_mdi."GirtsAndPurlinStyle" ("StyleId")
);