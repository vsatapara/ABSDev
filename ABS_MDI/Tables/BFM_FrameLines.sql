CREATE TABLE abs_mdi."BFM_FrameLines" (
  "FrameLineId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "GroupNumber" NUMBER(10),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" CHAR,
  "ProjectId" NUMBER,
  "FrameLineNumber" NUMBER(10),
  "DesignGroupNumber" NUMBER(10),
  CONSTRAINT "BFM_FrameLines_PK" PRIMARY KEY ("FrameLineId"),
  CONSTRAINT bn_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);
COMMENT ON COLUMN abs_mdi."BFM_FrameLines"."BuildingNumber" IS 'BuildingNumberId';
COMMENT ON COLUMN abs_mdi."BFM_FrameLines"."GroupNumber" IS 'GroupNumberId';
COMMENT ON COLUMN abs_mdi."BFM_FrameLines"."FrameLineNumber" IS 'FrameLineId';