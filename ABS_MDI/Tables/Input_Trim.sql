CREATE TABLE abs_mdi."Input_Trim" (
  "TrimId" NUMBER(5) NOT NULL,
  "BuildingNumber" NUMBER(5),
  "SW1TrimOption" VARCHAR2(30 BYTE),
  "SW2TrimOption" VARCHAR2(30 BYTE),
  "EW3TrimOption" VARCHAR2(30 BYTE),
  "EW4TrimOption" VARCHAR2(30 BYTE),
  "SW1NorthernGutter" NUMBER(5),
  "SW2NorthernGutter" NUMBER(5),
  "EW3NorthernGutter" NUMBER(5),
  "EW4NorthernGutter" NUMBER(5),
  "SW1GutterSize" NUMBER(5),
  "SW2GutterSize" NUMBER(5),
  "EW3GutterSize" NUMBER(5),
  "EW4GutterSize" NUMBER(5),
  "SW1IncludeElbows" NUMBER(5),
  "SW2IncludeElbows" NUMBER(5),
  "EW3IncludeElbows" NUMBER(5),
  "EW4IncludeElbows" NUMBER(5),
  "SW1Drops" NUMBER(5),
  "SW2Drops" NUMBER(5),
  "EW3Drops" NUMBER(5),
  "EW4Drops" NUMBER(5),
  "SW1DropHeight" NUMBER(8,2),
  "SW2DropHeight" NUMBER(8,2),
  "EW3DropHeight" NUMBER(8,2),
  "EW4DropHeight" NUMBER(8,2),
  "TrimProfile" VARCHAR2(30 BYTE),
  "AdditionalGutterSupports" NUMBER(5),
  "IsSW1MatchEavaHeight" NUMBER(5),
  "IsSW2MatchEavaHeight" NUMBER(5),
  "IsEW3MatchEavaHeight" NUMBER(5),
  "IsEW4MatchEavaHeight" NUMBER(5),
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDelete" CHAR,
  "StructScrews" VARCHAR2(20 BYTE),
  "StitchScrews" VARCHAR2(20 BYTE),
  "DistFromBase" NUMBER(10,2),
  "EaveTrimType" VARCHAR2(20 BYTE),
  "WallCategory" VARCHAR2(20 BYTE),
  "IsBuyout" NUMBER(10),
  "SquareFeet" NUMBER(10,2),
  "GutterType" VARCHAR2(20 BYTE),
  "SW1GutterDesignSize" NUMBER(10),
  "DownspoutType" VARCHAR2(20 BYTE),
  "SW2GutterDesignSize" NUMBER(10),
  "BaseOption" VARCHAR2(20 BYTE),
  "UseType2Trim" NUMBER(10),
  "EW3GutterDesignSize" NUMBER(10),
  "EW4GutterDesignSize" NUMBER(10),
  "SillClosures" NUMBER(10),
  "BaseDetail" VARCHAR2(20 BYTE),
  "BaseTrim" VARCHAR2(20 BYTE),
  "FastenerVender" VARCHAR2(20 BYTE),
  "IMPPlant" NUMBER(10),
  "IMPLoads" NUMBER(10),
  CONSTRAINT "Input_WallPanelTrim_PK" PRIMARY KEY ("TrimId")
);