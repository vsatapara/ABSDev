CREATE TABLE abs_mdi."Accessories_Parapet" (
  "ParapetId" NUMBER DEFAULT abs_mdi."Accessories_Parapet_SEQ"."NEXTVAL" NOT NULL,
  "ProjectId" NUMBER(10),
  "BuildingInformationId" NUMBER(10),
  "Elevation" VARCHAR2(1 BYTE),
  "StartColumn" NUMBER(10,2),
  "StopColumn" NUMBER(10,2),
  "DistFromLeftCorner" NUMBER(10,4),
  "Height" NUMBER(10,4),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDelete" CHAR,
  "IsPriced" CHAR,
  "Weight" NUMBER(10,2),
  "Price" NUMBER(10,2),
  "WeightMBCI" NUMBER(10,2),
  "PriceMBCI" NUMBER(10,2),
  "StructuralWeight" NUMBER(10,2),
  "IsInsulated" CHAR,
  "DesignIndex" NUMBER(10),
  "FrontSquareFeet" NUMBER(10,2),
  "BackSquareFeet" NUMBER(10,2),
  "ErrorCode" NUMBER(10),
  CONSTRAINT "Accessories_Parapet_PK" PRIMARY KEY ("ParapetId"),
  CONSTRAINT "FK_ParapetBuildingId" FOREIGN KEY ("BuildingInformationId") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);