CREATE OR REPLACE PROCEDURE abs_mdi."WALL_CREATE" 
(
    BuildingInformationId IN NUMBER,
    Type IN NUMBER,
    Gauge IN NUMBER,
    Thick IN NUMBER,
    BaseFraming IN NUMBER,
    BaseFlash IN NUMBER,
    BaseClosure IN NUMBER,
    SealedWall IN CHAR,
    Washers IN CHAR,
    Notch IN CHAR,
    RakeClosure IN CHAR,
    EaveClosureStrip IN CHAR,
    FastenerType IN NUMBER,
    FastenerHeadFinish IN NUMBER,
    FastenerLength IN NUMBER,
    Warranty IN CHAR,
    FactoryAppliedSealant IN NUMBER,
    ReverseRolled IN CHAR,
    OutsideMetalClosure IN CHAR,
    SidelapSealant IN CHAR,
    FoamTape IN CHAR,
    ColdStorageBuilding IN CHAR,
    ExteriorSkinProfile IN NUMBER,
    ExteriorSkinTexture IN NUMBER,
    InteriorSkinProfile IN NUMBER,
    InteriorSkinTexture IN NUMBER,
    InteriorSkinGauge IN NUMBER,
    Width IN NUMBER,
    NotchWidth IN NUMBER,
    NotchDepth IN NUMBER,
    NotchType IN NUMBER,
    RValue IN NUMBER,
    UValue IN NUMBER,
    UserId IN NUMBER,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    
    OutputId OUT NUMBER
)
AS 
BEGIN
     INSERT INTO "Input_Wall"
     (
        "BuildingInformationId",
        "Type",
        "Gauge",
        "Thick",
        "BaseFraming",
        "BaseFlash",
        "BaseClosure",
        "SealedWall",
        "Washers",
        "Notch",
        "RakeClosure",
        "EaveClosureStrip",
        "FastenerType",
        "FastenerHeadFinish",
        "FastenerLength",
        "Warranty",
        "FactoryAppliedSealant",
        "ReverseRolled",
        "OutsideMetalClosure",
        "SidelapSealant",
        "FoamTape",
        "ColdStorageBuilding",
        "ExteriorSkinProfile",
        "ExteriorSkinTexture",
        "InteriorSkinProfile",
        "InteriorSkinTexture",
        "InteriorSkinGauge",
        "Width",
        "NotchWidth",
        "NotchDepth",
        "NotchType",
        "RValue",
        "UValue",
        "CreatedBy",
        "CreatedDate",
        "IpAddress",
        "IsDelete"
     )
     VALUES
     (
        BuildingInformationId,
        Type,
        case when Gauge=0 then null else Gauge end,
        case when Thick=0 then null else Thick end,
        case when BaseFraming=0 then null else BaseFraming end,
        case when BaseFlash=0 then null else BaseFlash end,
        case when BaseClosure=0 then null else BaseClosure end,
        SealedWall,
        Washers,
        Notch,
        RakeClosure,
        EaveClosureStrip,
        case when FastenerType=0 then null else FastenerType end,
        case when FastenerHeadFinish=0 then null else FastenerHeadFinish end,
        case when FastenerLength=0 then null else FastenerLength end,
        Warranty,
        case when FactoryAppliedSealant=0 then null else FactoryAppliedSealant end,
        ReverseRolled,
        OutsideMetalClosure,
        SidelapSealant,
        FoamTape,
        ColdStorageBuilding,
        case when ExteriorSkinProfile=0 then null else ExteriorSkinProfile end,
        case when ExteriorSkinTexture=0 then null else ExteriorSkinTexture end,
        case when InteriorSkinProfile=0 then null else InteriorSkinProfile end,
        case when InteriorSkinTexture=0 then null else InteriorSkinTexture end,
        case when InteriorSkinGauge=0 then null else InteriorSkinGauge end,
        case when Width=0 then null else Width end,
        NotchWidth,
        NotchDepth,
        NotchType,
        RValue,
        UValue,
        UserId,
        CURRENT_TIMESTAMP,
        IpAddress,
        'N' 
     )
     RETURNING "WallId" into OutputId;
END Wall_Create;
/