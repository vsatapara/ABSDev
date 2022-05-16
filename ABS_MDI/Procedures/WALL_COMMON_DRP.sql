CREATE OR REPLACE PROCEDURE abs_mdi."WALL_COMMON_DRP" (
    ProjectId              IN   NUMBER,
    PanelType_Data         OUT  SYS_REFCURSOR,
    Gauge_Exterior_Data    OUT  SYS_REFCURSOR,
    Profile_Exterior_Data  OUT  SYS_REFCURSOR,
    Texture_Exterior_Data  OUT  SYS_REFCURSOR,
    Gauge_Interior_Data    OUT  SYS_REFCURSOR,
    Profile_Interior_Data  OUT  SYS_REFCURSOR,
    Texture_Interior_Data  OUT  SYS_REFCURSOR,
    Width_Data             OUT  SYS_REFCURSOR,
    Thickness_Data         OUT  SYS_REFCURSOR,
    FastenerType_Data      OUT  SYS_REFCURSOR,
    FastenerHead_Data      OUT  SYS_REFCURSOR,
    FastenerLength_Data    OUT  SYS_REFCURSOR,
    Framing_Data           OUT  SYS_REFCURSOR,
    Trim_Data              OUT  SYS_REFCURSOR,
    Closure_Data           OUT  SYS_REFCURSOR,
    FactoryApplied_Data    OUT  SYS_REFCURSOR
) IS
    IsClimateControlled        CHAR(1);
    IsAirInfiltrationRequired  CHAR(1);
