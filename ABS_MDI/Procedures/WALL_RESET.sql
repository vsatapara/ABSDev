CREATE OR REPLACE PROCEDURE abs_mdi."WALL_RESET" 
(
    WallId IN NUMBER,
    UserId IN NUMBER
)
AS 
BEGIN
    UPDATE "Input_Wall"
    SET
        "Type"='',
        "Gauge"='',
        "Thick"='',
        "BaseFraming"='',
        "BaseFlash"='',
        "BaseClosure"='',
        "SealedWall"='',
        "Washers"='',
        "Notch"='',
        "RakeClosure"='',
        "EaveClosureStrip"='',
        "FastenerType"='',
        "FastenerHeadFinish"='',
        "FastenerLength"='',
        "Warranty"='',
        "FactoryAppliedSealant"='',
        "ReverseRolled"='',
        "OutsideMetalClosure"='',
        "SidelapSealant"='',
        "FoamTape"='',
        "ColdStorageBuilding"='',
        "ExteriorSkinProfile"='',
        "ExteriorSkinTexture"='',
        "InteriorSkinProfile"='',
        "InteriorSkinTexture"='',
        "InteriorSkinGauge"='',
        "Width"='',
        "NotchWidth"='',
        "NotchDepth"='',
        "NotchType"='',
        "RValue"='',
        "UValue"='',
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP
    WHERE "WallId" = WallId;
END Wall_Reset;
/