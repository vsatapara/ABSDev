CREATE TABLE abs_mdi."EDSPrice_O_FLJoints" (
  "FLJointsId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "Elevation" VARCHAR2(50 BYTE),
  "FramelineNumber" NUMBER(10),
  "SegmentNumber" NUMBER(10),
  "Type" VARCHAR2(50 BYTE),
  "Status" VARCHAR2(50 BYTE),
  "Position" VARCHAR2(50 BYTE),
  "Rotation" NUMBER(10,2),
  "BackThick" NUMBER(10,2),
  "FrontThick" NUMBER(10,2),
  "BackWidth" NUMBER(10,2),
  "FrontWidth" NUMBER(10,2),
  "BackPlateLength" NUMBER(10,2),
  "FrontPlateLength" NUMBER(10,2),
  "JointConnectionCode" VARCHAR2(50 BYTE),
  "BoltDiameter" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "Pk_EDSPrice_O_FLJoints_ProjectId" PRIMARY KEY ("FLJointsId"),
  CONSTRAINT eds_price_o_fljoints_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);