CREATE TABLE abs_mdi."Accessories_Facade" (
  "FacadeId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10),
  "BuildingInformationId" NUMBER(10),
  "Elevation" VARCHAR2(10 BYTE),
  "StartCol" NUMBER(10),
  "StopCol" NUMBER(10),
  "DistFromLeftCorner" NUMBER(10,2),
  "Length" NUMBER(10,2),
  "Type" VARCHAR2(50 BYTE),
  "Projection" NUMBER(10,2),
  "Height" NUMBER(10,2),
  "Gutter" CHAR,
  "Slant" NUMBER(10,2),
  "PanelType" VARCHAR2(50 BYTE),
  "PanelGauge" NUMBER(10),
  "PanelFinish" VARCHAR2(50 BYTE),
  "SoffitPanelType" VARCHAR2(50 BYTE),
  "SoffitPanelGauge" NUMBER(10),
  "SoffitPanelFinish" VARCHAR2(50 BYTE),
  "FacadePanel" CHAR,
  "SoffitPanel" CHAR,
  "SoffitElevation" NUMBER(10,2),
  "BackPanelType" VARCHAR2(50 BYTE),
  "BackPanelGauge" NUMBER(10),
  "BackPanelColor" VARCHAR2(50 BYTE),
  "SillCapTrim" VARCHAR2(50 BYTE),
  "CornerTrim" VARCHAR2(50 BYTE),
  "SoffitTrim" VARCHAR2(50 BYTE),
  "FacadeFacingSpecial" NUMBER(10),
  "FacadeFacingWeight" NUMBER(10,2),
  "FacadeFacingDeflection" NUMBER(10),
  "SoffitFacingSpecial" NUMBER(10),
  "SoffitFacingWeight" NUMBER(10),
  "SoffitFacingDeflection" NUMBER(10),
  "ReverseRollFace" NUMBER(10),
  "ReverseRollBack" NUMBER(10),
  "ReverseRollSoffit" NUMBER(10),
  "PanelFinishValsparCode" VARCHAR2(50 BYTE),
  "PanelFinishSpecialName" VARCHAR2(50 BYTE),
  "SoffitPanelFinishValsparCode" VARCHAR2(50 BYTE),
  "SoffitPanelFinishSpecialName" VARCHAR2(50 BYTE),
  "BackPanelColorValsparCode" VARCHAR2(50 BYTE),
  "BackPanelColorSpecialName" VARCHAR2(50 BYTE),
  "SillCapTrimValsparCode" VARCHAR2(50 BYTE),
  "SillCapTrimSpecialName" VARCHAR2(50 BYTE),
  "CornerTrimValsparCode" VARCHAR2(50 BYTE),
  "CornerTrimSpecialName" VARCHAR2(50 BYTE),
  "SoffitTrimValsparCode" VARCHAR2(50 BYTE),
  "SoffitTrimSpecialName" VARCHAR2(50 BYTE),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDelete" CHAR,
  "BackupCover" CHAR DEFAULT 'N',
  "Trim" VARCHAR2(50 BYTE),
  "CornerUnits" VARCHAR2(50 BYTE),
  "EndCaps" CHAR DEFAULT 'N',
  "Galvanized" CHAR DEFAULT 'N',
  "LinerPanel" CHAR DEFAULT 'N',
  "FacadeWeight" NUMBER(10,2) DEFAULT 0,
  "FacadePrice" NUMBER(10,2) DEFAULT 0,
  "SoffitPanelWeight" NUMBER(10,2) DEFAULT 0,
  "SoffitPanelPrice" NUMBER(10,2) DEFAULT 0,
  "FacadeIsPriced" CHAR DEFAULT 'N',
  "FacadeErrorCode" NUMBER(10) DEFAULT 0,
  "DeductLiner" CHAR DEFAULT 'N',
  "DeductTrim" CHAR DEFAULT 'N',
  "SillCapTrimGauge" NUMBER(10) DEFAULT 0,
  "CornerTrimGauge" NUMBER(10) DEFAULT 0,
  "SoffitTrimGauge" NUMBER(10) DEFAULT 0,
  "FacadeWeightMBCI" NUMBER(10,2) DEFAULT 0,
  "FacadePriceMBCI" NUMBER(10,2) DEFAULT 0,
  "DesignIndex" NUMBER(10) DEFAULT 0,
  "FaceSquareFeet" NUMBER(10,2) DEFAULT 0,
  "BackSquareFeet" NUMBER(10,2) DEFAULT 0,
  "SoffitSquareFeet" NUMBER(10,2) DEFAULT 0,
  "RoofSquareFeet" NUMBER(10,2) DEFAULT 0,
  CONSTRAINT "Accessories_Facade_PK" PRIMARY KEY ("FacadeId"),
  CONSTRAINT "FK_FacadeBuildingId" FOREIGN KEY ("BuildingInformationId") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);