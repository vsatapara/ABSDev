CREATE OR REPLACE PROCEDURE abs_mdi."Accessories_Wallliner_Common" (
 PanelType_Data  OUT  SYS_REFCURSOR,
 Gauge_Panel_Data OUT SYS_REFCURSOR,
 Base_Type_Data OUT SYS_REFCURSOR,
 Fastener_Head OUT SYS_REFCURSOR,
 Fastener_length OUT SYS_REFCURSOR
) AS 
BEGIN
 OPEN PanelType_Data FOR SELECT
                                    "Id",
                                    "Type" "Value"                                                            
                                FROM
                                    "M_PanelType"
                                WHERE
                                    "Type" IN ('PBR', 'PBU', 'AVP', 'Artisan L12');
                                    
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
                           
OPEN Base_Type_Data FOR SELECT
                                    "Id",
                                    "Value",
                                    "PanelTypeId",
                                    "MappingId",
                                    "IsDefaultSelected"
                                FROM
                                    "M_Panel_Dropdown"
                                WHERE
                                     "Framing" = 1 AND "Value" != 'F73 Formed Base Trim' AND "Value" != 'Tube';
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
END "Accessories_Wallliner_Common";
/