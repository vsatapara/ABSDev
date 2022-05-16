CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_FACADE_COMMON_DRP" (
    Back_Type_Data          OUT  SYS_REFCURSOR,
    Facade_Type_Data        OUT  SYS_REFCURSOR,
    Soffit_Type_Data        OUT  SYS_REFCURSOR,
    Gauge_Data              OUT  SYS_REFCURSOR,
    FacadeType_Data         OUT  SYS_REFCURSOR
) IS
BEGIN
    OPEN Back_Type_Data FOR SELECT
                            "Id",
                            "Type"        "Value",
                            "IsDisable_ReverseRolled"
                        FROM
                            "M_PanelType"
                        WHERE
                            "BackPanel" =1
                        ORDER BY
                            "Id";
    OPEN Facade_Type_Data FOR SELECT
                        "Id",
                        "Type"        "Value",
                        "IsDisable_ReverseRolled"
                    FROM
                        "M_PanelType"
                    WHERE
                        "FacadePanel" =1
                    ORDER BY
                        "Id";
    OPEN Soffit_Type_Data FOR SELECT
                        "Id",
                        "Type"        "Value",
                        "IsDisable_ReverseRolled"
                    FROM
                        "M_PanelType"
                    WHERE
                        "SoffitPanel" =1
                    ORDER BY
                        "Id";
    OPEN Gauge_Data FOR SELECT
                                    "Id",
                                    "Value",
                                    "PanelTypeId",
                                    "IsDefaultSelected"
                                FROM
                                    "M_Panel_Dropdown"
                                WHERE
                                        "Gauge" = 1
                                    AND "IsExterior" = 1 AND "GroupId" = 1
                                ORDER BY "Value" desc;
    OPEN FacadeType_Data FOR SELECT
                            "Id",           
                            "TypeName"        "Value",
                            "IsDisable_BackPanel"
                        FROM
                            "M_Facade_Type"
                        ORDER BY
                            "Id";
END ACCESSORIES_FACADE_COMMON_DRP;
/