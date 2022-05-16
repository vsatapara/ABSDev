CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_PARTITION_UPDATE" (
    PartitionId      IN   NUMBER,
    BuildingNumber   IN   NUMBER,
    Type             IN   NUMBER,
    Length           IN   VARCHAR2,
    Height           IN   VARCHAR2,
    DistFromEndWall  IN   VARCHAR2,
    DistFromSideWall IN   VARCHAR2,
    FullHeight       IN   CHAR,
    PanelType        IN   NUMBER,
    Width            IN   NUMBER,
    Thickness        IN   NUMBER,
    ReverseRoll      IN   CHAR,
    ExteriorProfile  IN   NUMBER,
    ExteriorGuage    IN   NUMBER,
    ExteriorTexture  IN   NUMBER,
    ExteriorColor    IN   VARCHAR2,
    ExteriorColorSpecialName       IN   VARCHAR2,
    ExteriorColorValsparCode       IN   VARCHAR2,
    InteriorProfile       IN   NUMBER,
    InteriorGuage         IN   NUMBER,
    InteriorTexture       IN   NUMBER,
    InteriorColor         IN   VARCHAR2,
    InteriorColorSpecialName       IN   VARCHAR2,
    InteriorColorValsparCode       IN   VARCHAR2,
    FactoryAppliedSealant          IN   NUMBER,
    SheeterSide           IN   VARCHAR2,
    ExteriorWall          IN   VARCHAR2,
    RecessFoundation      IN   CHAR,
    BaseClosureStrips     IN   CHAR,
    PurlinTrimColor       IN   VARCHAR2,
    PurlinTrimColorSpecialName     IN   VARCHAR2,
    PurlinTrimColorValsparCode     IN   VARCHAR2,
    CornerTrimColor       IN   VARCHAR2,
    CornerTrimColorSpecialName     IN   VARCHAR2,
    CornerTrimColorValsparCode     IN   VARCHAR2,
    FramingByOthers       IN   CHAR,
    BaseCondition         IN   NUMBER,
    FastenerHeadFinish    IN   NUMBER,
    FastenerLength        IN   NUMBER,
    GirtSpacing           IN   VARCHAR2, 
    GirtDepth              IN   NUMBER,
    GirtType             IN   NUMBER,
    ProjectId             IN   NUMBER,
    UserId                IN   NUMBER DEFAULT NULL,
    IpAddress             IN   VARCHAR2,
    Elevation             IN   VARCHAR2
) AS
BEGIN
    UPDATE "Accesories_Partition"
    SET
    
        "BuildingNumber" = BuildingNumber,
        "Type" = Type,
        "Length" = Length,
        "Height" = Height,
        "DistFromEndWall" = DistFromEndWall,
        "DistFromSideWall" =DistFromSideWall,
        "FullHeight" = FullHeight,
        "PanelType" = PanelType,
        "Width" = Width,
        "Thickness" = Thickness,
        "ReverseRoll" = ReverseRoll,
        "ExteriorProfile" = ExteriorProfile,
        "ExteriorGuage" = ExteriorGuage,
        "ExteriorTexture" = ExteriorTexture,
        "ExteriorColor" = ExteriorColor,
        "ExteriorColorSpecialName" = ExteriorColorSpecialName,
        "ExteriorColorValsparCode" = ExteriorColorValsparCode,
        "InteriorProfile" = InteriorProfile,
        "InteriorGuage" = InteriorGuage,
        "InteriorTexture" = InteriorTexture,
        "InteriorColor" = InteriorColor,
        "InteriorColorSpecialName" = InteriorColorSpecialName,
        "InteriorColorValsparCode" = InteriorColorValsparCode,
        "FactoryAppliedSealant" = FactoryAppliedSealant,
        "SheeterSide" = SheeterSide,
        "ExteriorWall" = ExteriorWall,
        "RecessFoundation" = RecessFoundation,
        "BaseClosureStrips" = BaseClosureStrips,
        "PurlinTrimColor" = PurlinTrimColor,
        "PurlinTrimColorSpecialName" = PurlinTrimColorSpecialName,
        "PurlinTrimColorValsparCode" = PurlinTrimColorValsparCode,
        "CornerTrimColor" = CornerTrimColor,
        "CornerTrimColorSpecialName" = CornerTrimColorSpecialName,
        "CornerTrimColorValsparCode" = CornerTrimColorValsparCode,
        "FramingByOthers" = FramingByOthers,
        "BaseCondition" = BaseCondition,
        "FastenerHeadFinish" = FastenerHeadFinish,
        "FastenerLength" = FastenerLength,
        "GirtSpacing" = GirtSpacing,
        "ProjectId" = ProjectId,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" =IpAddress,
        "GirtDepth" =GirtDepth,
        "GirtType" =GirtType,
         "Elevation" = Elevation,
        "BaseHeight" = 0,
    "Weight" = 0,
    "Price"= 0,
    "IsPriced" = 'N',
    "ErrorCode" = 0,
    "PriceInsulation" =  'N',
    "InsulationFacing" = '0',
    "IMPLoads" = 0,
    "IMPPlant" = 'N',
    "PanelColor" = ' ',
    "SheetBothSides" = 'N',
    "ByEstimating" = 'N',
    "QuoteNumber" = ' ',
    "QuoteYear" = ' ',
    "EstimatorInitials" = ' ',
    "ExpiresOn" = ' ',
    "Expired" =  'N',
    "StartLoc" = ' ',
    "StopLoc" = ' ',
    "EstPrice" = 0,
    "EstWeight" = 0,
    "WeightMBCI" = 0,
    "PriceMBCI" = 0,
    "StructuralWeight" = 0,
    "SquareFeet" = 0,
    "StructuralPrice" = 0
    WHERE
        "PartitionId" = PartitionId;
END ACCESORIES_PARTITION_UPDATE;
/