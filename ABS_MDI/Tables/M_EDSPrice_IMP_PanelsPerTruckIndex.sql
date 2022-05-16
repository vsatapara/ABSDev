CREATE TABLE abs_mdi."M_EDSPrice_IMP_PanelsPerTruckIndex" (
  "PanelType" NVARCHAR2(50) NOT NULL,
  "PanelWidth" NVARCHAR2(50) NOT NULL,
  "Index" NUMBER,
  PRIMARY KEY ("PanelType","PanelWidth")
);