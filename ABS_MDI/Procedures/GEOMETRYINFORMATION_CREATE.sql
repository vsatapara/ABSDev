CREATE OR REPLACE PROCEDURE abs_mdi."GEOMETRYINFORMATION_CREATE" (
    GeometryInformationId     IN   NUMBER,
    BuildingInformationId     IN   NUMBER,
    BuildingWidth             IN   NUMBER DEFAULT NULL,
    BuildingLength            IN   NUMBER DEFAULT NULL,
    DistanceToRidgeSideWallB  IN   NUMBER DEFAULT NULL,
    DistanceToRidgeSideWallD  IN   NUMBER DEFAULT NULL,
    DistanceToRidgeSideWallA  IN   NUMBER DEFAULT NULL,
    DistanceToRidgeSideWallC  IN   NUMBER DEFAULT NULL,
    EaveHeightSideWallB       IN   NUMBER DEFAULT NULL,
    EaveHeightSideWallD       IN   NUMBER DEFAULT NULL,
    RoofSlopeSideWallB        IN   NUMBER DEFAULT NULL,
    RoofSlopeSideWallD        IN   NUMBER DEFAULT NULL,
    EaveHeightSideWallA       IN   NUMBER DEFAULT NULL,
    EaveHeightSideWallC       IN   NUMBER DEFAULT NULL,
    RoofSlopeSideWallA        IN   NUMBER DEFAULT NULL,
    RoofSlopeSideWallC        IN   NUMBER DEFAULT NULL,
    UserId                    IN   NUMBER DEFAULT NULL,
    Category                  IN   VARCHAR2 DEFAULT NULL,
    XDistance                 IN   NUMBER DEFAULT NULL,
    YDistance                 IN   NUMBER DEFAULT NULL,
    XDirection                IN   VARCHAR2 DEFAULT NULL,
    YDirection                IN   VARCHAR2 DEFAULT NULL,
    StartColumn               IN   NUMBER DEFAULT NULL,
    StopColumn                IN   NUMBER DEFAULT NULL,
    AttachmentOffset          IN   NUMBER DEFAULT NULL,
    PeakHeight                IN   NUMBER DEFAULT NULL,
    XCoordinate               IN   NUMBER DEFAULT NULL,
    YCoordinate               IN   NUMBER DEFAULT NULL,
    OutputId                  OUT  NUMBER,
    CommonWall                IN   VARCHAR2 DEFAULT NULL
) IS
    rowCount NUMBER := 0;
    DirectionX VARCHAR2(5);
    DirectionY VARCHAR2(5);
