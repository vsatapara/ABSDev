CREATE TABLE abs_mdi."PermissionItems" (
  "SelectiveId" NUMBER(10) NOT NULL,
  "SelectiveTab" VARCHAR2(100 BYTE) NOT NULL,
  "SectionText" VARCHAR2(100 BYTE),
  "SelectionText" VARCHAR2(100 BYTE),
  "DisplayOrder" NUMBER(5),
  "EffectiveDate" TIMESTAMP,
  "IsFeetInchFormat" CHAR,
  CONSTRAINT "PermissionItems_PK" PRIMARY KEY ("SelectiveId")
);