CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_TRIMCOLORSELECTIONS_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "TrimColorSelectionId",
    "BuildingNumber",
    "RoofPanel",
    "WallPanel",
    "EaveFlash",
    "GableFlash",
    "CornerFlash",
    "BaseFlash",
    "AllOtherFlash",
    "RoofGuarantee",
    "WallGuarantee",
    "PerforationGuarantee",
    "YearPaint",
    "StructPaint",
    "Gutters",
    "Downspouts",
    "FinishWall",
    "FinishRoof",
    "FinishEave",
    "FinishGable",
    "FinishCorner",
    "FinishAllOther",
    "FinishBase",
    "FinishGutter",
    "FinishDownspouts",
    "AllTrimSameColor",
    "RoofToRoof",
    "RoofToWall",
    "RoofInteriorSkin",
    "WallInteriorSkin",
    "RoofPanelValsparCode",
    "RoofPanelSpecialName",
    "WallPanelValsparCode",
    "WallPanelSpecialName",
    "EaveFlashValsparCode",
    "EaveFlashSpecialName",
    "GableFlashValsparCode",
    "GableFlashSpecialName",
    "CornerFlashValsparCode",
    "CornerFlashSpecialName",
    "BaseFlashValsparCode",
    "BaseFlashSpecialName",
    "AllOtherFlashValsparCode",
    "AllOtherFlashSpecialName",
    "GuttersValsparCode",
    "GuttersSpecialName",
    "DownspoutsValsparCode",
    "DownspoutsSpecialName",
    "RoofToRoofValsparCode",
    "RoofToRoofSpecialName",
    "RoofToWallValsparCode",
    "RoofToWallSpecialName",
    "RoofInteriorSkinValsparCode",
    "RoofInteriorSkinSpecialName",
    "WallInteriorSkinValsparCode",
    "WallInteriorSkinSpecialName",
    "WalkDoors",
    "WalkDoorsValsparCode",
    "WalkDoorsSpecialName",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDelete",
    "WallPanelText",
    "WallPanelHashCode",
    "WallInteriorText",
    "WallInteriorHashCode",
    "EaveFlashColor",
    "EaveFlashHashCode",
    "GableFlashColor",
    "GableFlashHashCode",
    "CornerFlashColor",
    "CornerFlashHashCode",
    "BaseFlashColor",
    "BaseFlashHashCode",
    "GuttersColor",
    "GuttersHashCode",
    "DownspoutsColor",
    "DownspoutsHashCode",
    "AllOtherFlashColor",
    "AllOtherFlashHashCode",
    "RoofToRoofColor",
    "RoofToRoofHashCode",
    "RoofToWallColor",
    "RoofToWallHashCode",
    "WalkDoorsColor",
    "WalkDoorsHashCode"
FROM
    "Input_TrimColorSelections"
                WHERE
                "BuildingNumber" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                )
                AND NVL("IsDelete",'N') != 'Y';
END;
/