CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_ROOFLINER_SELECT" (
    RoofLinerId    IN   NUMBER,
    RoofLinear_Data    OUT  SYS_REFCURSOR
    ) AS
BEGIN
OPEN RoofLinear_Data FOR SELECT
                                "LinerId" AS "RoofLinerId",
                                "BuildingNumber",
                                "ProjectId",
                                "LinerCoverage",
                                "StartColumn",
                                "StopColumn",
                                "XFrom",
                                "XTo",
                                "YFrom",
                                "YTo",
                                "PanelType",
                                "PanelGauge",
                                "ReverseRoll",
                                "PanelColor",
                                "PanelColorValsparCode",
                                "PanelColorSpecialName",
                                "RidgeTrimGauge",
                                "RafterTieTrimGauge",
                                "EaveToWallTrimGauge",
                                "RidgeTrimColor",
                                "RidgeTrimColorSpecialName",
                                "RidgeTrimColorValsparCode",
                                "EaveToWallTrimColor",
                                "EaveToWallTrimColorValsparCode",
                                "EaveToWallTrimColorSpecialName",
                                "RafterTieTrimColor",
                                "RafterTieTrimColorValsparCode",
                                "RafterTieTrimColorSpecialName",
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
                             "Accessories_Liners"
                         WHERE
                                 "LinerId" = RoofLinerId ;
END ACCESSORIES_ROOFLINER_SELECT;
/