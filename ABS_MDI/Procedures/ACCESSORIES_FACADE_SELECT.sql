CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_FACADE_SELECT" (
/*   Created By    Dipali Patel    
     Created Date  25-08-2021
     Description   This stored Procedure used to Select Accesories_Facade.
*/
    FacadeId    IN   NUMBER,
    Facade_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN Facade_Data FOR SELECT
                                "FacadeId",
                                "ProjectId",
                                "BuildingInformationId" ,
                                "Elevation",
                                "StartCol",
                                "StopCol",
                                "DistFromLeftCorner",
                                "Length",
                                "Type",
                                "Projection",
                                "Height",
                                "Gutter",
                                "Slant",
                                "PanelType",
                                "PanelGauge",
                                "PanelFinish",
                                "SoffitPanelType",
                                "SoffitPanelGauge",
                                "SoffitPanelFinish",
                                "FacadePanel",
                                "SoffitPanel",
                                "SoffitElevation",
                                "BackPanelType",
                                "BackPanelGauge",
                                "BackPanelColor",
                                "SillCapTrim",
                                "CornerTrim",
                                "SoffitTrim",
                                "FacadeFacingSpecial",
                                "FacadeFacingWeight",
                                "FacadeFacingDeflection",
                                "SoffitFacingSpecial",
                                "SoffitFacingWeight",
                                "SoffitFacingDeflection",
                                "ReverseRollFace",
                                "ReverseRollBack",
                                "ReverseRollSoffit",
                                "PanelFinishValsparCode",
                                "PanelFinishSpecialName",
                                "SoffitPanelFinishValsparCode",
                                "SoffitPanelFinishSpecialName",
                                "BackPanelColorValsparCode",
                                "BackPanelColorSpecialName",
                                "SillCapTrimValsparCode",
                                "SillCapTrimSpecialName",
                                "CornerTrimValsparCode",
                                "CornerTrimSpecialName",
                                "SoffitTrimValsparCode",
                                "SoffitTrimSpecialName"
                       FROM
                             "Accessories_Facade"
                         WHERE
                                 "FacadeId" = FacadeId
                             AND "IsDelete" = 'N';
END ACCESSORIES_FACADE_SELECT;
/