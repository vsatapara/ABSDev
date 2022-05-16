CREATE OR REPLACE PROCEDURE abs_mdi."ENDWALLS_OPENAREA_SELECT" 
(
    ProjectId IN NUMBER,
    BuildingNo IN NUMBER,
    EndWallNo IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
      SELECT 
        "OptionId",
        "ProjectId",
        "BuildingNo",
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
      FROM "Input_Endwalls_OpenArea" 
       WHERE "ProjectId" = ProjectId and "BuildingNo" = BuildingNo and "EndWallNo" = EndWallNo;
END ENDWALLS_OPENAREA_SELECT;
/