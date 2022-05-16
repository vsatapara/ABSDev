CREATE OR REPLACE PROCEDURE abs_mdi."GEOMETRYINFORMATION_UPDATE" 
(
    GeometryInformationId IN NUMBER,
    BuildingInformationId IN NUMBER,
    BuildingWidth IN NUMBER,
    BuildingLength IN NUMBER,
    Category IN VARCHAR2,
    DistanceToRidgeSideWallB IN NUMBER DEFAULT NULL,
    DistanceToRidgeSideWallD IN NUMBER DEFAULT NULL,
    DistanceToRidgeSideWallA IN NUMBER DEFAULT NULL,
    DistanceToRidgeSideWallC IN NUMBER DEFAULT NULL,
    EaveHeightSideWallB IN NUMBER DEFAULT NULL,
    EaveHeightSideWallD IN NUMBER DEFAULT NULL,
    RoofSlopeSideWallB IN NUMBER DEFAULT NULL,
    RoofSlopeSideWallD IN NUMBER DEFAULT NULL,
    EaveHeightSideWallA IN NUMBER DEFAULT NULL,
    EaveHeightSideWallC IN NUMBER DEFAULT NULL,
    RoofSlopeSideWallA IN NUMBER DEFAULT NULL,
    RoofSlopeSideWallC IN NUMBER DEFAULT NULL,
    XDistance IN NUMBER  DEFAULT NULL,
    YDistance IN NUMBER  DEFAULT NULL,
    XDirection IN VARCHAR2  DEFAULT NULL,
    YDirection IN VARCHAR2  DEFAULT NULL,
    StartColumn IN NUMBER DEFAULT NULL,
    StopColumn IN NUMBER DEFAULT NULL,
    AttachmentOffset IN NUMBER DEFAULT NULL,
    PeakHeight IN NUMBER DEFAULT NULL,
    XCoordinate IN NUMBER  DEFAULT NULL,
    YCoordinate IN NUMBER  DEFAULT NULL,
    UserId IN NUMBER,
    CommonWall IN VARCHAR2 DEFAULT NULL
)
AS
DirectionX VARCHAR2(5);
DirectionY VARCHAR2(5);
BEGIN
    IF XDirection = 'down' THEN
        DirectionX := 'D';
        DirectionY := 'A';
    END IF;
    IF XDirection = 'left' THEN
        DirectionX := 'B';
        DirectionY := 'A';
    END IF;
    IF XDirection = 'right' THEN
        DirectionX := 'D';
        DirectionY := 'C';
    END IF;
    IF XDirection = 'up' THEN
        DirectionX := 'B';
        DirectionY := 'C';
    END IF;
UPDATE "GeometryInformation"  SET
       --"BuildingInformationId"=BuildingInformationId,
        "BuildingWidth"=BuildingWidth,
        "BuildingLength"=BuildingLength,
        "Category"=Category,
        "DistanceToRidgeSideWallB"=DistanceToRidgeSideWallB,
        "DistanceToRidgeSideWallD"=DistanceToRidgeSideWallD,
        "EaveHeightSideWallB"=EaveHeightSideWallB,
        "EaveHeightSideWallD"=EaveHeightSideWallD,
        "RoofSlopeSideWallB"=RoofSlopeSideWallB,
        "RoofSlopeSideWallD"=RoofSlopeSideWallD,
        "DistanceToRidgeSideWallA"=DistanceToRidgeSideWallA,
        "DistanceToRidgeSideWallC"=DistanceToRidgeSideWallC,
        "EaveHeightSideWallA"=EaveHeightSideWallA,
        "EaveHeightSideWallC"=EaveHeightSideWallC,
        "RoofSlopeSideWallA"=RoofSlopeSideWallA,
        "RoofSlopeSideWallC"=RoofSlopeSideWallC,
        "XDistance"=XDistance,
        "YDistance"=YDistance,
        "XDirection"=DirectionX,
        "YDirection"=DirectionY,
        "StartColumn"=StartColumn,
        "StopColumn"=StopColumn,
        "AttachmentOffset"=AttachmentOffset,
        "PeakHeight"=PeakHeight,
        "XCoordinate"=XCoordinate,
        "YCoordinate"=YCoordinate,
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "CommonWall"=CommonWall
    WHERE "GeometryInformationId"=GeometryInformationId;
END GEOMETRYINFORMATION_UPDATE;
/