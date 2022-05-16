CREATE TABLE abs_mdi."M_EDSPrice_IMPSetupCharges" (
  "PanelType" NVARCHAR2(50) NOT NULL,
  "PanelWidth" BINARY_DOUBLE NOT NULL,
  "Upto1000" BINARY_DOUBLE,
  "Upto2500" BINARY_DOUBLE,
  "Upto5000" BINARY_DOUBLE,
  PRIMARY KEY ("PanelType","PanelWidth")
);