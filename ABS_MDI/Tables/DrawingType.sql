CREATE TABLE abs_mdi."DrawingType" (
  "DrawingTypeId" NUMBER(5),
  "Name" VARCHAR2(150 BYTE),
  "Purpose" VARCHAR2(50 BYTE),
  "Seal" VARCHAR2(50 BYTE),
  "CreatedDate" DATE,
  "CreatedBy" NUMBER(10),
  "ModifiedDate" DATE,
  "ModifiedBy" NUMBER(10),
  "IsDelete" CHAR DEFAULT 'N',
  "Mailed" VARCHAR2(50 BYTE),
  "BWXMappingID" NUMBER(10),
  "BWXMappingName" VARCHAR2(150 BYTE),
  "BWXMappingExtraID" NUMBER(10),
  "BWXExtraMappingName" VARCHAR2(150 BYTE),
  "BWXDrawingType" VARCHAR2(150 BYTE)
);