BEGIN
    SELECT
        COUNT(1)
    INTO rowCount
    FROM
        "GeometryInformation"
    WHERE
        "BuildingInformationId" = BuildingInformationId;
        
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
    
    IF rowCount = 0 THEN
        IF ( Category = 'SymmetricalEndWall' OR Category = 'NonSymmetricalEndWall' ) THEN
            INSERT INTO "GeometryInformation" (
                "BuildingInformationId",
                "BuildingWidth",
                "BuildingLength",
                "Category",
                "DistanceToRidgeSideWallB",
                "DistanceToRidgeSideWallD",
                "EaveHeightSideWallB",
                "EaveHeightSideWallD",
                "RoofSlopeSideWallB",
                "RoofSlopeSideWallD",
                "XDistance",
                "YDistance",
                "XDirection",
                "YDirection",
                "StartColumn",
                "StopColumn",
                "AttachmentOffset",
                "PeakHeight",
                "XCoordinate",
                "YCoordinate",
                "CreatedBy",
                "CreatedDate",
                "CommonWall"
            ) VALUES (
                BuildingInformationId,
                BuildingWidth,
                BuildingLength,
                Category,
                DistanceToRidgeSideWallB,
                DistanceToRidgeSideWallD,
                EaveHeightSideWallB,
                EaveHeightSideWallD,
                RoofSlopeSideWallB,
                RoofSlopeSideWallD,
                XDistance,
                YDistance,
                DirectionX,
                DirectionY,
                StartColumn,
                StopColumn,
                AttachmentOffset,
                PeakHeight,
                XCoordinate,
                YCoordinate,
                UserId,
                CURRENT_TIMESTAMP,
                CommonWall
            ) RETURNING "GeometryInformationId" INTO OutputId;
        END IF;
        IF ( Category = 'SymmetricalSideWall' OR Category = 'NonSymmetricalSideWall' ) THEN
            INSERT INTO "GeometryInformation" (
                "BuildingInformationId",
                "BuildingWidth",
                "BuildingLength",
                "Category",
                "DistanceToRidgeSideWallA",
                "DistanceToRidgeSideWallC",
                "EaveHeightSideWallA",
                "EaveHeightSideWallC",
                "RoofSlopeSideWallA",
                "RoofSlopeSideWallC",
                "XDistance",
                "YDistance",
                "XDirection",
                "YDirection",
                "StartColumn",
                "StopColumn",
                "AttachmentOffset",
                "PeakHeight",
                "XCoordinate",
                "YCoordinate",
                "CreatedBy",
                "CreatedDate",
                "CommonWall"
            ) VALUES (
                BuildingInformationId,
                BuildingWidth,
                BuildingLength,
                Category,
                DistanceToRidgeSideWallA,
                DistanceToRidgeSideWallC,
                EaveHeightSideWallA,
                EaveHeightSideWallC,
                RoofSlopeSideWallA,
                RoofSlopeSideWallC,
                XDistance,
                YDistance,
                DirectionX,
                DirectionY,
                StartColumn,
                StopColumn,
                AttachmentOffset,
                PeakHeight,
                XCoordinate,
                YCoordinate,
                UserId,
                CURRENT_TIMESTAMP,
                CommonWall
            ) RETURNING "GeometryInformationId" INTO OutputId;
        END IF;
        IF ( Category = 'SingleSlopeEndWallB' OR Category = 'LeanToB' ) THEN
            INSERT INTO "GeometryInformation" (
                "BuildingInformationId",
                "BuildingWidth",
                "BuildingLength",
                "Category",
                "DistanceToRidgeSideWallB",
                "DistanceToRidgeSideWallD",
                "EaveHeightSideWallB",
                "EaveHeightSideWallD",
                "RoofSlopeSideWallB",
                "RoofSlopeSideWallD",
                "XDistance",
                "YDistance",
                "XDirection",
                "YDirection",
                "StartColumn",
                "StopColumn",
                "AttachmentOffset",
                "PeakHeight",
                "XCoordinate",
                "YCoordinate",
                "CreatedBy",
                "CreatedDate",
                "CommonWall"
            ) VALUES (
                BuildingInformationId,
                BuildingWidth,
                BuildingLength,
                Category,
                DistanceToRidgeSideWallB,
                DistanceToRidgeSideWallD,
                EaveHeightSideWallB,
                EaveHeightSideWallD,
                RoofSlopeSideWallB,
                RoofSlopeSideWallD,
                XDistance,
                YDistance,
                DirectionX,
                DirectionY,
                StartColumn,
                StopColumn,
                AttachmentOffset,
                PeakHeight,
                XCoordinate,
                YCoordinate,
                UserId,
                CURRENT_TIMESTAMP,
                CommonWall
            ) RETURNING "GeometryInformationId" INTO OutputId;
        END IF;
        IF ( Category = 'SingleSlopeSideWallC' OR Category = 'LeanToC' ) THEN
            INSERT INTO "GeometryInformation" (
                "BuildingInformationId",
                "BuildingWidth",
                "BuildingLength",
                "Category",
                "DistanceToRidgeSideWallA",
                "DistanceToRidgeSideWallC",
                "EaveHeightSideWallA",
                "EaveHeightSideWallC",
                "RoofSlopeSideWallC",
                "RoofSlopeSideWallA",
                "XDistance",
                "YDistance",
                "XDirection",
                "YDirection",
                "StartColumn",
                "StopColumn",
                "AttachmentOffset",
                "PeakHeight",
                "XCoordinate",
                "YCoordinate",
                "CreatedBy",
                "CreatedDate",
                "CommonWall"
            ) VALUES (
                BuildingInformationId,
                BuildingWidth,
                BuildingLength,
                Category,
                DistanceToRidgeSideWallA,
                DistanceToRidgeSideWallC,
                EaveHeightSideWallA,
                EaveHeightSideWallC,
                RoofSlopeSideWallC,
                RoofSlopeSideWallA,
                XDistance,
                YDistance,
                DirectionX,
                DirectionY,
                StartColumn,
                StopColumn,
                AttachmentOffset,
                PeakHeight,
                XCoordinate,
                YCoordinate,
                UserId,
                CURRENT_TIMESTAMP,
                CommonWall
            ) RETURNING "GeometryInformationId" INTO OutputId;
        END IF;
        IF ( Category = 'SingleSlopeSideWallA' OR Category = 'LeanToA' ) THEN
            INSERT INTO "GeometryInformation" (
                "BuildingInformationId",
                "BuildingWidth",
                "BuildingLength",
                "Category",
                "DistanceToRidgeSideWallA",
                "DistanceToRidgeSideWallC",
                "EaveHeightSideWallA",
                "EaveHeightSideWallC",
                "RoofSlopeSideWallA",
                "RoofSlopeSideWallC",
                "XDistance",
                "YDistance",
                "XDirection",
                "YDirection",
                "StartColumn",
                "StopColumn",
                "AttachmentOffset",
                "PeakHeight",
                "XCoordinate",
                "YCoordinate",
                "CreatedBy",
                "CreatedDate",
                "CommonWall"
            ) VALUES (
                BuildingInformationId,
                BuildingWidth,
                BuildingLength,
                Category,
                DistanceToRidgeSideWallA,
                DistanceToRidgeSideWallC,
                EaveHeightSideWallA,
                EaveHeightSideWallC,
                RoofSlopeSideWallA,
                RoofSlopeSideWallC,
                XDistance,
                YDistance,
                DirectionX,
                DirectionY,
                StartColumn,
                StopColumn,
                AttachmentOffset,
                PeakHeight,
                XCoordinate,
                YCoordinate,
                UserId,
                CURRENT_TIMESTAMP,
                CommonWall
            ) RETURNING "GeometryInformationId" INTO OutputId;
        END IF;
        IF ( Category = 'SingleSlopeEndWallD' OR Category = 'LeanToD' ) THEN
            INSERT INTO "GeometryInformation" (
                "BuildingInformationId",
                "BuildingWidth",
                "BuildingLength",
                "Category",
                "DistanceToRidgeSideWallB",
                "DistanceToRidgeSideWallD",
                "EaveHeightSideWallB",
                "EaveHeightSideWallD",
                "RoofSlopeSideWallD",
                "RoofSlopeSideWallB",
                "XDistance",
                "YDistance",
                "XDirection",
                "YDirection",
                "StartColumn",
                "StopColumn",
                "AttachmentOffset",
                "PeakHeight",
                "XCoordinate",
                "YCoordinate",
                "CreatedBy",
                "CreatedDate",
                "CommonWall"
            ) VALUES (
                BuildingInformationId,
                BuildingWidth,
                BuildingLength,
                Category,
                DistanceToRidgeSideWallB,
                DistanceToRidgeSideWallD,
                EaveHeightSideWallB,
                EaveHeightSideWallD,
                RoofSlopeSideWallD,
                RoofSlopeSideWallB,
                XDistance,
                YDistance,
                DirectionX,
                DirectionY,
                StartColumn,
                StopColumn,
                AttachmentOffset,
                PeakHeight,
                XCoordinate,
                YCoordinate,
                UserId,
                CURRENT_TIMESTAMP,
                CommonWall
            ) RETURNING "GeometryInformationId" INTO OutputId;
        END IF;
    ELSE
        SELECT
            "GeometryInformationId"
        INTO OutputId
        FROM
            "GeometryInformation"
        WHERE
            "BuildingInformationId" = BuildingInformationId;
        GEOMETRYINFORMATION_UPDATE(GeometryInformationId => OutputId, BuildingInformationId => BuildingInformationId,
                                  BuildingWidth => BuildingWidth,
                                  BuildingLength => BuildingLength,
                                  Category => Category,
                                  DistanceToRidgeSideWallB => DistanceToRidgeSideWallB,
                                  DistanceToRidgeSideWallD => DistanceToRidgeSideWallD,
                                  DistanceToRidgeSideWallA => DistanceToRidgeSideWallA,
                                  DistanceToRidgeSideWallC => DistanceToRidgeSideWallC,
                                  EaveHeightSideWallB => EaveHeightSideWallB,
                                  EaveHeightSideWallD => EaveHeightSideWallD,
                                  EaveHeightSideWallA => EaveHeightSideWallA,
                                  EaveHeightSideWallC => EaveHeightSideWallC,
                                  RoofSlopeSideWallA => RoofSlopeSideWallA,
                                  RoofSlopeSideWallC => RoofSlopeSideWallC,
                                  XDistance => XDistance,
                                  YDistance => YDistance,
                                  XDirection => DirectionX,
                                  YDirection => DirectionY,
                                  StartColumn => StartColumn,
                                  StopColumn => StopColumn,
                                  AttachmentOffset => AttachmentOffset,
                                  PeakHeight => PeakHeight,
                                  XCoordinate => XCoordinate,
                                  YCoordinate => YCoordinate,
                                  UserId => UserId,
                                  CommonWall => CommonWall);
    END IF;
END GEOMETRYINFORMATION_CREATE;
/