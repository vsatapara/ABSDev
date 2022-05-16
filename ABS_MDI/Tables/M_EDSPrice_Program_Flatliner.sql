CREATE TABLE abs_mdi."M_EDSPrice_Program_Flatliner" (
  "FlatLiner_Gauge" NUMBER NOT NULL,
  "GaLZCFlatLinerPrice" BINARY_DOUBLE DEFAULT 0,
  "GaFlatLinerWeight" BINARY_DOUBLE DEFAULT 0,
  "GaG90FlatLinerPrice" BINARY_DOUBLE DEFAULT 0,
  "GaG90FlatLinerWeight" BINARY_DOUBLE DEFAULT 0,
  "GaLinerWhiteFlatLinerPrice" BINARY_DOUBLE DEFAULT 0,
  "GaLinerWhiteFlatLinerWeight" BINARY_DOUBLE DEFAULT 0,
  "GaBoneWhiteFlatLinerPrice" BINARY_DOUBLE DEFAULT 0,
  "GaBoneWhiteFlatLinerWeight" BINARY_DOUBLE DEFAULT 0,
  PRIMARY KEY ("FlatLiner_Gauge")
);