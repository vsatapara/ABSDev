CREATE OR REPLACE PROCEDURE abs_mdi."GEOMETRYINFORMATION_RESET" 
(
GeometryInformationId IN NUMBER,
BuildingInformationId IN NUMBER,
UserId IN NUMBER
)
AS 
BEGIN
  UPDATE "GeometryInformation"
  SET
     "BuildingWidth" = 0,
     "BuildingLength" = 0,
     "DistanceToRidgeSideWallB" = 0,
     "DistanceToRidgeSideWallD" = 0,
     "DistanceToRidgeSideWallA" = 0,
     "DistanceToRidgeSideWallC" = 0,
     "EaveHeightSideWallB" =  0,
     "EaveHeightSideWallD" =  0,
     "RoofSlopeSideWallB" =  0,
     "RoofSlopeSideWallD" =  0,
     "EaveHeightSideWallA" = 0,
     "EaveHeightSideWallC" = 0,
     "RoofSlopeSideWallA" = 0,
     "RoofSlopeSideWallC" = 0,
     "Swa" = '',
     "Swb"= '',    
     "ModifiedBy" = UserId,
     "ModifiedDate" = CURRENT_TIMESTAMP,
     --"Category" = 'SymmetricalSideWall',
     "CurrentBuilding" = '',
     "AvailableBuilding" = 0,
     "Elevation" = '',
     "XDistance" = 0,
     "YDistance" = 0,
     "OffsetDistance" = '',
     "StartColumn" = 0,
     "StopColumn" = 0,
     "XDirection" = '',
     "YDirection" = '',
     "AttachmentOffset" = 0,
     "PeakHeight" = 0,
     "XCoordinate" = 0,
     "YCoordinate" = 0
 WHERE "GeometryInformationId" = GeometryInformationId AND "BuildingInformationId" = BuildingInformationId;  
    
END GEOMETRYINFORMATION_RESET;
/