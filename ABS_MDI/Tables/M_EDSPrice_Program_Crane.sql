CREATE TABLE abs_mdi."M_EDSPrice_Program_Crane" (
  "Type" NVARCHAR2(50) NOT NULL,
  "Tons" BINARY_DOUBLE DEFAULT 0 NOT NULL,
  "Span" BINARY_DOUBLE DEFAULT 0 NOT NULL,
  "WheelBase" BINARY_DOUBLE DEFAULT 0,
  "BridgeWeight" BINARY_DOUBLE DEFAULT 0,
  "TrolleyWeight" BINARY_DOUBLE DEFAULT 0,
  "RailSize" BINARY_DOUBLE DEFAULT 0,
  "Girder" NVARCHAR2(50) NOT NULL,
  PRIMARY KEY ("Type","Tons","Span","Girder")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Crane"."Type" IS '-String-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Crane"."Tons" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Crane"."Span" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Crane"."WheelBase" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Crane"."BridgeWeight" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Crane"."TrolleyWeight" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Crane"."RailSize" IS '-Double-';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Crane"."Girder" IS '-String-';