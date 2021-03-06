CREATE TABLE abs_mdi."Accessories_Louvers" (
  "LouverId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10),
  "BuildingId" NUMBER(10),
  "Quantity" NUMBER,
  "Elevation" CHAR,
  "BayNumber" NUMBER,
  "SillHeight" NUMBER(*,0),
  "HeaderHeight" NUMBER,
  "Width" NUMBER,
  "DistFromLeftCorner" NUMBER(10,4),
  "DistFromLeftCol" NUMBER(10,4),
  "TrimColor" VARCHAR2(100 BYTE),
  "LouverColor" VARCHAR2(100 BYTE),
  "SubFraming" NUMBER,
  "Type" VARCHAR2(15 BYTE),
  "LouverSize" VARCHAR2(15 BYTE),
  "LocatedInLiner" CHAR,
  "IncludeFramedOpening" CHAR,
  "RunOfLouvers" CHAR,
  "PartitionNumber" NUMBER,
  "BracedBay" NUMBER,
  "LouverColorValsparCode" VARCHAR2(100 BYTE),
  "LouverColorSpecialName" VARCHAR2(100 BYTE),
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDelete" CHAR DEFAULT 'N',
  "CreatedBy" NUMBER,
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER,
  "ModifiedDate" TIMESTAMP,
  "TrimColorValsparCode" VARCHAR2(100 BYTE),
  "TrimColorSpecialName" VARCHAR2(100 BYTE),
  "Quality" VARCHAR2(20 BYTE),
  "WallExhausterPowerSource" VARCHAR2(20 BYTE),
  "LouverWeight" NUMBER(10,2),
  "LouverPrice" NUMBER(10,2),
  "WallExhausterWeight" NUMBER(10,2),
  "WallExhausterPrice" NUMBER(10,2),
  "LouverIsPriced" CHAR,
  "LouverErrorCode" NUMBER(10,2),
  "WallExhausterIsPriced" CHAR,
  "WallExhausterErrorCode" VARCHAR2(20 BYTE),
  CONSTRAINT "Accessories_Louvers_PK" PRIMARY KEY ("LouverId")
);