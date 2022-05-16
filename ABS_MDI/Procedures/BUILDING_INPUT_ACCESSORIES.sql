CREATE OR REPLACE PROCEDURE abs_mdi."BUILDING_INPUT_ACCESSORIES" 
(
    Id in NUMBER,
    Action in VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS
    Category  VARCHAR2(40);
    L_COUNT   NUMBER(5);
BEGIN
    IF (LOWER(Action) = 'buildinginformation' ) 
    THEN
        OPEN Output_Data FOR
            SELECT
                BI."ProjectId",
                BI."BuildingInformationId",
                BI."BuildingLabel",
                BI."BuildingType",
                BI."BuildingName",
                BI."Elevation",
                BI."FrameType",
                BI."HighSideWallElevation",
                BI."AttachmentElevation"
            FROM "BuildingInformation" BI
            WHERE BI."BuildingInformationId" = Id AND BI."IsDelete" != 'Y'; 
    ELSIF ( LOWER(Action) = 'endwall' )
    THEN
        OPEN Output_Data FOR 
            SELECT
               "BuildingNo",
               "EndWallID",
               "ElevationType",
               "EndWallNo",
               "BayCount",
               "FrameType",
               "ColumnSpacingType"
            FROM "Input_Endwall"
            WHERE "BuildingNo" = Id AND NVL("IsDeleted", 'N') = 'N'
            ORDER BY "EndWallNo";
     ELSIF ( LOWER(Action) = 'columnspacing' )
    THEN
        OPEN Output_Data FOR 
            SELECT
              (Case when "ElevationType" = 'S' 
               then (Case when "EndWallNo" = 1 then 'B' else 'D' end)
               else (Case when "EndWallNo" = 1 then 'A' else 'C' end) end) as "Elevation",
               "BayNo" as "BayNumber",
               "BaySpacing" as "Width"
            FROM "Input_Endwall" IE
            join "Input_Endwalls_ColumnSpacing" IECS on IE."EndWallID" = IECS."EndWallID"
            WHERE IE."BuildingNo" = Id AND NVL(IE."IsDeleted", 'N') = 'N'  AND NVL(IECS."IsDeleted", 'N') = 'N'
            ORDER BY "BayNo";
    ELSIF ( LOWER(Action) = 'buildinggeometry' )
    THEN
        SELECT COUNT(*) INTO L_COUNT FROM "GeometryInformation" WHERE "BuildingInformationId" = Id AND ROWNUM = 1;
        IF ( L_COUNT > 0 ) 
        THEN
            SELECT "Category" INTO Category FROM "GeometryInformation" WHERE "BuildingInformationId" = Id AND ROWNUM = 1;
        END IF;
        
        IF ( Category = 'SymmetricalEndWall' OR Category = 'NonSymmetricalEndWall' ) 
        THEN
            OPEN Output_Data FOR 
                SELECT
                     "GeometryInformationId" AS GeometryId,
                     "BuildingInformationId" AS BuildingId,
                     "BuildingWidth",
                     "BuildingLength",
                     "StartColumn",
                     "StopColumn",
                     "DistanceToRidgeSideWallB"  AS DistanceToRidgeSideWallOne,
                     "DistanceToRidgeSideWallD"  AS DistanceToRidgeSideWallTwo,
                     "EaveHeightSideWallB"       AS EaveHeightSideWallOne,
                     "EaveHeightSideWallD"       AS EaveHeightSideWallTwo,
                     "RoofSlopeSideWallB"        AS RoofSlopeSideWallOne,
                     "RoofSlopeSideWallD"        AS RoofSlopeSideWallTwo,
                     "PeakHeight"
                FROM "GeometryInformation"
                WHERE "BuildingInformationId" = Id;
        END IF;
        
        IF ( Category = 'SymmetricalSideWall' OR Category = 'NonSymmetricalSideWall' ) 
        THEN
            OPEN Output_Data FOR 
                SELECT
                    "GeometryInformationId" AS GeometryId,
                    "BuildingInformationId" AS BuildingId,
                    "BuildingWidth",
                    "BuildingLength",
                    "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
                    "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
                    "EaveHeightSideWallA"       AS EaveHeightSideWallOne,
                    "EaveHeightSideWallC"       AS EaveHeightSideWallTwo,
                    "RoofSlopeSideWallA"        AS RoofSlopeSideWallOne,
                    "RoofSlopeSideWallC"        AS RoofSlopeSideWallTwo,
                    "StartColumn",
                    "StopColumn",
                    "PeakHeight"
                 FROM "GeometryInformation"
                 WHERE "BuildingInformationId" = Id;
        END IF;
        IF ( Category = 'SingleSlopeEndWallB' OR Category = 'LeanToB' ) THEN
            OPEN Output_Data FOR 
                SELECT
                    "GeometryInformationId" AS GeometryId,
                    "BuildingInformationId" AS BuildingId,
                    "BuildingWidth",
                    "BuildingLength",
                    "DistanceToRidgeSideWallB"  AS DistanceToRidgeSideWallOne,
                    "DistanceToRidgeSideWallD"  AS DistanceToRidgeSideWallTwo,
                    "EaveHeightSideWallB"       AS EaveHeightSideWallOne,
                    "EaveHeightSideWallD"       AS EaveHeightSideWallTwo,
                    "RoofSlopeSideWallB"        AS RoofSlopeSideWallOne,
                    "RoofSlopeSideWallD"        AS RoofSlopeSideWallTwo,
                    "StartColumn",
                    "StopColumn",
                    "PeakHeight"
                FROM "GeometryInformation"
                WHERE "BuildingInformationId" = Id;
        END IF;
    
        IF ( Category = 'SingleSlopeSideWallC' OR Category = 'LeanToC' ) 
        THEN
            OPEN Output_Data FOR 
                SELECT
                    "GeometryInformationId" AS GeometryId,
                    "BuildingInformationId" AS BuildingId,
                    "BuildingWidth",
                    "BuildingLength",
                    "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
                    "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
                    "EaveHeightSideWallA"       AS EaveHeightSideWallOne,
                    "EaveHeightSideWallC"       AS EaveHeightSideWallTwo,
                    "RoofSlopeSideWallA"        AS RoofSlopeSideWallOne,
                    "RoofSlopeSideWallC"        AS RoofSlopeSideWallTwo,
                    "StartColumn",
                    "StopColumn",
                    "PeakHeight"
                FROM "GeometryInformation"
                WHERE "BuildingInformationId" = Id;
        END IF;
        IF ( Category = 'SingleSlopeSideWallA' OR Category = 'LeanToA' ) 
        THEN
            OPEN Output_Data FOR 
                SELECT
                    "GeometryInformationId" AS GeometryId,
                    "BuildingInformationId" AS BuildingId,
                    "BuildingWidth",
                    "BuildingLength",
                    "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
                    "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
                    "EaveHeightSideWallA"       AS EaveHeightSideWallOne,
                    "EaveHeightSideWallC"       AS EaveHeightSideWallTwo,
                    "RoofSlopeSideWallA"        AS RoofSlopeSideWallOne,
                    "RoofSlopeSideWallC"        AS RoofSlopeSideWallTwo,
                    "StartColumn",
                    "StopColumn",
                    "PeakHeight"
                FROM "GeometryInformation"
                WHERE "BuildingInformationId" = Id;
        END IF;
        IF ( Category = 'SingleSlopeEndWallD' OR Category = 'LeanToD' ) 
        THEN
            OPEN Output_Data FOR 
                SELECT
                    "GeometryInformationId" AS GeometryId,
                    "BuildingInformationId" AS BuildingId,
                    "BuildingWidth",
                    "BuildingLength",
                    "DistanceToRidgeSideWallB"  AS DistanceToRidgeSideWallOne,
                    "DistanceToRidgeSideWallD"  AS DistanceToRidgeSideWallTwo,
                    "EaveHeightSideWallB"       AS EaveHeightSideWallOne,
                    "EaveHeightSideWallD"       AS EaveHeightSideWallTwo,
                    "RoofSlopeSideWallB"        AS RoofSlopeSideWallOne,
                    "RoofSlopeSideWallD"        AS RoofSlopeSideWallTwo,
                    "StartColumn",
                    "StopColumn",
                    "PeakHeight"
                FROM "GeometryInformation"
                WHERE "BuildingInformationId" = Id;
        END IF;
    ELSIF ( LOWER(Action) = 'girtsbayspacing' )
    THEN
        OPEN Output_Data FOR 
            SELECT
               IGS."BuildingInformationId",
               GPD."DepthValue" as RoofPurlinDepth,
               IGS."RoofPurlinOptimize"
            FROM "Input_GirtsBaySpacing" IGS Join "GirtsAndPurlinDepth" GPD on GPD."DepthId" =  IGS."RoofPurlinDepth"
            WHERE IGS."BuildingInformationId" = Id;
    ELSIF ( LOWER(Action) = 'wall' )
    THEN
        OPEN Output_Data FOR 
            SELECT
               "BuildingInformationId",
               ColorSel."WallInteriorSkin",
               ColorSel."WallInteriorSkinValsparCode",
               ColorSel."WallInteriorSkinSpecialName",
               ColorSel."WallInteriorText",
               ColorSel."WallInteriorHashCode",
               PanelType."Type" "TypeName",
               ColorSel."WallPanel" "WallPanel"
            FROM "Input_Wall" Wall
            JOIN "Input_TrimColorSelections"  ColorSel ON Wall."BuildingInformationId" = ColorSel."BuildingNumber"
            JOIN "M_PanelType"                PanelType ON Wall."Type" = PanelType."Id"
            WHERE "BuildingInformationId" = Id;
    ELSIF ( LOWER(Action) = 'roof' )
    THEN
        OPEN Output_Data FOR 
            SELECT
               "BuildingInformationId",
               "Type",
               "Gauge",
               "NotByStar",
               "Clip",
               "ThermalBlockType",
               "ThermalBlock",
               "SnowRetentionRp1",
               "SnowRetentionRp2",
               ColorSel."RoofPanel",
               ColorSel."RoofPanelValsparCode",
               ColorSel."RoofPanelSpecialName",
                "SquareFeet"
            FROM "Input_Roof" Roof
            JOIN "Input_TrimColorSelections" ColorSel ON Roof."BuildingInformationId"=ColorSel."BuildingNumber"
            WHERE "BuildingInformationId" = Id;
    ELSIF ( LOWER(Action) = 'girts_roofbayspacing' )
    THEN
        OPEN Output_Data FOR 
            SELECT
                "Elevation",
                "BayNumber",
                "Width"
            FROM "Input_Bays"
            WHERE "BuildingInformationId" = Id;
    ELSIF ( LOWER(Action) = 'girts_wallbayspacing' )
    THEN
        OPEN Output_Data FOR 
            SELECT
                IGW."Elevation",
                IGW."RoofBayNumber",
                IGW."DistFromLeftColumn"
            FROM
                "Input_GirtsBaySpacing_Wall" IGW JOIN "Input_GirtsBaySpacing" IG
                ON IGW."GirtSpacingId" = IG."GirtSpacingId"
                WHERE IG."BuildingInformationId" = Id;
     ELSIF ( LOWER(Action) = 'insulation' )
    THEN
        OPEN Output_Data FOR 
            SELECT
                "BuildingNumber",
                "ElevationOnRoof"
            FROM
                "Insulation"
                WHERE "BuildingNumber" = Id;
     ELSIF ( LOWER(Action) = 'trim' )
    THEN
        OPEN Output_Data FOR 
            SELECT
                            T."BuildingNumber",
                            "SW1TrimOption",
                            "SW2TrimOption",
                            "EW3TrimOption",
                            "EW4TrimOption",
                            "SW1NorthernGutter",
                            "SW2NorthernGutter",
                            "EW3NorthernGutter",
                            "EW4NorthernGutter",
                            "SW1GutterSize",
                            "SW2GutterSize",
                            "EW3GutterSize",
                            "EW4GutterSize",
                            "SW1IncludeElbows",
                            "SW2IncludeElbows",
                            "EW3IncludeElbows",
                            "EW4IncludeElbows",
                            P."Gutters",
                            P."GuttersValsparCode",
                            P."GuttersSpecialName",
                            P."GuttersColor",
                            P."GuttersHashCode",
                            P."Downspouts",
                            P."DownspoutsValsparCode",
                            P."DownspoutsSpecialName",
                            P."DownspoutsColor",
                            P."DownspoutsHashCode"
                        FROM
                        "Input_Trim" T
                         JOIN "Input_TrimColorSelections" P ON P."BuildingNumber" = T."BuildingNumber"
                WHERE T."BuildingNumber" = Id;
     ELSIF ( LOWER(Action) = 'loads' )
    THEN
        OPEN Output_Data FOR 
            SELECT
                "BuildingInformationId" as BuildingNumber,
                Project."GroundSnow" as GroundSnowLoad
            FROM
                 "BuildingInformation" BuildingInfo join "Project" Project on BuildingInfo."ProjectId" = Project."ProjectId"
                WHERE "BuildingInformationId" = Id;
    ELSIF ( LOWER(Action) = 'projectinfo' OR LOWER(Action) = 'projectcodesinfo' )
    THEN
        OPEN Output_Data FOR 
            SELECT CASE WHEN Project."PriceStatus" = 'ForQuoteRequest' THEN 0 else 1 END as ForQuote, Project."RainIntensity", Project."DesignCodeName"
            FROM
                 "BuildingInformation" BuildingInfo join "Project" Project on BuildingInfo."ProjectId" = Project."ProjectId"
                WHERE "BuildingInformationId" = Id;
                
    ELSIF ( LOWER(Action) = 'shopcoat' )
    THEN
        OPEN Output_Data FOR 
            SELECT
                "GalvanizedSecondary"
            FROM
                "Input_ShopCoat" WHERE "BuildingInformationId" = Id;
    END IF;
END BUILDING_INPUT_ACCESSORIES;
/