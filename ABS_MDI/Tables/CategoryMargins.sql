CREATE TABLE abs_mdi."CategoryMargins" (
  "CategoryMarginId" NUMBER(10) NOT NULL,
  "CategoryId" NUMBER(10) NOT NULL,
  "AmountForBuilding" NUMBER(8,2),
  "MultiplierForBuilding" NUMBER(8,2),
  "AmountForComponents" NUMBER(8,2),
  "MultiplierForComponents" NUMBER(8,2),
  "IsBuyout" CHAR,
  "IsPurchased" CHAR,
  "CreatedBy" NUMBER(5),
  "CreatedDate" TIMESTAMP,
  "ModifiedBy" NUMBER(5),
  "ModifiedDate" TIMESTAMP,
  "IsDelete" CHAR,
  "IpAddress" VARCHAR2(20 BYTE),
  "CategoryMetaId" NUMBER(10),
  CONSTRAINT categorymargins_pk PRIMARY KEY ("CategoryMarginId"),
  CONSTRAINT category_fk FOREIGN KEY ("CategoryId") REFERENCES abs_mdi."TableOfTables" ("Id")
);