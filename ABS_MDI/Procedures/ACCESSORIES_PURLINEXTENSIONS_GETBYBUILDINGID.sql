CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_PURLINEXTENSIONS_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "PurlinExtensionId",
    "ProjectId",
    "BuildingNumber",
    "Elevation",
    "DistanceFromLeftCorner",
    "StartCol",
    "StopCol",
    "Projection",
    "BuildingWidth",
    "SoffitPanelType",
    "SoffitPanelGauge",
    "SoffitPanelColor",
    "SoffitPanelColorSpecialName",
    "SoffitPanelColorValsparCode",
    "SoffitTrimColor",
    "SoffitTrimColorSpecialName",
    "SoffitTrimColorSpecialCode",
    "IsInsulated",
    "SoffixFacingSpecial",
    "ReverseRollSoffit",
    "SoffitFacingWeight",
    "SoffitFacingDeflection"
FROM
    "Accesories_PurlinExtensions"
     WHERE
                "BuildingNumber" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
             AND NVL("IsDelete",'N') != 'Y';
END;
/