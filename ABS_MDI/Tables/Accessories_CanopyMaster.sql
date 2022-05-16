CREATE TABLE abs_mdi."Accessories_CanopyMaster" (
  "AccessoriesCanopyId" NUMBER(10) NOT NULL,
  "Category" VARCHAR2(50 BYTE),
  "SubCategory" VARCHAR2(100 BYTE),
  "CategoryValue" VARCHAR2(100 BYTE),
  "Order" NUMBER(3),
  "EffectiveDate" TIMESTAMP,
  CONSTRAINT accessoriescanopymaster_pk PRIMARY KEY ("AccessoriesCanopyId")
);