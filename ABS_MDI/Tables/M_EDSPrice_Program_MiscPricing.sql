CREATE TABLE abs_mdi."M_EDSPrice_Program_MiscPricing" (
  "ID" NUMBER DEFAULT 0 NOT NULL,
  "Description" NVARCHAR2(255),
  "Weight" BINARY_DOUBLE DEFAULT 0,
  "Price" BINARY_DOUBLE DEFAULT 0,
  "PartNumber" NVARCHAR2(50),
  uom NVARCHAR2(50),
  "CostType" NVARCHAR2(255),
  "Notes" NVARCHAR2(255),
  PRIMARY KEY ("ID")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_MiscPricing"."ID" IS 'Id # of Miscellaeous pricing : must relate ID to program';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_MiscPricing"."Description" IS 'Description of Pricing';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_MiscPricing"."Weight" IS 'Weight';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_MiscPricing"."PartNumber" IS 'string50';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_MiscPricing".uom IS 'string50';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_MiscPricing"."CostType" IS 'string50';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_MiscPricing"."Notes" IS 'string100';