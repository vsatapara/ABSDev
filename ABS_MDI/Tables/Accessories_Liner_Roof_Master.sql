CREATE TABLE abs_mdi."Accessories_Liner_Roof_Master" (
  "OptionId" NUMBER(10) NOT NULL,
  "Category" VARCHAR2(50 BYTE) NOT NULL,
  "SubCategory" VARCHAR2(100 BYTE),
  "CategoryValue" VARCHAR2(100 BYTE),
  "DisplayOrder" NUMBER(3),
  "EffectiveDate" TIMESTAMP,
  PRIMARY KEY ("OptionId")
);