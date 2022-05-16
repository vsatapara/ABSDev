CREATE TABLE abs_mdi."Accessories_Vents" (
  "VentsId" NUMBER(10) NOT NULL,
  "BuildingId" NUMBER(20),
  "ProjectId" NUMBER(10),
  "Quantity" NUMBER(10),
  "RoofVent" VARCHAR2(20 BYTE),
  "Elevation" VARCHAR2(20 BYTE),
  "BayNumber" NUMBER(10),
  "Color" VARCHAR2(20 BYTE),
  "Size" VARCHAR2(20 BYTE),
  "Operator" VARCHAR2(20 BYTE),
  "OperatorWithCable" VARCHAR2(20 BYTE),
  "Surface" VARCHAR2(20 BYTE),
  "ExtensionPackage" CHAR,
  "TrimCollar" CHAR,
  "DistFromLeftCorner" NUMBER(38),
  "DistFromLeftCol" NUMBER(38),
  "Damper" NUMBER(20),
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDelete" CHAR,
  "DistFromLeftWall" NUMBER(38),
  "RunOfVents" CHAR,
  "Weight" NUMBER(10,2),
  "Price" NUMBER(10,2),
  "IsPriced" CHAR,
  "ErrorCode" NUMBER(10),
  CONSTRAINT "Accessories_Vents_PK" PRIMARY KEY ("VentsId")
);