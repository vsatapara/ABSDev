CREATE TABLE abs_mdi."EDSPrice_O_FLPlates" (
  "FLPlatesId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "Elevation" VARCHAR2(50 BYTE),
  "FramelineNumber" NUMBER(10),
  "SegmentNumber" NUMBER(10),
  "Type" VARCHAR2(50 BYTE),
  "Thick" NUMBER(10,2),
  "Width" NUMBER(10,2),
  "Depth" NUMBER(10,2),
  "ProjectionInside" NUMBER(10,2),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" VARCHAR2(1 BYTE),
  "ProjectId" NUMBER(10),
  CONSTRAINT "Pk_EDSPrice_O_FLPlates_ProjectId" PRIMARY KEY ("FLPlatesId"),
  CONSTRAINT eds_price_o_flplates_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);