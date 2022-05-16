CREATE TABLE abs_mdi."Input_Endwalls_Recesses" (
  ewrid NUMBER(10) NOT NULL,
  "BuildingNo" NUMBER(10),
  "EWRType" VARCHAR2(10 BYTE),
  "RecessNo" NUMBER(10),
  "Recesses" VARCHAR2(20 BYTE),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "EndWallID" NUMBER,
  "IsDeleted" CHAR,
  "IsFrameColumn" NUMBER(10),
  CONSTRAINT "Input_Endwalls_Recesses_PK" PRIMARY KEY (ewrid)
);