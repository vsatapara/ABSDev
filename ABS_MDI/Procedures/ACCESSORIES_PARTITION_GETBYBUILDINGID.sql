CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_PARTITION_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "PartitionId",
    "BuildingNumber",
    TypeDropdown."CategoryValue" "Type",
    "Length",
    "Height",
    "DistFromEndWall",
    "DistFromSideWall",
    "FullHeight",
    PanelType."Type" "PanelType",
    WidthDropdown."Value" "Width",
    ThicknessDropdown."Value" "Thickness",
    "ReverseRoll",
    ExteriorProfileDropdown."Value" "ExteriorProfile",
    ExteriorGuageDropdown."Value" "ExteriorGuage",
    ExteriorTextureDropdown."Value" "ExteriorTexture",
    AP."ExteriorColor",
    "ExteriorColorSpecialName",
    "ExteriorColorValsparCode",
    InteriorProfileDropdown."Value" "InteriorProfile",
    InteriorGuageDropdown."Value" "InteriorGuage",
    InteriorTextureDropdown."Value" "InteriorTexture",
    AP."InteriorColor",
    "InteriorColorSpecialName",
    "InteriorColorValsparCode",
    FactoryAppliedSealantDropdown."Value" "FactoryAppliedSealant",
    SheeterSideDropdown."CategoryValue" "SheeterSide",
    "ExteriorWall",
    "RecessFoundation",
    "BaseClosureStrips",
    "PurlinTrimColor",
    "PurlinTrimColorSpecialName",
    "PurlinTrimColorValsparCode",
    "CornerTrimColor",
    "CornerTrimColorSpecialName",
    "CornerTrimColorValsparCode",
    "FramingByOthers",
    BaseConditionDropdown."CategoryValue" "BaseCondition",
    FastenerHeadFinishDropdown."Value" "FastenerHeadFinish",
    FastenerLengthDropdown."Value" "FastenerLength",
    "GirtSpacing",
    "ProjectId",
    "GirtDepth",
    GirtTypeDropdown."CategoryValue" "GirtType",
    "StructuralPrice",
    "Elevation",
    "BaseHeight",
    "DistFromWall",
    "PanelFinish",
    "Weight",
    "Price",
    "IsPriced",
    "ErrorCode",
    "PriceInsulation",
    "InsulationFacing",
    "IMPLoads",
    "IMPPlant",
    "PanelColor",
    "SheetBothSides",
    "ByEstimating",
    "QuoteNumber",
    "QuoteYear",
    "EstimatorInitials",
    "ExpiresOn",
    "Expired",
    "StartLoc",
    "StopLoc",
    "EstPrice",
    "EstWeight",
    "ShowComplete",
    "WeightMBCI",
    "PriceMBCI",
    "StructuralWeight",
    "SquareFeet"
FROM
    "Accesories_Partition" AP
                            JOIN "M_PanelType" PanelType ON AP."Type" = PanelType."Id"
                            LEFT JOIN "Accesories_PartitionMaster"  TypeDropdown ON AP."Type" = TypeDropdown."OptionId"
                            LEFT JOIN "Accesories_PartitionMaster"  BaseConditionDropdown ON AP."BaseCondition" = BaseConditionDropdown."OptionId"
                            LEFT JOIN "M_Panel_Dropdown"  ExteriorGuageDropdown ON AP."ExteriorGuage" = ExteriorGuageDropdown."Id"
                            LEFT JOIN "Accesories_PartitionMaster"  GirtTypeDropdown ON AP."GirtType" = GirtTypeDropdown."OptionId"
                            LEFT JOIN "Accesories_PartitionMaster"  SheeterSideDropdown ON AP."SheeterSide" = SheeterSideDropdown."OptionId"
                            LEFT JOIN "M_Panel_Dropdown"  FastenerHeadFinishDropdown ON AP."FastenerHeadFinish" = FastenerHeadFinishDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"  FastenerLengthDropdown ON AP."FastenerLength" = FastenerLengthDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"  WidthDropdown ON AP."Width" = WidthDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"  ThicknessDropdown ON AP."Thickness" = ThicknessDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"  ExteriorProfileDropdown ON AP."ExteriorProfile" = ExteriorProfileDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"  ExteriorTextureDropdown ON AP."ExteriorTexture" = ExteriorTextureDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"  InteriorProfileDropdown ON AP."InteriorProfile" = InteriorProfileDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"  InteriorGuageDropdown ON AP."InteriorGuage" = InteriorGuageDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"  InteriorTextureDropdown ON AP."InteriorTexture" = InteriorTextureDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"  FactoryAppliedSealantDropdown ON AP."FactoryAppliedSealant" = FactoryAppliedSealantDropdown."Id"
WHERE
                "BuildingNumber" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
             AND "IsDelete" != 'Y';
END;
/