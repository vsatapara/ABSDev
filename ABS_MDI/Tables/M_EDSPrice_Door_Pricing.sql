CREATE TABLE abs_mdi."M_EDSPrice_Door_Pricing" (
  "ID" BINARY_DOUBLE NOT NULL,
  "Description" NVARCHAR2(255),
  "Weight" BINARY_DOUBLE,
  "Cost" BINARY_DOUBLE,
  "PartNumber" NVARCHAR2(50),
  uom NVARCHAR2(50),
  "Notes" NVARCHAR2(255),
  "AccessoryType" NVARCHAR2(100),
  PRIMARY KEY ("ID")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Door_Pricing"."AccessoryType" IS 'Indicate the type of door or door accessory ("Standard Door", "Masonry Door", "Lock Kit", "Options", etc.';