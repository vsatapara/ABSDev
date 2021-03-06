CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_PARTITION_CREATE" (
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
    GirtDepth           IN   NUMBER,
    GirtType           IN   NUMBER,
    ProjectId             IN   NUMBER,
    UserId                IN   NUMBER DEFAULT NULL,
    IpAddress             IN   VARCHAR2,
    Elevation             IN   VARCHAR2,
    OutputId              OUT  NUMBER) AS 
BEGIN
   INSERT INTO "Accesories_Partition" (
    "BuildingNumber",
    "Type",
    "Length",
    "Height",
    "DistFromEndWall",
    "DistFromSideWall",
    "FullHeight",
    "PanelType",
    "Width",
    "Thickness",
    "ReverseRoll",
    "ExteriorProfile",
    "ExteriorGuage",
    "ExteriorTexture",
    "ExteriorColor",
    "ExteriorColorSpecialName",
    "ExteriorColorValsparCode",
    "InteriorProfile",
    "InteriorGuage",
    "InteriorTexture",
    "InteriorColor",
    "InteriorColorSpecialName",
    "InteriorColorValsparCode",
    "FactoryAppliedSealant",
    "SheeterSide",
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
    "BaseCondition",
    "FastenerHeadFinish",
    "FastenerLength",
    "GirtSpacing",
    "ProjectId",
    "CreatedBy",
    "CreatedDate",
    "IpAddress",
    "GirtDepth",
    "GirtType",
    "Elevation",
    "BaseHeight",
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
    "WeightMBCI",
    "PriceMBCI",
    "StructuralWeight",
    "SquareFeet",
    "StructuralPrice"
    ) 
    VALUES (  
      BuildingNumber,
      Type,
      Length,
      Height,
      DistFromEndWall,
      DistFromSideWall,
      FullHeight,
      PanelType,
      Width,
      Thickness,
      ReverseRoll,
      ExteriorProfile,
      ExteriorGuage,
      ExteriorTexture,
      ExteriorColor,
      ExteriorColorSpecialName,
      ExteriorColorValsparCode,
      InteriorProfile,
      InteriorGuage,
      InteriorTexture,
      InteriorColor,
      InteriorColorSpecialName,
      InteriorColorValsparCode,
      FactoryAppliedSealant,
      SheeterSide,
      ExteriorWall,
      RecessFoundation,
      BaseClosureStrips,
      PurlinTrimColor,
      PurlinTrimColorSpecialName,
      PurlinTrimColorValsparCode,
      CornerTrimColor,
      CornerTrimColorSpecialName,
      CornerTrimColorValsparCode,
      FramingByOthers,
      BaseCondition,
      FastenerHeadFinish,
      FastenerLength,
      GirtSpacing,
      ProjectId,
      UserId,
      CURRENT_TIMESTAMP,
      IpAddress,
      GirtDepth,
      GirtType,
      Elevation,
      0,
      0,
      0,
      'N',
      0,
      'N',
      '0',
      0,
      'N',
      ' ',
      'N',
       'N',
       ' ',
       ' ', 
       ' ',
       ' ',
       'N',
       ' ',
       ' ',
       0,
       0,
       0,
       0,
       0,
       0,
       0
    ) RETURNING "PartitionId" INTO OutputId;
END ACCESORIES_PARTITION_CREATE;
/