CREATE OR REPLACE PROCEDURE abs_mdi."GEOMETRYINFORMATION_SELECT" 
(
    BuildingInformationId IN NUMBER,
    OUTPUT_DATA OUT SYS_REFCURSOR
)
AS 
    Category VARCHAR2(40);
BEGIN
SELECT "Category" Into Category from "GeometryInformation" WHERE "BuildingInformationId"=BuildingInformationId AND ROWNUM = 1;
IF (Category='SymmetricalEndWall' OR Category='NonSymmetricalEndWall')
THEN
OPEN Output_Data FOR 
SELECT
    "GeometryInformationId",
    "BuildingInformationId",
    "BuildingWidth",
    "BuildingLength",
    "Category",
    "DistanceToRidgeSideWallB" AS DistanceToRidgeSideWallOne,
    "DistanceToRidgeSideWallD" AS DistanceToRidgeSideWallTwo,
    "EaveHeightSideWallB" AS EaveHeightSideWallOne,
    "EaveHeightSideWallD" AS EaveHeightSideWallTwo,
    "RoofSlopeSideWallB" AS RoofSlopeSideWallOne,
    "RoofSlopeSideWallD" AS RoofSlopeSideWallTwo,
    "XDistance",
    "YDistance",
    "XDirection",
    "YDirection",
    "StartColumn",
    "StopColumn",
    "AttachmentOffset",
    "PeakHeight",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate"
FROM
    "GeometryInformation"
    WHERE "BuildingInformationId"=BuildingInformationId AND ROWNUM = 1;
END IF;
IF (Category='SymmetricalSideWall' OR Category='NonSymmetricalSideWall')
THEN
OPEN Output_Data FOR 
SELECT
    "GeometryInformationId",
    "BuildingInformationId",
    "BuildingWidth",
    "BuildingLength",
    "Category",
    "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
    "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
    "EaveHeightSideWallA" AS EaveHeightSideWallOne,
    "EaveHeightSideWallC" AS  EaveHeightSideWallTwo,
    "RoofSlopeSideWallA" AS RoofSlopeSideWallOne,
    "RoofSlopeSideWallC" AS RoofSlopeSideWallTwo,
    "XDistance",
    "YDistance",
    "XDirection",
    "YDirection",
    "StartColumn",
    "StopColumn",
    "AttachmentOffset",
    "PeakHeight",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate"
FROM
    "GeometryInformation"
    WHERE "BuildingInformationId"=BuildingInformationId AND ROWNUM = 1;
END IF;
IF (Category='SingleSlopeEndWallB' OR Category='LeanToB')
THEN
OPEN Output_Data FOR 
SELECT
    "GeometryInformationId",
    "BuildingInformationId",
    "BuildingWidth",
    "BuildingLength",
    "Category",
    "DistanceToRidgeSideWallB" AS DistanceToRidgeSideWallOne,
    "DistanceToRidgeSideWallD" AS DistanceToRidgeSideWallTwo,
    "EaveHeightSideWallB" AS EaveHeightSideWallOne,
    "EaveHeightSideWallD" AS  EaveHeightSideWallTwo,
    "RoofSlopeSideWallB" AS RoofSlopeSideWallOne,
    "RoofSlopeSideWallD" AS RoofSlopeSideWallTwo,
    "XDistance",
    "YDistance",
    "XDirection",
    "YDirection",
    "StartColumn",
    "StopColumn",
    "AttachmentOffset",
    "PeakHeight",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate"
FROM
    "GeometryInformation"
    WHERE "BuildingInformationId"=BuildingInformationId AND ROWNUM = 1;
END IF;
IF (Category='SingleSlopeSideWallC' OR Category='LeanToC')
THEN
OPEN Output_Data FOR 
SELECT
    "GeometryInformationId",
    "BuildingInformationId",
    "BuildingWidth",
    "BuildingLength",
    "Category",
    "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
    "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
    "EaveHeightSideWallA" AS EaveHeightSideWallOne,
    "EaveHeightSideWallC" AS  EaveHeightSideWallTwo,
    "RoofSlopeSideWallA" AS RoofSlopeSideWallOne,
    "RoofSlopeSideWallC" AS RoofSlopeSideWallTwo,
    "XDistance",
    "YDistance",
    "XDirection",
    "YDirection",
    "StartColumn",
    "StopColumn",
    "AttachmentOffset",
    "PeakHeight",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate"
FROM
    "GeometryInformation"
    WHERE "BuildingInformationId"=BuildingInformationId AND ROWNUM = 1;
END IF;
IF (Category='SingleSlopeSideWallA' OR Category='LeanToA')
THEN
OPEN Output_Data FOR 
SELECT
    "GeometryInformationId",
    "BuildingInformationId",
    "BuildingWidth",
    "BuildingLength",
    "Category",
    "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
    "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
    "EaveHeightSideWallA" AS EaveHeightSideWallOne,
    "EaveHeightSideWallC" AS  EaveHeightSideWallTwo,
    "RoofSlopeSideWallA" AS RoofSlopeSideWallOne,
    "RoofSlopeSideWallC" AS RoofSlopeSideWallTwo,
    "XDistance",
    "YDistance",
    "XDirection",
    "YDirection",
    "StartColumn",
    "StopColumn",
    "AttachmentOffset",
    "PeakHeight",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate"
FROM
    "GeometryInformation"
    WHERE "BuildingInformationId"=BuildingInformationId AND ROWNUM = 1;
END IF;
IF (Category='SingleSlopeEndWallD' OR Category='LeanToD')
THEN
OPEN Output_Data FOR 
SELECT
    "GeometryInformationId",
    "BuildingInformationId",
    "BuildingWidth",
    "BuildingLength",
    "Category",
    "DistanceToRidgeSideWallB" AS DistanceToRidgeSideWallOne,
    "DistanceToRidgeSideWallD" AS DistanceToRidgeSideWallTwo,
    "EaveHeightSideWallB" AS EaveHeightSideWallOne,
    "EaveHeightSideWallD" AS  EaveHeightSideWallTwo,
    "RoofSlopeSideWallB" AS RoofSlopeSideWallOne,
    "RoofSlopeSideWallD" AS RoofSlopeSideWallTwo,
    "XDistance",
    "YDistance",
    "XDirection",
    "YDirection",
    "StartColumn",
    "StopColumn",
    "AttachmentOffset",
    "PeakHeight",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate"
FROM
    "GeometryInformation"
    WHERE "BuildingInformationId"=BuildingInformationId AND ROWNUM = 1;
END IF;
END GEOMETRYINFORMATION_SELECT;
/