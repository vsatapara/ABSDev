CREATE TABLE abs_mdi."CLM_SnowExposures" (
  "SnowExposureId" NUMBER(10) GENERATED AS IDENTITY,
  "SortOrder" NUMBER(*,0) NOT NULL,
  "IsActive" CHAR NOT NULL,
  "IsDefault" CHAR NOT NULL,
  "ToTId" NUMBER(10) NOT NULL,
  "IsCanadian" CHAR NOT NULL,
  "Name" VARCHAR2(128 BYTE),
  CONSTRAINT "CLM_SnowExposures_PK" PRIMARY KEY ("SnowExposureId")
);
COMMENT ON COLUMN abs_mdi."CLM_SnowExposures"."ToTId" IS 'Reference of TableOfTables';