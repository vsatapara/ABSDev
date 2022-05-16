CREATE TABLE abs_mdi."UnitOfMeasure" (
  "UnitOfMeasureId" NUMBER NOT NULL,
  "Name" VARCHAR2(20 BYTE),
  "Active" VARCHAR2(5 BYTE),
  "DisplayName" VARCHAR2(20 BYTE),
  "MetaName" VARCHAR2(10 BYTE),
  CONSTRAINT "UnitOfMeasure_PK" PRIMARY KEY ("UnitOfMeasureId")
);