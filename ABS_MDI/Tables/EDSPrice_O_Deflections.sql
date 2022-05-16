CREATE TABLE abs_mdi."EDSPrice_O_Deflections" (
  "DeflectionsId" NUMBER DEFAULT abs_mdi."EDSPrice_O_Deflections_SEQ"."NEXTVAL" NOT NULL,
  "BuildingNumber" NUMBER(10),
  "FrameLive" NUMBER(10),
  "FrameSnow" NUMBER(10),
  "FrameWind" NUMBER(10),
  "FrameSeismic" NUMBER(10),
  "FrameTotalWind" NUMBER(10),
  "FrameTotalSeismic" NUMBER(10),
  "FrameTotalGravity" NUMBER(10),
  "FrameCrane" NUMBER(10),
  "FramePortalWind" NUMBER(10),
  "FramePortalSeismic" NUMBER(10),
  "WallColumn" NUMBER(10),
  "GroupNumber" NUMBER(10),
  "FrameSpecNumber" NUMBER(10),
  "Framelines" VARCHAR2(150 BYTE),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "EDSPrice_O_Deflections_PK" PRIMARY KEY ("DeflectionsId"),
  CONSTRAINT eds_price_o_deflections_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);