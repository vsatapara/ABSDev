CREATE TABLE abs_mdi."M_EDSPrice_Program_IPS_Plants" (
  "Panel" NVARCHAR2(50),
  "Thickness" BINARY_DOUBLE,
  "HamiltonON" NUMBER,
  "RichmondVA" NUMBER,
  "JacksonMS" NUMBER,
  "LasVegasNV" NUMBER,
  "IndianapolisIN" NUMBER,
  "LewisvilleTX" NUMBER
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_IPS_Plants"."HamiltonON" IS 'Bool';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_IPS_Plants"."RichmondVA" IS 'Bool';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_IPS_Plants"."JacksonMS" IS 'Bool';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_IPS_Plants"."LasVegasNV" IS 'Bool';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_IPS_Plants"."IndianapolisIN" IS 'Bool';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_IPS_Plants"."LewisvilleTX" IS 'Bool';