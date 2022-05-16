CREATE OR REPLACE PROCEDURE abs_mdi."ROOF_UPDATE_TEST" (
    RoofId                   IN   NUMBER,
    Type                     IN   VARCHAR2 DEFAULT NULL,
    Gauge                    IN   NUMBER DEFAULT NULL,
    ULRating                 IN   CHAR DEFAULT NULL,
    Width                    IN   VARCHAR2 DEFAULT NULL,
    Profile                  IN   VARCHAR2 DEFAULT NULL,
    Thick                    IN   VARCHAR2 DEFAULT NULL,
    Clip                     IN   VARCHAR2 DEFAULT NULL,
    NotByStar                IN   VARCHAR2 DEFAULT NULL,
    StructScrews             IN   VARCHAR2 DEFAULT NULL,
    StitchScrews             IN   VARCHAR2 DEFAULT NULL,
    Material                 IN   VARCHAR2 DEFAULT NULL,
    ThermalBlock             IN   NUMBER DEFAULT NULL,
    MetalRibClosure          IN   NUMBER DEFAULT NULL,
    SealedRoof               IN   NUMBER DEFAULT NULL,
    RidgePan                 IN   NUMBER DEFAULT NULL,
    AlignmentStrip           IN   NUMBER DEFAULT NULL,
    ULLetter                 IN   NUMBER DEFAULT NULL,
    EavePanelExtension       IN   NUMBER DEFAULT NULL,
    IsBuyout                 IN   CHAR DEFAULT NULL,
    SquareFeet               IN   NUMBER DEFAULT NULL,
    ThermalBlockThickness    IN   VARCHAR2 DEFAULT NULL,
    ProvideBlocks            IN   NUMBER DEFAULT NULL,
    RoofFirst                IN   NUMBER DEFAULT NULL,
    InsulationClips          IN   NUMBER DEFAULT NULL,
    Weathertightness         IN   NUMBER DEFAULT NULL,
    SealedEave               IN   NUMBER DEFAULT NULL,
    ThickInsulation          IN   NUMBER DEFAULT NULL,
    RTSSystem                IN   NUMBER DEFAULT NULL,
    RTSFinish                IN   VARCHAR2 DEFAULT NULL,
    RTSPanelType             IN   VARCHAR2 DEFAULT NULL,
    RTSThickness             IN   NUMBER DEFAULT NULL,
    RTSSpacing               IN   NUMBER DEFAULT NULL,
    ThermalBlockType         IN   VARCHAR2 DEFAULT NULL,
    FastenerType             IN   VARCHAR DEFAULT NULL,
    FastenerHeadFinish       IN   VARCHAR2 DEFAULT NULL,
    FastenerLength           IN   VARCHAR2 DEFAULT NULL,
    WideTape                 IN   NUMBER DEFAULT NULL,
    EaveIcing                IN   NUMBER DEFAULT NULL,
    Warranty                 IN   VARCHAR2 DEFAULT NULL,
    FactoryAppliedSealant    IN   NUMBER DEFAULT NULL,
    WeathertightnessTerm     IN   VARCHAR2 DEFAULT NULL,
    IMPAccLoads              IN   NUMBER DEFAULT NULL,
    SeamerRental             IN   NUMBER DEFAULT NULL,
    StainlessSteelCaps       IN   NUMBER DEFAULT NULL,
    NonhandedErection        IN   NUMBER DEFAULT NULL,
    Direction                IN   NUMBER DEFAULT NULL,
    ProvideHandTools         IN   NUMBER DEFAULT NULL,
    RTSPanelGauge            IN   NUMBER DEFAULT NULL,
    FastenerVender           IN   VARCHAR2 DEFAULT NULL,
    ExteriorSkinTexture      IN   VARCHAR2 DEFAULT NULL,
    FMRating                 IN   NUMBER DEFAULT NULL,
    RoofNavNumber            IN   VARCHAR2 DEFAULT NULL,
    WindRating               IN   VARCHAR2 DEFAULT NULL,
    HASS5CLAMPS              IN   NUMBER DEFAULT NULL,
    IMPPlant                 IN   NUMBER DEFAULT NULL,
    IMPLoads                 IN   NUMBER DEFAULT NULL,
    IncludeToolKit           IN   NUMBER DEFAULT NULL,
    ColdStorageBuilding      IN   NUMBER DEFAULT NULL,
    InteriorSkinProfile      IN   VARCHAR2 DEFAULT NULL,
    InteriorSkinGauge        IN   NUMBER DEFAULT NULL,
    InteriorSkinTexture      IN   VARCHAR2 DEFAULT NULL,
    HasSnowRetentionSystem   IN   NUMBER DEFAULT NULL,
    SnowRetentionRp1         IN   NUMBER DEFAULT NULL,
    SnowRetentionRp2         IN   NUMBER DEFAULT NULL,
    SnowRetentionRp3         IN   NUMBER DEFAULT NULL,
    SnowRetentionRp4         IN   NUMBER DEFAULT NULL,
    IncludeSnowClipPerPanel  IN   NUMBER DEFAULT NULL,
    SnowClipQuantity         IN   NUMBER DEFAULT NULL,
    ColorStripQuantity       IN   NUMBER DEFAULT NULL,
    Rp1SnowLoad              IN   NUMBER DEFAULT NULL,
    Rp2SnowLoad              IN   NUMBER DEFAULT NULL,
    Rp3SnowLoad              IN   NUMBER DEFAULT NULL,
    Rp4SnowLoad              IN   NUMBER DEFAULT NULL,
    BuildingInformationId    IN   NUMBER,
    IpAddress                IN   VARCHAR2 DEFAULT NULL,
    BURLoad                  IN   NUMBER DEFAULT NULL,
    FinishWarranty           IN   CHAR DEFAULT NULL,
    RValue                   IN   VARCHAR2 DEFAULT NULL,
    UserId                   IN   NUMBER,
	TDIRequired              IN   CHAR DEFAULT NULL,
    OutputId                 OUT  NUMBER
) AS
    IsExist NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO IsExist
    FROM
        "Input_Roof"
    WHERE
        "BuildingInformationId" = BuildingInformationId;
    IF IsExist > 0 THEN
        SELECT
            "RoofId"
        INTO OutputId
        FROM
            "Input_Roof"
        WHERE
            "BuildingInformationId" = BuildingInformationId;
        UPDATE "Input_Roof_Test"
        SET
            "Type" = Type,
            "Width" = Width,
            "ULRating" = ULRating,
            "Thick" = Thick,
            "Profile" = Profile,
            "Gauge" = Gauge,
            "InteriorSkinProfile" = InteriorSkinProfile,
            "InteriorSkinGauge" = InteriorSkinGauge,
            "InteriorSkinTexture" = InteriorSkinTexture,
            "IncludeToolKit" = IncludeToolKit,
            "ProvideHandTools" = ProvideHandTools,
            "ColdStorageBuilding" = ColdStorageBuilding,
            "FactoryAppliedSealant" = FactoryAppliedSealant,
            "FastenerType" = FastenerType,
            "FastenerHeadFinish" = FastenerHeadFinish,
            "FastenerLength" = FastenerLength,
            "Warranty" = Warranty,
            "WeathertightnessTerm" = WeathertightnessTerm,
            "IMPAccLoads" = IMPAccLoads,
            "HasSnowRetentionSystem" = HasSnowRetentionSystem,
            "SnowRetentionRp1" = SnowRetentionRp1,
            "SnowRetentionRp2" = SnowRetentionRp2,
            "SnowRetentionRp3" = SnowRetentionRp3,
            "SnowRetentionRp4" = SnowRetentionRp4,
            "ThermalBlockType" = ThermalBlockType,
            "FMRating" = FMRating,
            "EaveIcing" = EaveIcing,
            "WideTape" = WideTape,
            "Clip" = Clip,
            "NotByStar" = NotByStar,
            "StructScrews" = StructScrews,
            "StitchScrews" = StitchScrews,
            "Material" = Material,
            "ThermalBlock" = ThermalBlock,
            "MetalRibClosure" = MetalRibClosure,
            "SealedRoof" = SealedRoof,
            "RidgePan" = RidgePan,
            "AlignmentStrip" = AlignmentStrip,
            "ULLetter" = ULLetter,
            "EavePanelExtension" = EavePanelExtension,
            "IsBuyout" = IsBuyout,
            "SquareFeet" = SquareFeet,
            "ThermalBlockThickness" = ThermalBlockThickness,
            "ProvideBlocks" = ProvideBlocks,
            "RoofFirst" = RoofFirst,
            "InsulationClips" = InsulationClips,
            "Weathertightness" = Weathertightness,
            "SealedEave" = SealedEave,
            "ThickInsulation" = ThickInsulation,
            "RTSSystem" = RTSSystem,
            "RTSFinish" = RTSFinish,
            "RTSPanelType" = RTSPanelType,
            "RTSThickness" = RTSThickness,
            "RTSSpacing" = RTSSpacing,
            "RTSPanelGauge" = RTSPanelGauge,
            "SeamerRental" = SeamerRental,
            "StainlessSteelCaps" = StainlessSteelCaps,
            "NonhandedErection" = NonhandedErection,
            "Direction" = Direction,
            "IpAddress" = IpAddress,
            "BURLoad" = BURLoad,
            "HASS5CLAMPS" = HASS5CLAMPS,
            "IMPPlant" = IMPPlant,
            "IMPLoads" = IMPLoads,
            "IncludeSnowClipPerPanel" = IncludeSnowClipPerPanel,
            "SnowClipQuantity" = SnowClipQuantity,
            "ColorStripQuantity" = ColorStripQuantity,
            "ExteriorSkinTexture" = ExteriorSkinTexture,
            "FinishWarranty" = FinishWarranty,
            "RValue" = RValue,
            "Rp1SnowLoad" = Rp1SnowLoad,
            "Rp2SnowLoad" = Rp2SnowLoad,
            "Rp3SnowLoad" = Rp3SnowLoad,
            "Rp4SnowLoad" = Rp4SnowLoad,
            "ModifiedBy" = UserId,
            "ModifiedDate" = CURRENT_TIMESTAMP,
			"TDIRequired" = TDIRequired
        WHERE
            "RoofId" = OutputId;
    ELSE
        INSERT INTO "Input_Roof_Test" (
            "Type",
            "Width",
            "ULRating",
            "Thick",
            "Profile",
            "Gauge",
            "InteriorSkinProfile",
            "InteriorSkinGauge",
            "InteriorSkinTexture",
            "IncludeToolKit",
            "ProvideHandTools",
            "ColdStorageBuilding",
            "FactoryAppliedSealant",
            "FastenerType",
            "FastenerHeadFinish",
            "FastenerLength",
            "Warranty",
            "WeathertightnessTerm",
            "IMPAccLoads",
            "HasSnowRetentionSystem",
            "SnowRetentionRp1",
            "SnowRetentionRp2",
            "SnowRetentionRp3",
            "SnowRetentionRp4",
            "ThermalBlockType",
            "FMRating",
            "EaveIcing",
            "WideTape",
            "Clip",
            "NotByStar",
            "StructScrews",
            "StitchScrews",
            "Material",
            "ThermalBlock",
            "MetalRibClosure",
            "SealedRoof",
            "RidgePan",
            "AlignmentStrip",
            "ULLetter",
            "EavePanelExtension",
            "IsBuyout",
            "SquareFeet",
            "ThermalBlockThickness",
            "ProvideBlocks",
            "RoofFirst",
            "InsulationClips",
            "Weathertightness",
            "SealedEave",
            "ThickInsulation",
            "RTSSystem",
            "RTSFinish",
            "RTSPanelType",
            "RTSThickness",
            "RTSSpacing",
            "RTSPanelGauge",
            "SeamerRental",
            "StainlessSteelCaps",
            "NonhandedErection",
            "Direction",
            "BuildingInformationId",
            "IpAddress",
            "BURLoad",
            "HASS5CLAMPS",
            "IMPPlant",
            "IMPLoads",
            "IncludeSnowClipPerPanel",
            "SnowClipQuantity",
            "ColorStripQuantity",
            "ExteriorSkinTexture",
            "FinishWarranty",
            "RValue",
            "Rp1SnowLoad",
            "Rp2SnowLoad",
            "Rp3SnowLoad",
            "Rp4SnowLoad",
            "CreatedBy",
            "CreatedDate",
			"TDIRequired"
        ) VALUES (
            Type,
            Width,
            ULRating,
            Thick,
            Profile,
            Gauge,
            InteriorSkinProfile,
            InteriorSkinGauge,
            InteriorSkinTexture,
            IncludeToolKit,
            ProvideHandTools,
            ColdStorageBuilding,
            FactoryAppliedSealant,
            FastenerType,
            FastenerHeadFinish,
            FastenerLength,
            Warranty,
            WeathertightnessTerm,
            IMPAccLoads,
            HasSnowRetentionSystem,
            SnowRetentionRp1,
            SnowRetentionRp2,
            SnowRetentionRp3,
            SnowRetentionRp4,
            ThermalBlockType,
            FMRating,
            EaveIcing,
            WideTape,
            Clip,
            NotByStar,
            StructScrews,
            StitchScrews,
            Material,
            ThermalBlock,
            MetalRibClosure,
            SealedRoof,
            RidgePan,
            AlignmentStrip,
            ULLetter,
            EavePanelExtension,
            IsBuyout,
            SquareFeet,
            ThermalBlockThickness,
            ProvideBlocks,
            RoofFirst,
            InsulationClips,
            Weathertightness,
            SealedEave,
            ThickInsulation,
            RTSSystem,
            RTSFinish,
            RTSPanelType,
            RTSThickness,
            RTSSpacing,
            RTSPanelGauge,
            SeamerRental,
            StainlessSteelCaps,
            NonhandedErection,
            Direction,
            BuildingInformationId,
            IpAddress,
            BURLoad,
            HASS5CLAMPS,
            IMPPlant,
            IMPLoads,
            IncludeSnowClipPerPanel,
            SnowClipQuantity,
            ColorStripQuantity,
            ExteriorSkinTexture,
            FinishWarranty,
            RValue,
            Rp1SnowLoad,
            Rp2SnowLoad,
            Rp3SnowLoad,
            Rp4SnowLoad,
            UserId,
            CURRENT_TIMESTAMP,
            TDIRequired
        ) RETURNING "RoofId" INTO OutputId;
    END IF;
END ROOF_UPDATE_TEST;
/