CREATE TABLE abs_mdi."CLM_DesignCodes_Copy" (
  "DesignCodeID" NUMBER NOT NULL,
  "Active" VARCHAR2(40 BYTE) DEFAULT 1 NOT NULL,
  "Code" NVARCHAR2(50) NOT NULL,
  "Description" NVARCHAR2(80) NOT NULL,
  "Edition" NVARCHAR2(25) NOT NULL,
  "Designation" NVARCHAR2(80) NOT NULL,
  "SortOrder" NUMBER DEFAULT 0 NOT NULL,
  "IsIBC2012Based" VARCHAR2(40 BYTE) DEFAULT 0 NOT NULL,
  "IsCanadaBased" VARCHAR2(40 BYTE) DEFAULT 0 NOT NULL,
  "USGSRefDesignCodeID" NUMBER DEFAULT 0 NOT NULL,
  "MBS_Local" NVARCHAR2(50) DEFAULT '' NOT NULL,
  "MBS_Code" NVARCHAR2(50) DEFAULT '' NOT NULL,
  "MBS_Year" NVARCHAR2(50) DEFAULT '' NOT NULL,
  "MBS_Design_type" NVARCHAR2(50) DEFAULT '' NOT NULL,
  "MBS_FileName" NVARCHAR2(50) DEFAULT '' NOT NULL,
  "MBS_Cold_Version" NVARCHAR2(50) DEFAULT '' NOT NULL,
  "MBS_Hot_Version" NVARCHAR2(50) DEFAULT '' NOT NULL,
  "DeflectionGroupId" NUMBER DEFAULT 0 NOT NULL,
  "PgaSeismicEnabled" VARCHAR2(40 BYTE) DEFAULT 0 NOT NULL,
  PRIMARY KEY ("DesignCodeID")
);
COMMENT ON COLUMN abs_mdi."CLM_DesignCodes_Copy"."DesignCodeID" IS 'The interger value representing the enumerated value provided by the DesignCodeType inthe main application';
COMMENT ON COLUMN abs_mdi."CLM_DesignCodes_Copy"."Code" IS 'Individual enumerated type provided by the DesignCodeType inthe main application';
COMMENT ON COLUMN abs_mdi."CLM_DesignCodes_Copy"."Description" IS 'For presentation and reporting purposes';
COMMENT ON COLUMN abs_mdi."CLM_DesignCodes_Copy"."Edition" IS 'For presentation and reporting purposes';