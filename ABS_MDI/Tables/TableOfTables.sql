CREATE TABLE abs_mdi."TableOfTables" (
  "Id" NUMBER(10) NOT NULL,
  "Category" VARCHAR2(50 BYTE),
  "ItemId" VARCHAR2(100 BYTE),
  "ItemText" CLOB,
  "DisplayOrder" NUMBER(3),
  "IsActive" CHAR,
  "EffectiveDate" TIMESTAMP,
  CONSTRAINT "TableOfTables_PK" PRIMARY KEY ("Id")
);