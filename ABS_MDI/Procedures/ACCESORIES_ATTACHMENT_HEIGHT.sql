CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_ATTACHMENT_HEIGHT" 
(
    BuildingId IN NUMBER,
    Output_AttachInformationData OUT SYS_REFCURSOR,
    Output_AttachGeometryData OUT SYS_REFCURSOR,
    Output_ParentInformationData OUT SYS_REFCURSOR,
    Output_ParentGeometryData OUT SYS_REFCURSOR,
    Output_BaysData OUT SYS_REFCURSOR,
    Output_SoldierColumnData OUT SYS_REFCURSOR
)
AS
 AttachCategory  VARCHAR2(40);
 ParentCategory  VARCHAR2(40);
 ParentBuildingId Number;
 AttachmentElevation VARCHAR2(5);
 
BEGIN
    SELECT
        "ParentBuildingId","AttachmentElevation"
        INTO ParentBuildingId,AttachmentElevation
        FROM
            "BuildingInformation"
        WHERE
                "BuildingInformationId" = BuildingId;
    SELECT SUBSTR(AttachmentElevation,3,1) INTO AttachmentElevation
     FROM DUAL;
     
     OPEN  Output_BaysData  FOR
        SELECT
            "Width",
            "BayNumber"
            FROM 
            "Input_Bays"
            WHERE "BuildingInformationId" = ParentBuildingId and "Elevation" = AttachmentElevation;
    OPEN  Output_SoldierColumnData  FOR
        SELECT
            "DistFromLeftColumn",
            "RoofBayNumber"
            FROM 
            "Input_GirtsBaySpacing_Wall"
            WHERE "GirtSpacingId" IN (SELECT "GirtSpacingId" from "Input_GirtsBaySpacing" where "BuildingInformationId"=ParentBuildingId) and "Elevation" = AttachmentElevation;
            
    OPEN  Output_AttachInformationData  FOR
        SELECT
            "FrameType",
             NVL("AttachmentElevation",'N/A') as "AttachmentElevation",
             "Elevation",
             "ParentBuildingId"
            FROM 
            "BuildingInformation"
            WHERE "BuildingInformationId" = BuildingId;
    OPEN  Output_ParentInformationData  FOR
        SELECT
            "FrameType",
             NVL("AttachmentElevation",'N/A') as "AttachmentElevation",
             "Elevation",
             "ParentBuildingId"
            FROM 
            "BuildingInformation"
            WHERE "BuildingInformationId" = ParentBuildingId;
        SELECT
            "Category"
        INTO AttachCategory
        FROM
            "GeometryInformation"
        WHERE
                "BuildingInformationId" = BuildingId
            AND ROWNUM = 1;
        SELECT
            "Category"
        INTO ParentCategory
        FROM
            "GeometryInformation"
        WHERE
                "BuildingInformationId" = ParentBuildingId
            AND ROWNUM = 1;
    IF ( AttachCategory = 'SymmetricalEndWall' OR AttachCategory = 'NonSymmetricalEndWall' ) THEN
            OPEN Output_AttachGeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                     "DistanceToRidgeSideWallB" AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallD" AS DistanceToRidgeSideWallTwo,
                                     "PeakHeight",
                                     "StartColumn",
                                     "StopColumn",
                                     "XCoordinate",
                                     "YCoordinate",
                                     "AttachmentOffset"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingId AND ROWNUM = 1;
        END IF;
    IF ( AttachCategory = 'SymmetricalSideWall' OR AttachCategory = 'NonSymmetricalSideWall' ) THEN
            OPEN Output_AttachGeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "EaveHeightSideWallA"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallC"       AS "EaveHeightSideWallTwo",
                                     "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
                                     "PeakHeight",
                                     "StartColumn",
                                     "StopColumn",
                                     "XCoordinate",
                                     "YCoordinate",
                                     "AttachmentOffset"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingId AND ROWNUM = 1;
        END IF; 
    IF ( AttachCategory = 'SingleSlopeEndWallB' OR AttachCategory = 'LeanToB' ) THEN
            OPEN Output_AttachGeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                     "DistanceToRidgeSideWallB" AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallD" AS DistanceToRidgeSideWallTwo,
                                     "PeakHeight",
                                     "StartColumn",
                                     "StopColumn",
                                     "XCoordinate",
                                     "YCoordinate",
                                     "AttachmentOffset"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingId AND ROWNUM = 1;
        END IF;
    IF ( AttachCategory = 'SingleSlopeSideWallC' OR AttachCategory = 'LeanToC' ) THEN
            OPEN Output_AttachGeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "EaveHeightSideWallA"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallC"       AS "EaveHeightSideWallTwo",
                                     "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
                                     "PeakHeight",
                                     "StartColumn",
                                     "StopColumn",
                                     "XCoordinate",
                                     "YCoordinate",
                                     "AttachmentOffset"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingId AND ROWNUM = 1;
        END IF;
    IF ( AttachCategory = 'SingleSlopeSideWallA' OR AttachCategory = 'LeanToA' ) THEN
            OPEN Output_AttachGeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "EaveHeightSideWallA"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallC"       AS "EaveHeightSideWallTwo",
                                     "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
                                     "PeakHeight",
                                     "StartColumn",
                                     "StopColumn",
                                     "XCoordinate",
                                     "YCoordinate",
                                     "AttachmentOffset"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingId AND ROWNUM = 1;
        END IF;
    IF ( AttachCategory = 'SingleSlopeEndWallD' OR AttachCategory = 'LeanToD' ) THEN
            OPEN Output_AttachGeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                     "DistanceToRidgeSideWallB" AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallD" AS DistanceToRidgeSideWallTwo,
                                     "PeakHeight",
                                     "StartColumn",
                                     "StopColumn",
                                     "XCoordinate",
                                     "YCoordinate",
                                     "AttachmentOffset"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingId AND ROWNUM = 1;
        END IF;
 
    IF ( ParentCategory = 'SymmetricalEndWall' OR ParentCategory = 'NonSymmetricalEndWall' ) THEN
        OPEN Output_ParentGeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                     "DistanceToRidgeSideWallB" AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallD" AS DistanceToRidgeSideWallTwo,
                                     "PeakHeight",
                                     "StartColumn",
                                     "StopColumn",
                                     "XCoordinate",
                                     "YCoordinate",
                                     "AttachmentOffset"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = ParentBuildingId AND ROWNUM = 1;
    END IF;
    IF ( ParentCategory = 'SymmetricalSideWall' OR ParentCategory = 'NonSymmetricalSideWall' ) THEN
        OPEN Output_ParentGeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "EaveHeightSideWallA"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallC"       AS "EaveHeightSideWallTwo",
                                     "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
                                     "PeakHeight",
                                     "StartColumn",
                                     "StopColumn",
                                     "XCoordinate",
                                     "YCoordinate",
                                     "AttachmentOffset"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = ParentBuildingId AND ROWNUM = 1;
    END IF;
    IF ( ParentCategory = 'SingleSlopeEndWallB' OR ParentCategory = 'LeanToB' ) THEN
        OPEN Output_ParentGeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                     "DistanceToRidgeSideWallB" AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallD" AS DistanceToRidgeSideWallTwo,
                                     "PeakHeight",
                                     "StartColumn",
                                     "StopColumn",
                                     "XCoordinate",
                                     "YCoordinate",
                                     "AttachmentOffset"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = ParentBuildingId AND ROWNUM = 1;
    END IF;
    IF ( ParentCategory = 'SingleSlopeSideWallC' OR ParentCategory = 'LeanToC' ) THEN
        OPEN Output_ParentGeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "EaveHeightSideWallA"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallC"       AS "EaveHeightSideWallTwo",
                                     "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
                                     "PeakHeight",
                                     "StartColumn",
                                     "StopColumn",
                                     "XCoordinate",
                                     "YCoordinate",
                                     "AttachmentOffset"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = ParentBuildingId AND ROWNUM = 1;
    END IF;
    IF ( ParentCategory = 'SingleSlopeSideWallA' OR ParentCategory = 'LeanToA' ) THEN
        OPEN Output_ParentGeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "EaveHeightSideWallA"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallC"       AS "EaveHeightSideWallTwo",
                                     "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
                                     "PeakHeight",
                                     "StartColumn",
                                     "StopColumn",
                                     "XCoordinate",
                                     "YCoordinate",
                                     "AttachmentOffset"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = ParentBuildingId AND ROWNUM = 1;
    END IF;
    IF ( ParentCategory = 'SingleSlopeEndWallD' OR ParentCategory = 'LeanToD' ) THEN
        OPEN Output_ParentGeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                     "DistanceToRidgeSideWallB" AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallD" AS DistanceToRidgeSideWallTwo,
                                     "PeakHeight",
                                     "StartColumn",
                                     "StopColumn",
                                     "XCoordinate",
                                     "YCoordinate",
                                     "AttachmentOffset"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = ParentBuildingId;
    END IF;

END ACCESORIES_ATTACHMENT_HEIGHT;
/