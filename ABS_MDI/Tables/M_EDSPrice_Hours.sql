CREATE TABLE abs_mdi."M_EDSPrice_Hours" (
  "Index" NUMBER DEFAULT 0 NOT NULL,
  "Process" NVARCHAR2(50),
  "Labor" NUMBER DEFAULT 0,
  "Range1" NUMBER DEFAULT 0,
  "Range2" NUMBER DEFAULT 0,
  "Range3" NUMBER DEFAULT 0,
  "Range4" NUMBER DEFAULT 0,
  "Range5" NUMBER DEFAULT 0,
  "Range6" NUMBER DEFAULT 0,
  "Range7" NUMBER DEFAULT 0,
  "Range8" NUMBER DEFAULT 0,
  "Unit" NVARCHAR2(50),
  "Hours1" BINARY_DOUBLE DEFAULT 0,
  "Hours2" BINARY_DOUBLE DEFAULT 0,
  "Hours3" BINARY_DOUBLE DEFAULT 0,
  "Hours4" BINARY_DOUBLE DEFAULT 0,
  "Hours5" BINARY_DOUBLE DEFAULT 0,
  "Hours6" BINARY_DOUBLE DEFAULT 0,
  "Hours7" BINARY_DOUBLE DEFAULT 0,
  "Hours8" BINARY_DOUBLE DEFAULT 0,
  "LinkWith" NUMBER DEFAULT 0,
  PRIMARY KEY ("Index")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Index" IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Process" IS 'String 50';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Labor" IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Range1" IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Range2" IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Range3" IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Range4" IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Range5" IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Range6" IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Range7" IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Range8" IS 'Integer';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Unit" IS 'String 50';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Hours1" IS 'Double';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Hours2" IS 'Double';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Hours3" IS 'Double';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Hours4" IS 'Double';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Hours5" IS 'Double';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Hours6" IS 'Double';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Hours7" IS 'Double';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."Hours8" IS 'Double';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Hours"."LinkWith" IS 'Integer';