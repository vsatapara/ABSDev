CREATE TABLE abs_mdi."EDSPrice_CAD_Advanced" (
  "AdvancedId" NUMBER(10) NOT NULL,
  "ProjectId" NUMBER(10),
  "BuildingNumber" NUMBER(10),
  "DrawingName" VARCHAR2(255 BYTE),
  "DrawingType" NUMBER(10),
  "DrawingViewportScale" NUMBER(10,2),
  "XLocationInModelSpace" NUMBER(10,2),
  "YLocationInModelSpace" NUMBER(10,2),
  "ZLocationInModelSpace" NUMBER(10,2),
  "FramelineXSection" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  CONSTRAINT "EDSPrice_CAD_Advanced_PK" PRIMARY KEY ("AdvancedId")
);