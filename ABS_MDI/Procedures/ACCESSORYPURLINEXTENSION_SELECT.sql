CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYPURLINEXTENSION_SELECT" (
    PurlinExtensionId IN NUMBER,
    Output_PurlinExtension OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN Output_PurlinExtension FOR 
        SELECT
        APE."PurlinExtensionId",
        APE."ProjectId",
        APE."BuildingNumber",
        APE."Elevation",
        APE."DistanceFromLeftCorner",
        APE."StartCol",
        APE."StopCol",
        APE."Projection",
        APE."BuildingWidth",
        APE."SoffitPanelType",
        APE."SoffitPanelGauge",
        APE."SoffitPanelColor",
        APE."SoffitPanelColorSpecialName",
        APE."SoffitPanelColorValsparCode",
        APE."SoffitTrimColor",
        APE."SoffitTrimColorSpecialName",
        APE."SoffitTrimColorSpecialCode",
        APE."IsInsulated",
        APE."SoffixFacingSpecial",
        APE."ReverseRollSoffit",
        APE."SoffitFacingWeight",
        APE."SoffitFacingDeflection"
        FROM
        "Accesories_PurlinExtensions" APE 
        where APE."PurlinExtensionId" = PurlinExtensionId and APE."IsDelete" = 'N';
END ACCESSORYPURLINEXTENSION_SELECT;
/