BEGIN
    SELECT
        "IsClimateControlled",
        "IsAirInfiltrationRequired"
    INTO
        IsClimateControlled,
        IsAirInfiltrationRequired
    FROM
        "Project"
    WHERE
            "ProjectId" = ProjectId
        AND "IsDelete" != 'Y';
    IF IsAirInfiltrationRequired != 'Y'
    THEN
        OPEN PanelType_Data FOR SELECT
                                    "Id",
                                    "Type"        "Value",
                                    "PanelImage"  "Image",
                                    "ExteriorColor",
                                    "ExteriorColorText",
                                    "ExteriorColorCode",
                                    "ExteriorHashColorCode",
                                    "InteriorColor",
                                    "InteriorColorText",
                                    "InteriorColorCode",
                                    "InteriorHashColorCode",
                                    "NotchAlt",
                                    "IsDisable_Warranty",
                                    "IsHide_ColdStorageBuilding",
                                    "IsDisable_ReverseRolled",
                                    "IsDisable_SealedWall",
                                    "IsDisable_EaveClosureStrip",
                                    CASE WHEN "Type"='ShadowRib' THEN 'Y' ELSE '' END "IsCheck_EaveClosureStrip",
                                    "IsHide_RakeClosure",
                                    CASE WHEN "Type"='ShadowRib' THEN 'Y' ELSE '' END "IsDisable_RakeClosure",
                                    "IsCheck_RakeClosure",
                                    "IsHide_FoamTape",
                                    '' "IsCheck_SealedWall",
                                    "IsDisable_Notch",
                                    "IsCheck_Notch",
                                    "IsDisable_Std",
                                    "IsCheck_Std",
                                    "IsHide_Alt",
                                    "IsDisable_Alt",
                                    "IsDisable_OutsideMetalClosure",
                                    "IsHide_SidelapSealant",
                                    "IsCheck_SidelapSealant",
                                    "IsHideRUValue"
                                FROM
                                    "M_PanelType"
                                WHERE
                                    "IsWall" != 0
                                ORDER BY
                                    "Id";
    ELSE
        OPEN PanelType_Data FOR SELECT
                                    "Id",
                                    "Type"        "Value",
                                    "PanelImage"  "Image",
                                    "ExteriorColor",
                                    "ExteriorColorText",
                                    "ExteriorColorCode",
                                    "ExteriorHashColorCode",
                                    "InteriorColor",
                                    "InteriorColorText",
                                    "InteriorColorCode",
                                    "InteriorHashColorCode",
                                    "NotchAlt",
                                    "IsDisable_Warranty",
                                    "IsHide_ColdStorageBuilding",
                                    "IsDisable_ReverseRolled",
                                    'Y' "IsDisable_SealedWall",
                                    'Y' "IsDisable_EaveClosureStrip",
                                    case "Type" when 'PBR' then ''
                                                when 'AVP' then '' 
                                                when 'PBU' then ''
                                                else "IsCheck_EaveClosureStrip" 
                                    end as "IsCheck_EaveClosureStrip",
                                    "IsHide_RakeClosure",
                                    "IsDisable_RakeClosure",
                                    "IsCheck_RakeClosure",
                                    "IsHide_FoamTape",
                                    case "Type" when 'PBR' then ''
                                                when 'AVP' then '' 
                                                when 'PBU' then ''
                                                else "IsCheck_SealedWall" 
                                    end as "IsCheck_SealedWall",
                                    "IsDisable_Notch",
                                    "IsCheck_Notch",
                                    '' "IsDisable_Std",
                                    "IsCheck_Std",
                                    '' "IsHide_Alt",
                                    "IsDisable_Alt",
                                    'Y' "IsDisable_OutsideMetalClosure",
                                    "IsHide_SidelapSealant",
                                    "IsCheck_SidelapSealant",
                                    "IsHideRUValue"
                                FROM
                                    "M_PanelType"
                                WHERE
                                    "IsWall" = 1
                                ORDER BY
                                    "Id";
    END IF;
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
                                          "Profile" = 1
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
    OPEN FastenerType_Data FOR SELECT
                                  "Id",
                                  "Value",
                                  "PanelTypeId",
                                    "IsDefaultSelected"
                              FROM
                                  "M_Panel_Dropdown"
                              WHERE
                                  "FastenerType" = 1;
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
    /*OPEN Framing_Data FOR SELECT
                             "Id",
                             "Value",
                             "PanelTypeId",
                             "TrimImage" "Image",
                                    "IsDefaultSelected"
                         FROM
                             "M_Panel_Dropdown"
                         WHERE
                             "Framing" = 1
                        ORDER BY "Id";*/
       OPEN Framing_Data FOR                  
                        SELECT
                             "Id",
                             "Value",
                             "PanelTypeId",
                             "TrimImage" "Image",
                             "IsDefaultSelected"
                             FROM
                                 "M_Panel_Dropdown"
                             WHERE
                                 "Framing" = 1 and "Value" != 'None'
                        union all
                        SELECT
                             "Id",
                             "Value",
                             "PanelTypeId",
                             "TrimImage" "Image",
                             "IsDefaultSelected"
                         FROM
                             "M_Panel_Dropdown"
                         WHERE
                             "Framing" = 1 and "Value" = 'None';                
    OPEN Trim_Data FOR SELECT
                          "Id",
                          "Value",
                          "PanelTypeId",
                          "TrimImage" "Image",
                                    "IsDefaultSelected"
                      FROM
                          "M_Panel_Dropdown"
                      WHERE
                          "Trim" = 1;
 IF IsAirInfiltrationRequired != 'Y'
THEN
    OPEN Closure_Data FOR SELECT
                             "Id",
                             "Value",
                             "PanelTypeId",
                             "IsDefaultSelected"
                         FROM
                             "M_Panel_Dropdown"
                         WHERE
                             "Closure" = 1;
ELSE
    OPEN Closure_Data FOR SELECT
                             "Id",
                             "Value",
                             "PanelTypeId",
                             "IsDefaultSelected"
                         FROM
                             "M_Panel_Dropdown"
                         WHERE
                             "Closure" = 1 and "GroupId"=1;
END IF;
    OPEN FactoryApplied_Data FOR SELECT
                                    "Id",
                                    "Value",
                                    "PanelTypeId",
                                    "IsDefaultSelected"
                                FROM
                                    "M_Panel_Dropdown"
                                WHERE
                                    "FactoryApplied" = 1;
END WALL_COMMON_DRP;
/