CREATE TABLE abs_mdi."BFM_Columns" (
  "ColumnId" NUMBER(10) NOT NULL,
  "BuildingNumber" NUMBER(10),
  "GroupNumber" NUMBER(10),
  "IntColType" VARCHAR2(20 BYTE),
  "IntColRecess" NUMBER(14,4),
  "IntColHeaderType" VARCHAR2(20 BYTE),
  "IntColMaxWebDepth" NUMBER(14,4),
  "CreatedBy" NUMBER(10),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(10),
  "ModifiedDate" TIMESTAMP,
  "IpAddress" VARCHAR2(20 BYTE),
  "IsDeleted" CHAR,
  "ProjectId" NUMBER,
  "IntColBaseType" VARCHAR2(20 BYTE),
  "ColumnNumber" NUMBER(10),
  "BracedBays" VARCHAR2(20 BYTE),
  CONSTRAINT "BFM_Columns_PK" PRIMARY KEY ("ColumnId"),
  CONSTRAINT buildingno_fk FOREIGN KEY ("BuildingNumber") REFERENCES abs_mdi."BuildingInformation" ("BuildingInformationId")
);
COMMENT ON COLUMN abs_mdi."BFM_Columns"."BuildingNumber" IS 'BuildingNumberId';
COMMENT ON COLUMN abs_mdi."BFM_Columns"."GroupNumber" IS 'GroupNumberId';
COMMENT ON COLUMN abs_mdi."BFM_Columns"."IntColType" IS 'InteriorColumnName';
COMMENT ON COLUMN abs_mdi."BFM_Columns"."IntColRecess" IS 'InteriorColumnRecess';
COMMENT ON COLUMN abs_mdi."BFM_Columns"."IntColHeaderType" IS 'Interior Column Top';
COMMENT ON COLUMN abs_mdi."BFM_Columns"."IntColMaxWebDepth" IS 'InteriorColumnMaxWebDepth';
COMMENT ON COLUMN abs_mdi."BFM_Columns"."IntColBaseType" IS 'Interior Column Base';
COMMENT ON COLUMN abs_mdi."BFM_Columns"."ColumnNumber" IS 'ColumnNumberId';