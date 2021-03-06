CREATE TABLE abs_mdi."EDSPrice_O_FLStiffeners" (
  "FLStiffenersId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "Elevation" VARCHAR2(50 BYTE),
  "FramelineNumber" NUMBER(10),
  "Type" VARCHAR2(50 BYTE),
  "Status" VARCHAR2(50 BYTE),
  "Position" VARCHAR2(50 BYTE),
  "Angle" NUMBER(10,2),
  "Thick" NUMBER(10,2),
  "Width" NUMBER(10,2),
  "Length" NUMBER(10,2),
  "Sides" NUMBER(10),
  "Distance" NUMBER(10,2),
  "EndtoTopFlange" NUMBER(10,2),
  "EndtoBottomFlange" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "Pk_EDSPrice_O_FLStiffeners_ProjectId" PRIMARY KEY ("FLStiffenersId"),
  CONSTRAINT eds_price_o_flstiffeners_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);