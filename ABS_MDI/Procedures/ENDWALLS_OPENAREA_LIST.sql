CREATE OR REPLACE PROCEDURE abs_mdi."ENDWALLS_OPENAREA_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
    SELECT
        "BuildingNo",
        "ProjectId",
        "EndWallNo",
        
        "OpenAreaFor",
        "WallType",
        "AttanchedBuildingNo",
        "Width",
        "Height",
        "IsFullWidth",
        "IsPMaterialByOthers",
        "OpenFor",
        "IsSheetedWall",
        
        "MasonryReinforcement",
        "MasonryType",
        "TiltUp",
        "IsShearWall",
        "ColumnBeBraced",
        "NotDeductLinearPanel",
        "NotDeductInsulation",
        "DeductPanelTrim",
        "IncludeJambFlash",
        "IncludeHeaderFlash",
        "Base",
        "FlashColor",
        
        "MaterialThickness",
        "MaterialWeight",
        "DistanceFromSteelLinetoF",
        "DistanceFromSteelLinetoJ",
        "PercRemainingOpenForWind",
        
        "SupportBeanByManufacturer",
        "BeamLocation",
        "BeamType",
        "BeamDeflectionLenghth",
        "UseFalangeBracing",
        "ConnectionSpaceOfWallAttachmentToSBeam",
        "IpAddress",
        "IsDeleted"
    FROM "Input_Endwalls_OpenArea";
END ENDWALLS_OPENAREA_LIST;
/