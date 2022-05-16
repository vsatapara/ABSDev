CREATE TABLE abs_mdi."M_EDSPrice_Program_Panels" (
  "PanelID" NUMBER DEFAULT 0 NOT NULL,
  "Type" NVARCHAR2(50) NOT NULL,
  "Location" NVARCHAR2(50) NOT NULL,
  "Finish" NVARCHAR2(50) NOT NULL,
  "Gauge" NUMBER DEFAULT 0 NOT NULL,
  "Company" NUMBER DEFAULT 0 NOT NULL,
  "PlantCode" NUMBER DEFAULT 0,
  "GroupingID" NUMBER DEFAULT 0,
  "SortOrder" NUMBER DEFAULT 10,
  "ExteriorKSI" NUMBER,
  "InteriorKSI" NUMBER,
  PRIMARY KEY ("PanelID","Type","Location","Finish","Gauge","Company")
);
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Panels"."Company" IS '1 - Star, 2 - Ceco, 3 - Robertson';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Panels"."PlantCode" IS 'Ceco( 1 - CBS, 2 - RKM, 4 - MPL); Star and Robertson ( 1 - MTC, 2 - ELZ, 4 - LKF); NCI - 1; This is a bitmask.';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Panels"."GroupingID" IS '0 - Undefined; 1 - Through Fastened; 2 - Standing Seam; 3 - Concealed Fastener; 4 - Insulated. Default is 0. Primary Purpose is to support "grouping" of panels for GUI lists.';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Panels"."SortOrder" IS 'Value to use for Sorting Panels within a given panel grouping. Default is 1';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Panels"."ExteriorKSI" IS 'Single Skin Panel KSI Value and Exterior Panel KSI for Insulated Panels';
COMMENT ON COLUMN abs_mdi."M_EDSPrice_Program_Panels"."InteriorKSI" IS 'Interior Panel KSI for Insulated Panels not use for Single Sking Panels.';