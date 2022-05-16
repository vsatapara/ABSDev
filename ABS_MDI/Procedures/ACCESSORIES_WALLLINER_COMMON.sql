CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_WALLLINER_COMMON" 
(
 PanelType_Data  OUT  SYS_REFCURSOR,
 Gauge_Panel_Data OUT SYS_REFCURSOR,
 Base_Type_Data OUT SYS_REFCURSOR,
 Fastener_Head OUT SYS_REFCURSOR,
 Fastener_length OUT SYS_REFCURSOR
) AS 
BEGIN
 OPEN PanelType_Data FOR SELECT
                                    "Id",
                                    "Type" "Value",     
                                    "IsDisable_ReverseRolled"
                                FROM
                                    "M_PanelType"
                                WHERE
                                    "Type" IN ('PBR', 'PBU', 'AVP', 'Artisan L12')
                                    ORDER BY  "Id";
                                    
OPEN Gauge_Panel_Data FOR SELECT
                                    "Id",
                                    "Value",
                                    "PanelTypeId"
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
                                     "FastenerHead" = 1 AND "PanelTypeId" IN (SELECT "Id" FROM "M_PanelType" WHERE
                                     "Type" IN ('PBR', 'PBU','Artisan L12'));
OPEN Fastener_length FOR SELECT
                                    "Id",
                                    "Value",
                                    "PanelTypeId",
                                    "MappingId",
                                    "IsDefaultSelected"
                                FROM
                                    "M_Panel_Dropdown"
                                WHERE
                                     "FastenerLength" = 1 AND "PanelTypeId" IN (SELECT "Id" FROM "M_PanelType" WHERE
                                     "Type" IN ('PBR', 'PBU','Artisan L12'));   
END ACCESSORIES_WALLLINER_COMMON;
/