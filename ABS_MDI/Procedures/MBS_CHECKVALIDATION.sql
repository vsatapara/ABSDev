CREATE OR REPLACE PROCEDURE abs_mdi."MBS_CHECKVALIDATION" 
(
    BuildingId IN NUMBER,
    ProjectId IN NUMBER,
    Output_ProjectData OUT SYS_REFCURSOR,
    Output_InformationData OUT SYS_REFCURSOR,
    Output_GeometryData OUT SYS_REFCURSOR,   
    Output_CollateralsData OUT SYS_REFCURSOR,
    Output_CLM_WindExposuresData OUT SYS_REFCURSOR,
    Output_CLM_SnowExposuresData OUT SYS_REFCURSOR,
    Output_OccupanciesData OUT SYS_REFCURSOR,
    Output_BracingData OUT SYS_REFCURSOR,
    Output_Input_EndwallBData OUT SYS_REFCURSOR,
    Output_Input_EndwallDData OUT SYS_REFCURSOR,
    Output_BFM_FrameLinesData OUT SYS_REFCURSOR,
    Output_Input_GirtsBaySpacingData OUT SYS_REFCURSOR,
    Output_InsulationData OUT SYS_REFCURSOR,
    Output_SystemVariableData OUT SYS_REFCURSOR,
    Output_Input_RoofData OUT SYS_REFCURSOR,
    Output_Input_TrimData OUT SYS_REFCURSOR,
    Output_Accessories_CanopyData OUT SYS_REFCURSOR,
    Output_Accesories_WainscotData OUT SYS_REFCURSOR,
    Output_Accessories_Liner_WallData OUT SYS_REFCURSOR,
    Output_Accesories_WallLTPData OUT SYS_REFCURSOR,
    Output_Accesories_PartitionData OUT SYS_REFCURSOR,
    Output_Input_BaysData OUT SYS_REFCURSOR,
    Output_EWD_BaysData OUT SYS_REFCURSOR,
    Output_EWB_BaysData OUT SYS_REFCURSOR,
    Output_Accessories_DBCIDoorData OUT SYS_REFCURSOR,
    Output_Input_WallData OUT SYS_REFCURSOR
)
AS
 CategoryName VARCHAR2(40) DEFAULT NULL;
 WindExposureId NUMBER DEFAULT NULL;
 SnowExposureId NUMBER DEFAULT NULL;
