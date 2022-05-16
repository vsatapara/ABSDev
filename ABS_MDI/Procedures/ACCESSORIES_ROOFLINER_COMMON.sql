CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_ROOFLINER_COMMON" 
(
 Linear_Coverage_Data OUT SYS_REFCURSOR,
 PanelType_Data  OUT  SYS_REFCURSOR,
 Gauge_Panel_Data OUT SYS_REFCURSOR,
 Linear_Gauge_Data OUT SYS_REFCURSOR,
 Fastener_Head OUT SYS_REFCURSOR,
 Fastener_length OUT SYS_REFCURSOR
) AS 
BEGIN
OPEN Linear_Coverage_Data FOR SELECT
                                    "Id",
                                    "Category",
                                    "ItemId",
                                    "ItemText"
                                FROM
                                    "TableOfTables"
                                WHERE
                                        "Category" = 'CoverageType';
 OPEN PanelType_Data FOR SELECT
                                    "Id",
                                    "Type" "Value",
                                    "IsDisable_ReverseRolled"
                                FROM
                                    "M_PanelType"
                                WHERE
                                    "Type" IN ('PBR', 'PBU', 'Artisan L12')
                                    ORDER BY  "Id";
                                    
OPEN Gauge_Panel_Data FOR SELECT
                                    "Id",
                                    "Value",
                                    "PanelTypeId",
                                    "MappingId",
                                    "IsDefaultSelected"
                                FROM
                                    "M_Panel_Dropdown"
                                WHERE
                                        "LinerGuage" = 1;
OPEN Linear_Gauge_Data FOR SELECT
                                    "Id",
                                    "Category",
                                    "ItemId",
                                    "ItemText"
                                FROM
                                    "TableOfTables"
                                WHERE
                                        "Category" = 'RoofLinearGauge';
 OPEN Fastener_Head FOR SELECT
                                    "Id",
                                    "Value",
                                    "PanelTypeId",
                                    "MappingId",
                                    "IsDefaultSelected"
                                FROM
                                    "M_Panel_Dropdown"
                                WHERE
                                     "FastenerHead" = 1;
OPEN Fastener_length FOR SELECT
                                    "Id",
                                    "Value",
                                    "PanelTypeId",
                                    "MappingId",
                                    "IsDefaultSelected"
                                FROM
                                    "M_Panel_Dropdown"
                                WHERE
                                     "FastenerLength" = 1;  
END ACCESSORIES_ROOFLINER_COMMON;
/