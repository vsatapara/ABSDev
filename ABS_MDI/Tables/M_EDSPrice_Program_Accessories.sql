CREATE TABLE abs_mdi."M_EDSPrice_Program_Accessories" (
  "ID" BINARY_DOUBLE NOT NULL,
  "Description" NVARCHAR2(255),
  "Weight" BINARY_DOUBLE,
  "Price" BINARY_DOUBLE,
  "PLPrice" BINARY_DOUBLE DEFAULT 0,
  "SqFtPC" BINARY_DOUBLE,
  "PartNumber" NVARCHAR2(50),
  uom NVARCHAR2(50),
  "Category" NUMBER DEFAULT 0,
  "Notes" NVARCHAR2(100),
  PRIMARY KEY ("ID")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Accessories"."PartNumber" IS 'string50';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Accessories".uom IS 'string50';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Accessories"."Notes" IS 'string100';