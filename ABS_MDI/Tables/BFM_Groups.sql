CREATE TABLE abs_mdi."BFM_Groups" (
  "GroupId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "ColType1" VARCHAR2(20 BYTE),
  "ColType2" VARCHAR2(20 BYTE),
  "WebDepth1" NUMBER(14,4),
  "WebDepth2" NUMBER(14,4),
  "RafterDepth1" NUMBER(14,4),
  "RafterDepth2" NUMBER(14,4),
  "Clearspan" CHAR,
  "IsElevation1" CHAR,
  "IsElevation2" CHAR,
  "Elevation1" NUMBER(14,4),
  "Elevation2" NUMBER(14,4),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" CHAR,
  "ProjectId" NUMBER,
  "GroupNumber" NUMBER,
  "HighStrengthWashers" CHAR,
  "ExtColRecession1" NUMBER(14,4),
  "ExtColRecession2" NUMBER(14,4),
  "IsAdvanceColumn" CHAR,
  "IntColMaxWebDepth" NUMBER(14,4),
  "IntColType" VARCHAR2(50 BYTE),
  "IntColRecession" NUMBER(14,4),
  "IntColBaseType" VARCHAR2(50 BYTE),
  "IntColHeaderType" VARCHAR2(50 BYTE),
  "GroutThickness" NUMBER(14,4),
  "ShimsByCeco" NUMBER,
  "PlatedBolts" NUMBER,
  "FrameWeldingInspection" NUMBER,
  "Unsupported1" NUMBER DEFAULT 0,
  "Unsupported2" NUMBER DEFAULT 0,
  "UnsupportedElevation1" NUMBER DEFAULT 0,
  "UnsupportedElevation2" NUMBER DEFAULT 0,
  CONSTRAINT "BFM_Groups_PK" PRIMARY KEY ("GroupId"),
  CONSTRAINT buildingnumber_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);
COMMENT ON COLUMN abs_mdi."BFM_Groups"."BuildingNumber" IS 'BuildingNumberId';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."ColType1" IS 'SWA Column Type';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."ColType2" IS 'SWC Column Type';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."WebDepth1" IS 'SWA Max Column Web Depth';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."WebDepth2" IS 'SWC Max Column Web Depth';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."RafterDepth1" IS 'SWA Max Rafter Web Depth';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."RafterDepth2" IS 'SWC Max Rafter Web Depth';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."Clearspan" IS 'Textbox of Module spacing(Button)';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."IsElevation1" IS 'SWA Unbraced to Elevation Boolean';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."IsElevation2" IS 'SWC Unbraced to Elevation Boolean';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."Elevation1" IS 'SWA Elevation Value';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."Elevation2" IS 'SWC Elevation Value';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."GroupNumber" IS 'GroupNumberId';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."HighStrengthWashers" IS 'Hardened Washer for High Strength Bolts';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."ExtColRecession1" IS 'SWA Exterior Column Recess';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."ExtColRecession2" IS 'SWC Exterior Column Recess';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."IsAdvanceColumn" IS 'Flag for Advance Column Setting';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."IntColType" IS 'Interior Columns type (Pipe, Hot Rolled, etc)';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."IntColRecession" IS 'Interior Column Recessions (inches)';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."IntColBaseType" IS 'Interior Column Base (Pinned, Fixed)
';
COMMENT ON COLUMN abs_mdi."BFM_Groups"."IntColHeaderType" IS 'Interior Column Top (Pinned, Fixed)';