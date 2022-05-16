CREATE TABLE abs_mdi."M_EDSPrice_Program_Erection" (
  "Range1" BINARY_DOUBLE DEFAULT 0,
  "Range2" BINARY_DOUBLE DEFAULT 0,
  "Range3" BINARY_DOUBLE DEFAULT 0,
  "Range4" BINARY_DOUBLE DEFAULT 0,
  "Range5" BINARY_DOUBLE DEFAULT 0,
  "Range6" BINARY_DOUBLE DEFAULT 0,
  "Range7" BINARY_DOUBLE DEFAULT 0,
  "Range8" BINARY_DOUBLE DEFAULT 0,
  "ManHours1" BINARY_DOUBLE DEFAULT 0,
  "ManHours2" BINARY_DOUBLE DEFAULT 0,
  "ManHours3" BINARY_DOUBLE DEFAULT 0,
  "ManHours4" BINARY_DOUBLE DEFAULT 0,
  "ManHours5" BINARY_DOUBLE DEFAULT 0,
  "ManHours6" BINARY_DOUBLE DEFAULT 0,
  "ManHours7" BINARY_DOUBLE DEFAULT 0,
  "ManHours8" BINARY_DOUBLE DEFAULT 0,
  "Unit" NVARCHAR2(50),
  "LaborDivision" NUMBER DEFAULT 0,
  "Description" NVARCHAR2(50) NOT NULL,
  PRIMARY KEY ("Description")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."Range1" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."Range2" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."Range3" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."Range4" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."Range5" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."Range6" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."Range7" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."Range8" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."ManHours1" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."ManHours2" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."ManHours3" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."ManHours4" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."ManHours5" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."ManHours6" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."ManHours7" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."ManHours8" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."Unit" IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."LaborDivision" IS '-Integer-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Erection"."Description" IS '-String-';