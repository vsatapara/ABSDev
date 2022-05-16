CREATE TABLE abs_mdi."InsulationAccessoriesMaster_Import" (
  "Id" NUMBER(5),
  "ItemNumber" NUMBER(5),
  "Supplier" VARCHAR2(50 BYTE),
  "Description" VARCHAR2(100 BYTE),
  "Price" NUMBER(20,14),
  "Weight" NUMBER(20,14),
  "CostType" VARCHAR2(255 BYTE),
  "IsCanada" CHAR,
  "IsDelete" CHAR
);