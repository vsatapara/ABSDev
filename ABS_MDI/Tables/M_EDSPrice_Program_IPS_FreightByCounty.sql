CREATE TABLE abs_mdi."M_EDSPrice_Program_IPS_FreightByCounty" (
  "State" NVARCHAR2(50) NOT NULL,
  "County" NVARCHAR2(50) NOT NULL,
  "MilesToHamON" BINARY_DOUBLE,
  "MilesToRichVA" BINARY_DOUBLE,
  "MilesToJackMS" BINARY_DOUBLE,
  "MilesToLasVNV" BINARY_DOUBLE,
  "MilesToIndiIN" BINARY_DOUBLE,
  "MilesToLewTX" BINARY_DOUBLE,
  "MilesToLaredoTX" BINARY_DOUBLE,
  PRIMARY KEY ("State","County")
);