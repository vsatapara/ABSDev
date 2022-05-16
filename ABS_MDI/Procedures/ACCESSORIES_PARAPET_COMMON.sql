CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_PARAPET_COMMON" 
/*   Created By    Dipali Patel    
     Created Date  20-08-2021
     Description   This stored Procedure used to get dependant data of Building Input tables.
*/
(
    BuildingId IN NUMBER,
    Output_ProjectData OUT SYS_REFCURSOR,
    Output_InformationData OUT SYS_REFCURSOR,
    Output_GeometryData OUT SYS_REFCURSOR,
    Output_GirtBaySpacingData OUT SYS_REFCURSOR,
    Output_GirtBaySpacingData_RBS OUT SYS_REFCURSOR,
    Output_GirtBaySpacingData_WBS OUT SYS_REFCURSOR,
    Output_EndWallData OUT SYS_REFCURSOR,
    Output_RoofData OUT SYS_REFCURSOR,
    Output_Insulation_Data OUT SYS_REFCURSOR
)
AS
 Category  VARCHAR2(40);
BEGIN
    OPEN  Output_ProjectData  FOR
        SELECT
             "PriceStatus"
            FROM 
            "Project" P JOIN "BuildingInformation" BI ON P."ProjectId"=BI."ProjectId" 
            WHERE "BuildingInformationId" = BuildingId and P."IsDelete"='N';
    OPEN  Output_InformationData  FOR
        SELECT
             "FrameType",
             "Elevation",
             "HighSideWallElevation",
             "AttachmentElevation",
             "BuildingType"
            FROM 
            "BuildingInformation"
            WHERE "BuildingInformationId"=BuildingId and "IsDelete"='N';
        SELECT
            "Category"
        INTO Category
        FROM
            "GeometryInformation"
        WHERE
                "BuildingInformationId" = BuildingId
            AND ROWNUM = 1;

    IF ( Category = 'SymmetricalEndWall' OR Category = 'NonSymmetricalEndWall' ) THEN
        OPEN Output_GeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "DistanceToRidgeSideWallB"  AS "DistanceToRidgeSideWallOne",
                                     "DistanceToRidgeSideWallD"  AS "DistanceToRidgeSideWallTwo",
                                     "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                     "RoofSlopeSideWallB"        AS "RoofSlopeSideWallOne",
                                     "RoofSlopeSideWallD"        AS "RoofSlopeSideWallTwo",  
                                     "PeakHeight"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingId;
    END IF;
    IF ( Category = 'SymmetricalSideWall' OR Category = 'NonSymmetricalSideWall' ) THEN
        OPEN Output_GeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "DistanceToRidgeSideWallA"  AS "DistanceToRidgeSideWallOne",
                                     "DistanceToRidgeSideWallC"  AS "DistanceToRidgeSideWallTwo",
                                     "EaveHeightSideWallA"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallC"       AS "EaveHeightSideWallTwo",
                                     "RoofSlopeSideWallA"        AS "RoofSlopeSideWallOne",
                                     "RoofSlopeSideWallC"        AS "RoofSlopeSideWallTwo",  
                                     "PeakHeight"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingId;
    END IF;
    IF ( Category = 'SingleSlopeEndWallB' OR Category = 'LeanToB' ) THEN
        OPEN Output_GeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "DistanceToRidgeSideWallB"  AS "DistanceToRidgeSideWallOne",
                                     "DistanceToRidgeSideWallD"  AS "DistanceToRidgeSideWallTwo",
                                     "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                     "RoofSlopeSideWallB"        AS "RoofSlopeSideWallOne",
                                     "RoofSlopeSideWallD"        AS "RoofSlopeSideWallTwo",  
                                     "PeakHeight"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingId;
    END IF;
    IF ( Category = 'SingleSlopeSideWallC' OR Category = 'LeanToC' ) THEN
        OPEN Output_GeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "DistanceToRidgeSideWallA"  AS "DistanceToRidgeSideWallOne",
                                     "DistanceToRidgeSideWallC"  AS "DistanceToRidgeSideWallTwo",
                                     "EaveHeightSideWallA"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallC"       AS "EaveHeightSideWallTwo",
                                     "RoofSlopeSideWallA"        AS "RoofSlopeSideWallOne",
                                     "RoofSlopeSideWallC"        AS "RoofSlopeSideWallTwo",  
                                     "PeakHeight"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingId;
    END IF;
    IF ( Category = 'SingleSlopeSideWallA' OR Category = 'LeanToA' ) THEN
        OPEN Output_GeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "DistanceToRidgeSideWallA"  AS "DistanceToRidgeSideWallOne",
                                     "DistanceToRidgeSideWallC"  AS "DistanceToRidgeSideWallTwo",
                                     "EaveHeightSideWallA"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallC"       AS "EaveHeightSideWallTwo",
                                     "RoofSlopeSideWallA"        AS "RoofSlopeSideWallOne",
                                     "RoofSlopeSideWallC"        AS "RoofSlopeSideWallTwo",  
                                     "PeakHeight"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingId;
    END IF;
    IF ( Category = 'SingleSlopeEndWallD' OR Category = 'LeanToD' ) THEN
        OPEN Output_GeometryData FOR SELECT
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "DistanceToRidgeSideWallB"  AS "DistanceToRidgeSideWallOne",
                                     "DistanceToRidgeSideWallD"  AS "DistanceToRidgeSideWallTwo",
                                     "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                     "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                     "RoofSlopeSideWallB"        AS "RoofSlopeSideWallOne",
                                     "RoofSlopeSideWallD"        AS "RoofSlopeSideWallTwo",  
                                     "PeakHeight"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingId;
    END IF;
     OPEN Output_GirtBaySpacingData FOR
        SELECT 
            M."DepthValue" as "RoofPurlinDepth",
            "RoofBaySpacing"          
        FROM 
        "Input_GirtsBaySpacing" G JOIN "GirtsAndPurlinDepth" M on G."RoofPurlinDepth"=M."DepthId"
        WHERE "BuildingInformationId"= BuildingId and "IsDelete"='N';
    OPEN Output_GirtBaySpacingData_WBS FOR
        SELECT 
                "WallBaySpaceId",
                "GirtSpacingId",
                "Elevation",
                "RoofBayNumber",
                "DistFromLeftColumn",
                "BaseRecess",
                "RoofBayWidth",
                "Sequence"  
         FROM 
         "Input_GirtsBaySpacing_Wall"
         WHERE "GirtSpacingId"= (select "GirtSpacingId" from "Input_GirtsBaySpacing" WHERE "BuildingInformationId"= BuildingId and "IsDelete"='N');
    OPEN Output_GirtBaySpacingData_RBS FOR
        SELECT
                "Elevation",
                "BayNumber",
                TO_CHAR ("Width") as "Width"
        FROM  "Input_Bays"
        WHERE "BuildingInformationId"= BuildingId 
        
        UNION
        SELECT
             CS."Elevation",--case when E."EndWallNo"=1 then 'B' else 'D' end as "Elevation",
             CS."BayNo" as "BayNumber",
             CS."BaySpacing" as "Width"
        FROM
        "Input_Endwalls_ColumnSpacing" CS JOIN "Input_Endwall" E ON CS."EndWallID" = E."EndWallID" and CS."BuildingNo" = E."BuildingNo" AND NVL(CS."IsDeleted", 'N') = 'N' AND NVL(E."IsDeleted", 'N') = 'N'
        WHERE CS."BuildingNo"=BuildingId Order by "Elevation";
    OPEN Output_EndWallData FOR
        SELECT
            "FrameType", 
            "EndWallNo",
            "BayCount"  
        FROM
        "Input_Endwall" 
        WHERE "BuildingNo"=BuildingId and NVL("IsDeleted", 'N') = 'N';
    OPEN Output_RoofData FOR
        SELECT
            "Type",
            "NotByStar"
        FROM
        "Input_Roof" 
        WHERE "BuildingInformationId"=BuildingId;
    OPEN Output_Insulation_Data FOR 
         SELECT
            "ElevationOnSW1",
            "ElevationOnSW2",
            "ElevationOnEW3",
            "ElevationOnEW4"
        FROM
        "Insulation" 
        WHERE "BuildingNumber"=BuildingId and "IsDelete"='N';
        
END ACCESSORIES_PARAPET_COMMON;
/