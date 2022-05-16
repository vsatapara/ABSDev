CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYCANOPY_CREATE" 
(
    BuildingNumber IN NUMBER,
    ProjectId IN NUMBER,
    Select_Elevation IN	VARCHAR2 DEFAULT NULL,
    StartColumn IN	NUMBER DEFAULT NULL,
    StopColumn IN	NUMBER DEFAULT NULL,
    CanopyType IN	VARCHAR2 DEFAULT NULL,
    Projection IN	NUMBER DEFAULT NULL,
    Slope IN	NUMBER DEFAULT NULL,
    Panel IN	VARCHAR2 DEFAULT NULL,
    SoffitPanelColor IN	VARCHAR2 DEFAULT NULL,
    SoffitGaudge IN	NUMBER DEFAULT NULL,
    ReturnDownspouts IN	CHAR DEFAULT NULL,
    Gutter IN	CHAR DEFAULT NULL,
    RoofTieTrimColor IN	VARCHAR2 DEFAULT NULL,
    CanopyCornerTrimColor IN 	VARCHAR2 DEFAULT NULL,
    CanopySillCapTrimColor IN	VARCHAR2 DEFAULT NULL,
    SoffitTrimColor IN	VARCHAR2 DEFAULT NULL,
    SoffitPanelType IN	VARCHAR2 DEFAULT NULL,
    CanopyPanelColor IN	VARCHAR2 DEFAULT NULL,
    CanopyPanelGauge IN	NUMBER DEFAULT NULL,
    CanopySSClipType IN	VARCHAR2 DEFAULT NULL,
    ThermalBlockType IN	VARCHAR2 DEFAULT NULL,
    ExtendRoofInsulation IN	CHAR DEFAULT NULL,
    GutterType IN	NUMBER DEFAULT NULL,
    GutterSize IN	NUMBER DEFAULT NULL,
    DownspoutDrops IN	NUMBER DEFAULT NULL,
    IncludeElbow IN	CHAR DEFAULT NULL,
    DownspoutHeight IN	NUMBER DEFAULT NULL,
    GutterColor IN	VARCHAR2 DEFAULT NULL,
    DownspoutColor IN	VARCHAR2 DEFAULT NULL,
    SoffitFramingClearance IN	NUMBER DEFAULT NULL,
    HasSnowRetentionSystem IN	CHAR DEFAULT NULL,
    IncludeSnowClipPerPanel IN	CHAR DEFAULT NULL,
    SnowClipQuantity IN	NUMBER DEFAULT NULL,
    ColorStripQuantity IN	NUMBER DEFAULT NULL,
    RoofPanelType IN	VARCHAR2 DEFAULT NULL,
    ReverseRollSoffit IN	CHAR DEFAULT NULL,
    ReverseRollFace IN CHAR DEFAULT NULL,
    DistFromLeftCorner IN NUMBER DEFAULT NULL,
    Length IN	NUMBER DEFAULT NULL,
    HeightLocation IN	NUMBER DEFAULT NULL,
    SoffitPanel IN	NUMBER DEFAULT NULL,
    SoffitTrim IN	NUMBER DEFAULT NULL,
    AtEave IN	CHAR DEFAULT NULL,
    PanelFinish IN	VARCHAR2 DEFAULT NULL,
    CanopyFacingSpecial IN	NUMBER DEFAULT NULL,
    CanopyFacingWeight IN	NUMBER DEFAULT NULL,
    CanopyFacingDeflection IN	NUMBER DEFAULT NULL,
    SoffitFacingSpecial IN	NUMBER DEFAULT NULL,
    SoffitFacingWeight IN	NUMBER DEFAULT NULL,
    SoffitFacingDeflection IN	NUMBER DEFAULT NULL,
    Price IN	NUMBER DEFAULT NULL,
    Weight IN	NUMBER DEFAULT NULL,
    ErrorCode IN	NUMBER DEFAULT NULL,
    PriceMBCI IN	NUMBER DEFAULT NULL,
    WeightMBCI IN	NUMBER DEFAULT NULL,
    DesignIndex IN	NUMBER DEFAULT NULL,
    MainBuildingGutter IN	NUMBER DEFAULT NULL,
    RoofSquareFeet IN	NUMBER DEFAULT NULL,
    WallSquareFeet IN	NUMBER DEFAULT NULL,
    SoffitSquareFeet IN	NUMBER DEFAULT NULL,
    HeightOfFace IN	NUMBER DEFAULT NULL,
    SoffitPanelColorValsparCode IN	VARCHAR2 DEFAULT NULL,
    SoffitPanelColorSpecialName IN	VARCHAR2 DEFAULT NULL,
    RoofTieTrimColorValsparCode IN	VARCHAR2 DEFAULT NULL,
    RoofTieTrimColorSpecialName IN	VARCHAR2 DEFAULT NULL,
    CanopyCornerTrimColorValsparCode IN	VARCHAR2 DEFAULT NULL,
    CanopyCornerTrimColorSpecialName IN	VARCHAR2 DEFAULT NULL,
    CanopySillTrimColorValsparCode IN	VARCHAR2 DEFAULT NULL,
    CanopySillTrimColorSpecialName IN	VARCHAR2 DEFAULT NULL,
    SoffitTrimColorValsparCode IN	VARCHAR2 DEFAULT NULL,
    SoffitTrimColorSpecialName IN	VARCHAR2 DEFAULT NULL,
    PanelColorValsparCode IN VARCHAR2 DEFAULT NULL,
    PanelColorSpecialName IN VARCHAR2 DEFAULT NULL,
    GutterColorValsparCode IN VARCHAR2 DEFAULT NULL,
    GutterColorSpecialName IN VARCHAR2 DEFAULT NULL,
    DownspoutColorValsparCode IN VARCHAR2 DEFAULT NULL,
    DownspoutColorSpecialName IN VARCHAR2 DEFAULT NULL,
    SoffitPanelColorValsparText IN	VARCHAR2 DEFAULT NULL,
    SoffitPanelColorValsparHashCode IN	VARCHAR2 DEFAULT NULL,
    RoofTieTrimColorValsparText IN	VARCHAR2 DEFAULT NULL,
    RoofTieTrimColorValsparHashCode IN	VARCHAR2 DEFAULT NULL,
    CanopyCornerTrimColorValsparText IN	VARCHAR2 DEFAULT NULL,
    CanopyCornerTrimColorValsparHashCode IN	VARCHAR2 DEFAULT NULL,
    CanopySillCapTrimColorValsparText IN	VARCHAR2 DEFAULT NULL,
    CanopySillCapTrimColorValsparHashCode IN	VARCHAR2 DEFAULT NULL,
    SoffitTrimColorValsparText IN	VARCHAR2 DEFAULT NULL,
    SoffitTrimColorValsparHashCode IN	VARCHAR2 DEFAULT NULL,
    PanelColorValsparText IN VARCHAR2 DEFAULT NULL,
    PanelColorValsparHashCode IN VARCHAR2 DEFAULT NULL,
    GutterColorValsparText IN VARCHAR2 DEFAULT NULL,
    GutterColorValsparHashCode IN VARCHAR2 DEFAULT NULL,
    DownspoutColorValsparText IN VARCHAR2 DEFAULT NULL,
    DownspoutColorValsparHashCode IN VARCHAR2 DEFAULT NULL,
    IncludeSagAngles IN	CHAR DEFAULT NULL,
    SnowLoad IN	NUMBER DEFAULT NULL,
    UserId IN NUMBER   DEFAULT NULL,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    IsDelete IN VARCHAR2 DEFAULT 'N',
    OutputId OUT NUMBER
)
AS 
BEGIN
    INSERT INTO "Accessories_Canopy" 
    (
                "BuildingNumber",
                "Select_Elevation",
                "StartColumn",
                "StopColumn",
                "CanopyType",
                "Projection",
                "Slope",
                "Panel",
                "SoffitPanelColor",
                "SoffitGaudge",
                "ReturnDownspouts",
                "Gutter",
                "RoofTieTrimColor",
                "CanopyCornerTrimColor",
                "CanopySillCapTrimColor",
                "SoffitTrimColor",
                "SoffitPanelType",
                "CanopyPanelColor",
                "CanopyPanelGauge",
                "CanopySSClipType",
                "ThermalBlockType",
                "ExtendRoofInsulation",
                "GutterType",
                "GutterSize",
                "DownspoutDrops",
                "IncludeElbow",
                "DownspoutHeight",
                "GutterColor",
                "DownspoutColor",
                "SoffitFramingClearance",
                "HasSnowRetentionSystem",
                "IncludeSnowClipPerPanel",
                "SnowClipQuantity",
                "ColorStripQuantity",
                "RoofPanelType",
                "ReverseRollSoffit",
                "ReverseRollFace",
                "Length",
                "HeightLocation",
                "SoffitPanel",
                "SoffitTrim",
                "AtEave",
                "PanelFinish",
                "CanopyFacingSpecial",
                "CanopyFacingWeight",
                "CanopyFacingDeflection",
                "SoffitFacingSpecial",
                "SoffitFacingWeight",
                "SoffitFacingDeflection",
                "Price",
                "Weight",
                "ErrorCode",
                "PriceMBCI",
                "WeightMBCI",
                "DesignIndex",
                "MainBuildingGutter",
                "RoofSquareFeet",
                "WallSquareFeet",
                "SoffitSquareFeet",
                "HeightOfFace",
                "SoffitPanelColorValsparCode",
                "SoffitPanelColorValsparHashCode",
                "RoofTieTrimColorValsparCode",
                "RoofTieTrimColorSpecialName",
                "CanopyCornerTrimColorValsparCode",
                "CanopyCornerTrimColorSpecialName",
                "CanopySillTrimColorValsparCode",
                "CanopySillTrimColorSpecialName",
                "SoffitTrimColorValsparCode",
                "SoffitTrimColorSpecialName",
                "PanelColorValsparCode",
                "PanelColorSpecialName",
                "GutterColorValsparCode",
                "GutterColorSpecialName",
                "DownspoutColorValsparCode",
                "DownspoutColorSpecialName",
                "SoffitPanelColorValsparText",
                "SoffitPanelColorSpecialName",
                "RoofTieTrimColorValsparText",
                "RoofTieTrimColorValsparHashCode",
                "CanopyCornerTrimColorValsparText",
                "CanopyCornerTrimColorValsparHashCode",
                "CanopySillCapTrimColorValsparText",
                "CanopySillCapTrimColorValsparHashCode",
                "SoffitTrimColorValsparText",
                "SoffitTrimColorValsparHashCode",
                "PanelColorValsparText",
                "PanelColorValsparHashCode",
                "GutterColorValsparText",
                "GutterColorValsparHashCode",
                "DownspoutColorValsparText",
                "DownspoutColorValsparHashCode",
                "IncludeSagAngles",                
                "IpAddress",
                "CreatedBy",
                "CreatedDate",
                "IsDelete",
                "DistFromLeftCorner",
                "ProjectId"
    )
    VALUES
    (
               BuildingNumber,
               Select_Elevation,
               StartColumn,
               StopColumn,
               CanopyType,
               Projection,
               Slope,
               Panel,
               SoffitPanelColor,
               SoffitGaudge,
               ReturnDownspouts,
               Gutter,
               RoofTieTrimColor,
               CanopyCornerTrimColor,
               CanopySillCapTrimColor,
               SoffitTrimColor,
               SoffitPanelType,
               CanopyPanelColor,
               CanopyPanelGauge,
               CanopySSClipType,
               ThermalBlockType,
               ExtendRoofInsulation,
               GutterType,
               GutterSize,
               DownspoutDrops,
               IncludeElbow,
               DownspoutHeight,
               GutterColor,
               DownspoutColor,
               SoffitFramingClearance,
               HasSnowRetentionSystem,
               IncludeSnowClipPerPanel,
               SnowClipQuantity,
               ColorStripQuantity,
               RoofPanelType,
               ReverseRollSoffit,
               ReverseRollFace,
                Length,
                HeightLocation,
                SoffitPanel,
                SoffitTrim,
                AtEave,
               PanelFinish,
                CanopyFacingSpecial,
                CanopyFacingWeight,
                CanopyFacingDeflection,
                SoffitFacingSpecial,
                SoffitFacingWeight,
                SoffitFacingDeflection,
                Price,
                Weight,
                ErrorCode,
                PriceMBCI,
                WeightMBCI,
                DesignIndex,
                MainBuildingGutter,
                RoofSquareFeet,
                WallSquareFeet,
                SoffitSquareFeet,
                HeightOfFace,
                SoffitPanelColorValsparCode,
                SoffitPanelColorValsparHashCode,
                RoofTieTrimColorValsparCode,
                RoofTieTrimColorSpecialName,
                CanopyCornerTrimColorValsparCode,
                CanopyCornerTrimColorSpecialName,
                CanopySillTrimColorValsparCode,
                CanopySillTrimColorSpecialName,
                SoffitTrimColorValsparCode,
                SoffitTrimColorSpecialName,
                PanelColorValsparCode,
                PanelColorSpecialName,
                GutterColorValsparCode,
                GutterColorSpecialName,
                DownspoutColorValsparCode,
                DownspoutColorSpecialName,
                SoffitPanelColorValsparText,
                SoffitPanelColorSpecialName,
                RoofTieTrimColorValsparText,
                RoofTieTrimColorValsparHashCode,
                CanopyCornerTrimColorValsparText,
                CanopyCornerTrimColorValsparHashCode,
                CanopySillCapTrimColorValsparText,
                CanopySillCapTrimColorValsparHashCode,
                SoffitTrimColorValsparText,
                SoffitTrimColorValsparHashCode,
                PanelColorValsparText,
                PanelColorValsparHashCode,
                GutterColorValsparText,
                GutterColorValsparHashCode,
                DownspoutColorValsparText,
                DownspoutColorValsparHashCode,
               IncludeSagAngles,               
               IpAddress,                
               UserId,
               CURRENT_TIMESTAMP,
               IsDelete,
               DistFromLeftCorner,
               ProjectId
    )
    RETURNING "AccessoriesCanopyId" into OutputId;
    
END ACCESSORYCANOPY_CREATE;
/