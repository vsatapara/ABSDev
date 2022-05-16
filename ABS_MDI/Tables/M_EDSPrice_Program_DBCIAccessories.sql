CREATE TABLE abs_mdi."M_EDSPrice_Program_DBCIAccessories" (
  "ID" NUMBER NOT NULL,
  "Description" NVARCHAR2(255),
  "Weight" BINARY_DOUBLE,
  "Cost" BINARY_DOUBLE,
  "PartNumber" NVARCHAR2(50),
  uom NVARCHAR2(50),
  PRIMARY KEY ("ID")
);