BEGIN
    OPEN  Output_ProjectData  FOR
        SELECT
            P."IsCanadaBasedDesignCode",
            P."IsHurricaneCoastline",
            P."WindSpeed",
            P."GroundSnow",
            P."DesignCodeId",
            P."DesignCodeName",
            P."IsDesignCodeIbc2012Based",
            CASE WHEN "InputEngineering" = 'Imperial' THEN 'Y' ELSE 'N' END as "UseImperialEngineering",
            CASE WHEN "InputDimensional" = 'Imperial' THEN 'Y' ELSE 'N' END as "UseImperialDimensions",
            P."SeismicSa" as "SeismicSs",
            P."SeismicS1",
            P."SeismicSa1Dot0",
            P."SeismicSa2Dot0",
            S."Name" as "SiteClass_Name",
            P."Country",
            P."State",
            CASE WHEN P."PriceStatus" = 'ForPricingOrder' THEN 'Y' ELSE 'N' END as "IncludedInProjectPrice",
            "ExpiryDate"
            FROM 
            "Project" P , "CLM_SiteClasses" S
            WHERE "ProjectId" = ProjectId and S."SiteClassId" = P."SiteClassId";
    OPEN  Output_InformationData  FOR
        SELECT
            "FrameType",
            CASE WHEN "FrameType" = 'Single Slope' OR "FrameType" = 'Lean-to' THEN 'Y' ELSE 'N' END as "IsMonoSlope",
            "HighSideWallElevation",
            "BuildingName" as "Name",
            "IsComplete"
            FROM 
            "BuildingInformation"
            WHERE "BuildingInformationId" = BuildingId AND "IsDelete" != 'Y';
    SELECT "Category" INTO CategoryName FROM "GeometryInformation" WHERE "BuildingInformationId" = BuildingId AND ROWNUM = 1;
     IF ( CategoryName = 'SymmetricalSideWall') THEN
            OPEN Output_GeometryData FOR SELECT
                 "BuildingWidth" as "Width",
                 "BuildingWidth" as "BayWidth",
                 "BuildingLength" as "Length",
                 "EaveHeightSideWallA" as "EaveHeightOne",
                 "EaveHeightSideWallC" as "EaveHeightTwo",
                 "RoofSlopeSideWallA" as "RpRoofPitchOne",
                 "RoofSlopeSideWallC" as "RpRoofPitchTwo",
                 "DistanceToRidgeSideWallA"  as "DistanceToRidgeOne",
                 "DistanceToRidgeSideWallC"  as "DistanceToRidgeTwo"
                 
             FROM
                 "GeometryInformation"
             WHERE
                 "BuildingInformationId" = BuildingId AND ROWNUM = 1;
        
    ElsIF ( CategoryName = 'SingleSlopeSideWallC' OR CategoryName = 'SingleSlopeSideWallA') THEN
            OPEN Output_GeometryData FOR SELECT
                 "BuildingWidth" as "Width",
                 "BuildingWidth" as "BayWidth",
                 "BuildingLength" as "Length",
                 "EaveHeightSideWallA" as "EaveHeightOne",
                 "EaveHeightSideWallC" as "EaveHeightTwo",
                 "RoofSlopeSideWallA" as "RpRoofPitchOne",
                 "RoofSlopeSideWallC" as "RpRoofPitchTwo",
                 "DistanceToRidgeSideWallA"  as "DistanceToRidgeOne",
                 "DistanceToRidgeSideWallC"  as "DistanceToRidgeTwo"
             FROM
                 "GeometryInformation"
             WHERE
                 "BuildingInformationId" = BuildingId AND ROWNUM = 1;
        ELSE
            OPEN Output_GeometryData FOR 
            SELECT
                 null
             FROM
                 dual;
        END IF;
        
    OPEN  Output_CollateralsData  FOR
        SELECT
            "Occupancy" as "Phrase",
            "CalcRoofSnowLoad" as "RoofSnowLoad",
            "SprinklerLoad",
            "OtherLoad",
            "CeilingLoad",
            "ThermalFactor" as "ThermalCondition"
            FROM 
            "Collaterals"
            WHERE "BuildingNumber" = BuildingId;
            
    SELECT "WindExposureId","SnowExposureId" INTO WindExposureId,SnowExposureId FROM "Project" WHERE "ProjectId" = ProjectId;
    
    OPEN  Output_CLM_WindExposuresData  FOR
        SELECT
            "ExposureFactor" as "ExposureFactor",
            "Name" as "WindExposureMetaName"
            FROM 
            "CLM_WindExposures"
            WHERE "WindExposureId" = WindExposureId;
    OPEN  Output_CLM_SnowExposuresData  FOR
        SELECT
            "Name" as "SnowExposureMetaName"
            FROM 
            "CLM_SnowExposures"
            WHERE "SnowExposureId" = SnowExposureId;
            
    OPEN  Output_OccupanciesData  FOR
        SELECT
            o."SnowLoadImportanceFactorForCanada",
            o."SnowLoadImportanceFactor",
            o."WindLoadImportanceFactorForCanada",
            o."SeismicLoadImportanceFactorForCanada"
            FROM 
            "Occupancies" o, "Collaterals" c
            WHERE c."Occupancy" = o."Name" and "BuildingNumber" = BuildingId;
    OPEN  Output_BracingData  FOR
        SELECT
            "SW1Tiers",
            "SW2Tiers",
            "EW3Tiers",
            "EW4Tiers",
            "RoofBracingLocations" as "RoofTiers",
            "SW1BracingType",
            "SW2BracingType",
            "EW3BracingType",
            "EW4BracingType",
            "RoofBracingType"
            FROM 
            "Bracing"
            WHERE "BuildingNumber" = BuildingId;
    OPEN  Output_Input_EndwallBData  FOR
        SELECT
            "EndWallNo" as "EWBEndWallNo",
            "FrameType" as "EndWallBFrameType",
            "SpecifiedSetback" as "EndWallBFrameSetback"
            FROM 
            "Input_Endwall"
            WHERE "BuildingNo" = BuildingId and "EndWallNo" = 1;
    
    OPEN  Output_Input_EndwallDData  FOR
        SELECT
            "EndWallNo" as "EWDEndWallNo",
            "FrameType" as "EndWallDFrameType",
            "SpecifiedSetback" as "EndWallDFrameSetback"
            FROM 
            "Input_Endwall"
            WHERE "BuildingNo" = BuildingId and "EndWallNo" = 2;
    OPEN  Output_BFM_FrameLinesData  FOR
        SELECT
            "FrameLineNumber" as "Index",
            "GroupNumber"
            FROM "BFM_FrameLines"
            WHERE "BuildingNumber" = BuildingId;
    
    OPEN  Output_Input_GirtsBaySpacingData  FOR
        SELECT
            "RoofBaySpacing"
         FROM "Input_GirtsBaySpacing"
         WHERE "BuildingInformationId" = BuildingId;        
   
   OPEN  Output_InsulationData  FOR
        SELECT
            "PartitionNumber" as "PartitionBays"
         FROM "Insulation"
         WHERE "BuildingNumber" = BuildingId;    
         
    OPEN  Output_SystemVariableData  FOR
        SELECT
            "FramedOpeningClearanceTop" as "FramedOpeningTopClearance",
            "FramedOpeningClearanceSides" as "FramedOpeningSideClearance",
            "FramedOpeningClearanceBottom" as "FramedOpeningBottomClearance",
            "FramedOpeningSideClearenceForMainFrameEndwalls" as "FramedOpeningSideClearenceForMainFrameEndwalls",
            "TopClearenceForMainFrameEndwallsForFramedOpening" as "FramedOpeningTopClearenceForMainFrameEndwalls",
            "FramedOpeningTopClearanceForBearingFrameEndwalls" as "FramedOpeningTopClearenceForBearingFrameEndwalls",
            "FramedOpeningSideClearanceForBearingFrameEndwalls" as "FramedOpeningSideClearenceForBearingFrameEndwalls",
            "DbciDoorClearanceBottom" as "DbciDoorClearanceBottom",
            "DbciDoorClearanceTop" as "DbciDoorTopClearance",
            "DbciDoorClearanceSides" as "DbciDoorSideClearance",
            "DbciDoorTopClearanceForBearingFrameEndwalls" as "DbciDoorTopClearenceForBearingFrameEndwalls",
            "DBCIDoorSideClearanceMainFrame" as "DbciDoorSideClearenceForMainFrameEndwalls",
            "DBCIDoorSideClearanceBearingFrame" as "DbciDoorSideClearenceForBearingFrameEndwalls",
            "TopClearenceForMainFrameEndwallsForDbciDoor" as "DbciDoorTopClearenceForMainFrameEndwalls",
            "ParapetMinimumDistanceAboveRoofLine" as "ParapetMinimumDistanceAboveRoofLine",
            "PortalFrameColumnDepth" as "PortalFrameColumnDepth",
            "PortalFrameBeamDepth" as "PortalFrameBeamDepth"
         FROM "SystemVariable";
    OPEN  Output_Input_RoofData  FOR
        SELECT
            "Type" as "PanelType",
            "Clip" as "SeamClipTypesForUltraDeck"
         FROM "Input_Roof"
         WHERE "BuildingInformationId" = BuildingId;
    OPEN  Output_Input_TrimData  FOR
        SELECT
            "TrimProfile",
            "SW1TrimOption",
            "SW2TrimOption",
            "EW3TrimOption",
            "EW4TrimOption"
         FROM "Input_Trim"
         WHERE "BuildingNumber" = BuildingId;
         
    OPEN  Output_Input_BaysData FOR
        SELECT
            "Elevation",
            "BayNumber",
            "Width"
        FROM "Input_Bays"
        WHERE "BuildingInformationId" = BuildingId;
        
    OPEN  Output_EWD_BaysData FOR
        SELECT
            "BaySpacing" as "BayWidth",
            "BayNo" as "BayNumber"
        FROM "Input_Endwalls_ColumnSpacing" 
        WHERE "EndWallID" IN ( select "EndWallID" from "Input_Endwall" where "BuildingNo" = BuildingId and "EndWallNo" = 2);
        
    OPEN  Output_EWB_BaysData FOR
        SELECT
            "BaySpacing" as "BayWidth",
            "BayNo" as "BayNumber"
        FROM "Input_Endwalls_ColumnSpacing" 
        WHERE "EndWallID" IN ( select "EndWallID" from "Input_Endwall" where "BuildingNo" = BuildingId and "EndWallNo" = 1);
    OPEN Output_Accesories_WainscotData  FOR
        SELECT
            "Hieght" as "Height",
            "Elevation",
            0 as "IsAccessoryFieldLocated",
            0 as "HasFramedOpening",
            0 as "IsWallLtp",
            0 as "ShouldRunCollisionDetection",
            0 as "IsDbciDoor",
            0 as "CanCollideWithBracing",
            0 as "DistFromLeftCorner"
         FROM "Accesories_Wainscot"
         WHERE "BuildingInformationId" = BuildingId; 
     
     OPEN Output_Input_WallData  FOR    
        SELECT 
            mpd."Value" as "BaseFraming"
        FROM "Input_Wall" iw , "M_Panel_Dropdown" mpd 
        WHERE "BuildingInformationId" = BuildingId and iw."BaseFraming" = mpd."Id";
         
    OPEN  Output_Accessories_CanopyData  FOR
        SELECT
            "CanopyType" as "CanopyType",
            "Projection" as "Projection",
            "StartColumn" as "FromSurfaceColumn",
            "StopColumn" as "ToSurfaceColumn",
            "Select_Elevation" as "Elevation",
            "CanopyType" as "CanopyStyle",
            0 as "IsAccessoryFieldLocated",
            0 as "HasFramedOpening",
            0 as "IsWallLtp",
            CASE WHEN "CanopyType" != 'Is at Eave' THEN 1 ELSE 0 END as "ShouldRunCollisionDetection",
            0 as "IsDbciDoor",
            0 as "CanCollideWithBracing",
            0 as "DistFromLeftCorner"
         FROM "Accessories_Canopy"
         WHERE "BuildingNumber" = BuildingId and "IsValid" = 1;
         
    OPEN  Output_Accessories_Liner_WallData  FOR
        SELECT
            "FullHeight" as "IsFullHeight",
            "Height",
            "BaseType" as "WallLinerFacing",
            "Elevation",
            0 as "IsAccessoryFieldLocated",
            0 as "HasFramedOpening",
            0 as "IsWallLtp",
            0 as "ShouldRunCollisionDetection",
            0 as "IsDbciDoor",
            "DistFromLeftCorner",
            0 as "CanCollideWithBracing"
         FROM "Accessories_Liners"
         WHERE "BuildingNumber" = BuildingId;
         
    OPEN  Output_Accesories_WallLTPData  FOR
        SELECT
            "TopElevation",
            "PatternPerBay" as "BayNumber",
            "EaveCondition" as "IsAtEave",
            "Elevation",
            0 as "IsAccessoryFieldLocated",
            0 as "HasFramedOpening",
            1 as "IsWallLtp",
            1 as "ShouldRunCollisionDetection",
            0 as "IsDbciDoor",
            "DistFromLeftCorner",
            0 as "CanCollideWithBracing"
         FROM "Accesories_WallLTP"
         WHERE "BuildingInformationId" = BuildingId;
         
    OPEN  Output_Accesories_PartitionData  FOR
        SELECT
            Count("PartitionId") as "TotalPartition"
         FROM "Accesories_Partition"
         WHERE "BuildingNumber" = BuildingId;
         
    OPEN  Output_Accessories_DBCIDoorData  FOR
        SELECT
            "ResistWind" as "IsWindCertified",
            "Insulated" as "IsInsulated",
            0 as "IsAccessoryFieldLocated",
            0 as "HasFramedOpening",
            0 as "IsWallLtp",
            1 as "ShouldRunCollisionDetection",
            1 as "IsDbciDoor",
            "DistFromLeftCorner",
            1 as "CanCollideWithBracing"
         FROM "Accessories_DBCIDoor"
         WHERE "BuildingId" = BuildingId;
        
        
END MBS_CheckValidation;
/