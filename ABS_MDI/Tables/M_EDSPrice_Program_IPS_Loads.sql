CREATE TABLE abs_mdi."M_EDSPrice_Program_IPS_Loads" (
  "PanelType" NVARCHAR2(50) NOT NULL,
  "Thickness" BINARY_DOUBLE DEFAULT 0 NOT NULL,
  "NumberSQPerLoad" BINARY_DOUBLE DEFAULT 0,
  "RValue" BINARY_DOUBLE DEFAULT 0,
  "0-9999" BINARY_DOUBLE,
  "10000-19999" BINARY_DOUBLE,
  "20000-29999" BINARY_DOUBLE,
  "30000-39999" BINARY_DOUBLE,
  "40000-49999" BINARY_DOUBLE,
  "over 50000" BINARY_DOUBLE,
  "UValue" BINARY_DOUBLE DEFAULT 0,
  PRIMARY KEY ("PanelType","Thickness")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_IPS_Loads"."RValue" IS 'double';