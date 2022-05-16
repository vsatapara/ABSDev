CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_PARTITION_COMMON" (
/*   Created By    Narendra Desai    
     Created Date  25-07-2021
     Description   This stored Procedure used to get data of M_PanelType and M_Panel_Dropdown table for fill drop-down fields
*/
    PanelType_Data         OUT  SYS_REFCURSOR,
    Gauge_Exterior_Data    OUT  SYS_REFCURSOR,
    Profile_Exterior_Data  OUT  SYS_REFCURSOR,
    Texture_Exterior_Data  OUT  SYS_REFCURSOR,
    Gauge_Interior_Data    OUT  SYS_REFCURSOR,
    Profile_Interior_Data  OUT  SYS_REFCURSOR,
    Texture_Interior_Data  OUT  SYS_REFCURSOR,
    Width_Data             OUT  SYS_REFCURSOR,
    Thickness_Data         OUT  SYS_REFCURSOR,    
    FastenerHead_Data      OUT  SYS_REFCURSOR,
    FastenerLength_Data    OUT  SYS_REFCURSOR,
    FactoryApplied_Data    OUT  SYS_REFCURSOR,
    PartitionMaster_Data   OUT  SYS_REFCURSOR
) as
BEGIN
    OPEN PanelType_Data FOR SELECT
                                    "Id",
                                    "Type"        "Value",
                                    "PanelImage"  "Image",
                                    "IsDisable_ReverseRolled"
                                FROM
                                    "M_PanelType"
                                WHERE
                                    "IsWall" = 1
                               -- ORDER BY "Id";
                            union all
                            SELECT
                                    "Id",
                                    "Type"        "Value",
                                    "PanelImage"  "Image",
                                    "IsDisable_ReverseRolled"
                                FROM
                                    "M_PanelType"
                                WHERE
                                    "Type" = 'By Others';
    OPEN Gauge_Exterior_Data FOR SELECT
                                    "Id",
                                    "Value",
                                    "PanelTypeId",
                                    "MappingId",
                                    "IsDefaultSelected"
                                FROM
                                    "M_Panel_Dropdown"
                                WHERE
                                        "Gauge" = 1
                                    AND "IsExterior" = 1
                                ORDER BY "Value" desc;
    OPEN Profile_Exterior_Data FOR SELECT
                                      "Id",
                                      "Value",
                                      "PanelTypeId",
                                      "MappingId",
                                      "IsDefaultSelected"
                                  FROM
                                      "M_Panel_Dropdown"
                                  WHERE
                                          "Profile" = 1 and "Value" != 'Flat - No Profile'
                                      AND "IsExterior" = 1;
    OPEN Texture_Exterior_Data FOR SELECT
                                      "Id",
                                      "Value",
                                      "PanelTypeId",
                                      "IsDefaultSelected"
                                  FROM
                                      "M_Panel_Dropdown"
                                  WHERE
                                          "Texture" = 1
                                      AND "IsExterior" = 1;
    OPEN Gauge_Interior_Data FOR SELECT
                                    "Id",
                                    "Value",
                                    "PanelTypeId",
                                    "IsDefaultSelected"
                                FROM
                                    "M_Panel_Dropdown"
                                WHERE
                                        "Gauge" = 1
                                    AND "IsInterior" = 1
                                ORDER BY "Value" desc;
    OPEN Profile_Interior_Data FOR SELECT
                                      "Id",
                                      "Value",
                                      "PanelTypeId",
                                    "IsDefaultSelected"
                                  FROM
                                      "M_Panel_Dropdown"
                                  WHERE
                                          "Profile" = 1
                                      AND "IsInterior" = 1;
    OPEN Texture_Interior_Data FOR SELECT
                                      "Id",
                                      "Value",
                                      "PanelTypeId",
                                    "IsDefaultSelected"
                                  FROM
                                      "M_Panel_Dropdown"
                                  WHERE
                                          "Texture" = 1
                                      AND "IsInterior" = 1;
    OPEN Width_Data FOR SELECT
                           "Id",
                           "Value",
                           "PanelTypeId",
                                    "IsDefaultSelected"
                       FROM
                           "M_Panel_Dropdown"
                       WHERE
                           "Width" = 1
                       ORDER BY "Value" desc;
    OPEN Thickness_Data FOR SELECT
                               "Id",
                               "Value",
                               "PanelTypeId",
                               "RValue",
                               "UValue",
                               "NotchAlt",
                               "MappingId",
                                    "IsDefaultSelected"
                           FROM
                               "M_Panel_Dropdown"
                           WHERE
                               "Thickness" = 1
                           ORDER BY "Id";
    OPEN FastenerHead_Data FOR SELECT
                                  "Id",
                                  "Value",
                                  "PanelTypeId",
                                    "IsDefaultSelected"
                              FROM
                                  "M_Panel_Dropdown"
                              WHERE
                                  "FastenerHead" = 1;
    OPEN FastenerLength_Data FOR SELECT
                                    "Id",
                                    "Value",
                                    "PanelTypeId",
                                    "IsDefaultSelected"
                                FROM
                                    "M_Panel_Dropdown"
                                WHERE
                                    "FastenerLength" = 1; 
                                    
    OPEN FactoryApplied_Data FOR SELECT
                                    "Id",
                                    "Value",
                                    "PanelTypeId",
                                    "IsDefaultSelected"
                                FROM
                                    "M_Panel_Dropdown"
                                WHERE
                                    "FactoryApplied" = 1;   
                                    
     OPEN PartitionMaster_Data FOR SELECT
                                    "OptionId",
                                    "Category",
                                    "SubCategory",
                                    "CategoryValue",
                                    "DisplayOrder"
                                FROM
                                    "Accesories_PartitionMaster"
                                    ORDER BY "Category","DisplayOrder";  
END Accesories_Partition_COMMON;
/