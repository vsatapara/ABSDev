CREATE OR REPLACE PROCEDURE abs_mdi."TRIMCOLORSELECTION_UPDATE" 
(
    TrimColorSelectionId IN NUMBER,
    BuildingNumber IN NUMBER,
    RoofPanel IN VARCHAR2,
    WallPanel IN VARCHAR2,
    EaveFlash IN VARCHAR2,
    GableFlash IN VARCHAR2,
    CornerFlash IN VARCHAR2,
    BaseFlash IN VARCHAR2,
    AllOtherFlash IN VARCHAR2,
    RoofGuarantee IN VARCHAR2,
    WallGuarantee IN VARCHAR2,
    PerforationGuarantee IN NUMBER,
    YearPaint IN VARCHAR2,
    StructPaint IN NUMBER,
    Gutters IN VARCHAR2,
    Downspouts IN VARCHAR2,
    FinishWall IN VARCHAR2,
    FinishRoof IN VARCHAR2,
    FinishEave IN VARCHAR2,
    FinishGable IN VARCHAR2,
    FinishCorner IN VARCHAR2,
    FinishAllOther IN VARCHAR2,
    FinishBase IN VARCHAR2,
    FinishGutter IN VARCHAR2,
    FinishDownspouts IN VARCHAR2,
    AllTrimSameColor IN NUMBER,
    RoofToRoof IN VARCHAR2,
    RoofToWall IN VARCHAR2,
    RoofInteriorSkin IN VARCHAR2,
    WallInteriorSkin IN VARCHAR2,
    RoofPanelValsparCode IN VARCHAR2,
    RoofPanelSpecialName IN VARCHAR2,
    WallPanelValsparCode IN VARCHAR2,
    WallPanelSpecialName IN VARCHAR2,
    EaveFlashValsparCode IN VARCHAR2,
    EaveFlashSpecialName IN VARCHAR2,
    GableFlashValsparCode IN VARCHAR2,
    GableFlashSpecialName IN VARCHAR2,
    CornerFlashValsparCode IN VARCHAR2,
    CornerFlashSpecialName IN VARCHAR2,
    BaseFlashValsparCode IN VARCHAR2,
    BaseFlashSpecialName IN VARCHAR2,
    AllOtherFlashValsparCode IN VARCHAR2,
    AllOtherFlashSpecialName IN VARCHAR2,
    GuttersValsparCode IN VARCHAR2,
    GuttersSpecialName IN VARCHAR2,
    DownspoutsValsparCode IN VARCHAR2,
    DownspoutsSpecialName IN VARCHAR2,
    RoofToRoofValsparCode IN VARCHAR2,
    RoofToRoofSpecialName IN VARCHAR2,
    RoofToWallValsparCode IN VARCHAR2,
    RoofToWallSpecialName IN VARCHAR2,
    RoofInteriorSkinValsparCode IN VARCHAR2,
    RoofInteriorSkinSpecialName IN VARCHAR2,
    WallInteriorSkinValsparCode IN VARCHAR2,
    WallInteriorSkinSpecialName IN VARCHAR2,
    WalkDoors IN VARCHAR2,
    WalkDoorsValsparCode IN VARCHAR2,
    WalkDoorsSpecialName IN VARCHAR2,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
UPDATE "Input_TrimColorSelections" SET        
    "BuildingNumber" = BuildingNumber,
    "RoofPanel" = RoofPanel,
    "WallPanel" = WallPanel,
    "EaveFlash" = EaveFlash,
    "GableFlash" = GableFlash,
    "CornerFlash" = CornerFlash,
    "BaseFlash" = BaseFlash,
    "AllOtherFlash" = AllOtherFlash,
    "RoofGuarantee" = RoofGuarantee,
    "WallGuarantee" = WallGuarantee,
    "PerforationGuarantee" = PerforationGuarantee,
    "YearPaint" = YearPaint,
    "StructPaint" = StructPaint,
    "Gutters" = Gutters,
    "Downspouts" = Downspouts,
    "FinishWall" = FinishWall,
    "FinishRoof" = FinishRoof,
    "FinishEave" = FinishEave,
    "FinishGable" = FinishGable,
    "FinishCorner" = FinishCorner,
    "FinishAllOther" = FinishAllOther,
    "FinishBase" = FinishBase,
    "FinishGutter" = FinishGutter,
    "FinishDownspouts" = FinishDownspouts,
    "AllTrimSameColor" = AllTrimSameColor,
    "RoofToRoof" = RoofToRoof,
    "RoofToWall" = RoofToWall,
    "RoofInteriorSkin" = RoofInteriorSkin,
    "WallInteriorSkin" = WallInteriorSkin,
    "RoofPanelValsparCode" = RoofPanelValsparCode,
    "RoofPanelSpecialName" = RoofPanelSpecialName,
    "WallPanelValsparCode" = WallPanelValsparCode,
    "WallPanelSpecialName" = WallPanelSpecialName,
    "EaveFlashValsparCode" = EaveFlashValsparCode,
    "EaveFlashSpecialName" = EaveFlashSpecialName,
    "GableFlashValsparCode" = GableFlashValsparCode,
    "GableFlashSpecialName" = GableFlashSpecialName,
    "CornerFlashValsparCode" = CornerFlashValsparCode,
    "CornerFlashSpecialName" = CornerFlashSpecialName,
    "BaseFlashValsparCode" = BaseFlashValsparCode,
    "BaseFlashSpecialName" = BaseFlashSpecialName,
    "AllOtherFlashValsparCode" = AllOtherFlashValsparCode,
    "AllOtherFlashSpecialName" = AllOtherFlashSpecialName,
    "GuttersValsparCode" = GuttersValsparCode,
    "GuttersSpecialName" = GuttersSpecialName,
    "DownspoutsValsparCode" = DownspoutsValsparCode,
    "DownspoutsSpecialName" = DownspoutsSpecialName,
    "RoofToRoofValsparCode" = RoofToRoofValsparCode,
    "RoofToRoofSpecialName" = RoofToRoofSpecialName,
    "RoofToWallValsparCode" = RoofToWallValsparCode,
    "RoofToWallSpecialName" = RoofToWallSpecialName,
    "RoofInteriorSkinValsparCode" = RoofInteriorSkinValsparCode,
    "RoofInteriorSkinSpecialName" = RoofInteriorSkinSpecialName,
    "WallInteriorSkinValsparCode" = WallInteriorSkinValsparCode,
    "WallInteriorSkinSpecialName" = WallInteriorSkinSpecialName,
    "WalkDoors" = WalkDoors,
    "WalkDoorsValsparCode" = WalkDoorsValsparCode,
    "WalkDoorsSpecialName" = WalkDoorsSpecialName,    
    "ModifiedBy" = ModifiedBy,
    "ModifiedDate" = CURRENT_TIMESTAMP,
    "IpAddress" = IpAddress
 WHERE "TrimColorSelectionId" = TrimColorSelectionId;
    
END TRIMCOLORSELECTION_UPDATE;
/