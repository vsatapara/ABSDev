CREATE TABLE abs_mdi."CLM_SiteClasses" (
  "SiteClassId" NUMBER(10) GENERATED AS IDENTITY,
  "SortOrder" NUMBER(*,0) NOT NULL,
  "IsActive" CHAR NOT NULL,
  "IsDefault" CHAR NOT NULL,
  "ToTId" NUMBER(10) NOT NULL,
  "Name" VARCHAR2(128 BYTE),
  CONSTRAINT "CLM_SiteClasses_PK" PRIMARY KEY ("SiteClassId")
);
COMMENT ON COLUMN abs_mdi."CLM_SiteClasses"."ToTId" IS 'Reference of TableOfTables';