CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_FACADE_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "FacadeId",
    "ProjectId",
    "BuildingInformationId",
    "Elevation",
    "StartCol",
    "StopCol",
    "DistFromLeftCorner",
    "Length",
    F."TypeName" "Type",
    "Projection",
    "Height",
    "Gutter",
    "Slant",
    PanelType_."Type" "PanelType",
    PanelGauge_."Value" "PanelGauge",
    "PanelFinish",
    SoffitPanelType_."Type" "SoffitPanelType",
    SoffitPanelGauge_."Value" "SoffitPanelGauge",
    "SoffitPanelFinish",
    AF."FacadePanel",
    AF."SoffitPanel",
    "SoffitElevation",
    BackPanelType_."Type" "BackPanelType",
    BackPanelGauge_."Value" "BackPanelGauge",
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
    "SoffitTrimSpecialName",
    "BackupCover",
    AF."Trim",
    "CornerUnits",
    "EndCaps",
    "Galvanized",
    "LinerPanel",
    "FacadeWeight",
    "FacadePrice",
    "SoffitPanelWeight",
    "SoffitPanelPrice",
    "FacadeIsPriced",
    "FacadeErrorCode",
    "DeductLiner",
    "DeductTrim",
    "SillCapTrimGauge",
    "CornerTrimGauge",
    "SoffitTrimGauge",
    "FacadeWeightMBCI",
    "FacadePriceMBCI",
    "DesignIndex",
    "FaceSquareFeet",
    "BackSquareFeet",
    "SoffitSquareFeet",
    "RoofSquareFeet"
FROM
    "Accessories_Facade" AF JOIN "M_Facade_Type" F ON AF."Type"=F."Id"
     LEFT JOIN "M_PanelType" PanelType_ ON AF."PanelType" = PanelType_."Id"
     LEFT JOIN "M_PanelType" SoffitPanelType_ ON AF."SoffitPanelType" = SoffitPanelType_."Id"
     LEFT JOIN "M_PanelType" BackPanelType_ ON AF."BackPanelType" = BackPanelType_."Id"
     LEFT JOIN "M_Panel_Dropdown" PanelGauge_ ON AF."PanelGauge" = PanelGauge_."Id"
     LEFT JOIN "M_Panel_Dropdown" SoffitPanelGauge_ ON AF."SoffitPanelGauge" = SoffitPanelGauge_."Id"
     LEFT JOIN "M_Panel_Dropdown" BackPanelGauge_ ON AF."BackPanelGauge" = BackPanelGauge_."Id"
WHERE
                "BuildingInformationId" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
             AND ("IsDelete" IS NULL OR "IsDelete" != 'Y');
END;
/