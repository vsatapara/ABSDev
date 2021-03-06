CREATE TABLE abs_mdi."M_EDSPrice_Program_MBCI_Markup" (
  "PanelType" NVARCHAR2(50) NOT NULL,
  "Plant" NVARCHAR2(50) NOT NULL,
  "Markup1" BINARY_DOUBLE DEFAULT 0,
  "Markup2" BINARY_DOUBLE DEFAULT 0,
  "Markup3" BINARY_DOUBLE DEFAULT 0,
  "Markup4" BINARY_DOUBLE DEFAULT 0,
  "Markup5" BINARY_DOUBLE DEFAULT 0,
  "Markup6" BINARY_DOUBLE DEFAULT 0,
  "Markup7" BINARY_DOUBLE DEFAULT 0,
  "Markup8" BINARY_DOUBLE DEFAULT 0,
  "Markup9" BINARY_DOUBLE DEFAULT 0,
  "Markup10" BINARY_DOUBLE DEFAULT 0,
  "Range1" BINARY_DOUBLE DEFAULT 0,
  "Range2" BINARY_DOUBLE DEFAULT 0,
  "Range3" BINARY_DOUBLE DEFAULT 0,
  "Range4" BINARY_DOUBLE DEFAULT 0,
  "Range5" BINARY_DOUBLE DEFAULT 0,
  "Range6" BINARY_DOUBLE DEFAULT 0,
  "Range7" BINARY_DOUBLE DEFAULT 0,
  "Range8" BINARY_DOUBLE DEFAULT 0,
  "Range9" BINARY_DOUBLE DEFAULT 0,
  "Range10" BINARY_DOUBLE DEFAULT 0,
  PRIMARY KEY ("PanelType","Plant")
);