CREATE TABLE abs_mdi."BuilderAccessFieldMaster" (
  "FieldId" NUMBER(10) NOT NULL,
  "Screen" VARCHAR2(50 BYTE),
  "SectionText" VARCHAR2(100 BYTE),
  "MinValue" NUMBER(10,5),
  "MaxValue" NUMBER(10,5),
  "ProjectBuildingType" NUMBER(2),
  CONSTRAINT "BuilderAccessFieldMaster_PK" PRIMARY KEY ("FieldId")
);