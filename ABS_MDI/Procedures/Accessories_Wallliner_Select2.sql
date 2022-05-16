CREATE OR REPLACE PROCEDURE abs_mdi."Accessories_Wallliner_Select" (
    WallLinerId    IN   NUMBER,
    WallLinear_Data    OUT  SYS_REFCURSOR
    ) AS 
BEGIN
 OPEN WallLinear_Data FOR SELECT
                                "WallLinerId",
                                "BuildingNumber",
                                "ProjectId",
                                "Length",
                                "Height",
                                "FullLength",
                                "FullHeight",
                                "PanelType",
                                "PanelGauge",
                                "ReverseRoll",
                                "PanelColor",
                                "PanelColorValsparCode",
                                "PanelColorSpecialName",
                                "BaseType",
                                "CapTrimColor",
                                "CapTrimColorValsparCode",
                                "CapTrimColorSpecialName",
                                "PurlinTrimColor",
                                "PurlinTrimColorValsparCode",
                                "PurlinTrimColorSpecialName",
                                "InsideCornerTrimColor",
                                "InsideCornerTrimColorValsparCode",
                                "InsideCornerTrimColorSpecialName",
                                "ColumnTieTrimColor",
                                "ColumnTieTrimColorValsparCode",
                                "ColumnTieTrimColorSpecialName",
                                "FastenerHeadFinish",
                                "FastenerLength",
                                "CreatedBy",
                                "CreatedDate",
                                "ModifiedBy",
                                "ModifiedDate",
                                "IpAddress",
                                "IsDelete",
                                "Qty"
                         FROM
                             "Accessories_Liner_Wall"
                         WHERE
                                 "WallLinerId" = WallLinerId ;
END "Accessories_Wallliner_Select";
/