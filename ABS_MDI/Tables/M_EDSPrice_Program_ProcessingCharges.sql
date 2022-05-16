CREATE TABLE abs_mdi."M_EDSPrice_Program_ProcessingCharges" (
  "ID" NUMBER DEFAULT 0 NOT NULL,
  "Description" NVARCHAR2(50),
  "CustServHrs" BINARY_DOUBLE DEFAULT 0,
  "EngHrs" BINARY_DOUBLE DEFAULT 0,
  "DraftingHrs" BINARY_DOUBLE DEFAULT 0,
  PRIMARY KEY ("ID")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_ProcessingCharges"."ID" IS 'Unique ID Field';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_ProcessingCharges"."Description" IS 'Feature';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_ProcessingCharges"."CustServHrs" IS 'Customer Service Hours';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_ProcessingCharges"."EngHrs" IS 'Engineering Hours';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_ProcessingCharges"."DraftingHrs" IS 'Drafting Hours';