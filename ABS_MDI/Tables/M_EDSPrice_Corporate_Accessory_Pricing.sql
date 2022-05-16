CREATE TABLE abs_mdi."M_EDSPrice_Corporate_Accessory_Pricing" (
  "PartNumber" NVARCHAR2(50),
  "Finish" NVARCHAR2(25),
  "Gauge" NVARCHAR2(20),
  "Description" NVARCHAR2(255),
  "Weight" BINARY_DOUBLE,
  "Cost" BINARY_DOUBLE,
  uom NVARCHAR2(50),
  "Category" NUMBER DEFAULT 0,
  "Notes" NVARCHAR2(255)
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Corporate_Accessory_Pricing"."Finish" IS 'Finish, series, etc';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Corporate_Accessory_Pricing"."Gauge" IS 'Gauge, size, etc.';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Corporate_Accessory_Pricing".uom IS 'FT, PC, EA, SQS, LB, LF, etc';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Corporate_Accessory_Pricing"."Category" IS 'OE Category Number: 51=Panels, 7=Hardware, etc.';