CREATE OR REPLACE PROCEDURE abs_mdi."MBS_PRICING" (
    BuildingId IN NUMBER,
    ProjectId IN NUMBER,
    Output_CLM_DesignCodesData OUT SYS_REFCURSOR,
    Output_ProjectData OUT SYS_REFCURSOR,
    Output_InformationData OUT SYS_REFCURSOR,
    Output_GeometryData OUT SYS_REFCURSOR,
    Output_CollateralsData OUT SYS_REFCURSOR,
    Output_CLM_WindExposuresData OUT SYS_REFCURSOR,
    Output_CLM_SnowExposuresData OUT SYS_REFCURSOR,
    Output_OccupanciesData OUT SYS_REFCURSOR,
    Output_BracingData OUT SYS_REFCURSOR,
    Output_DeflectionsData OUT SYS_REFCURSOR,
    Output_Input_RoofData OUT SYS_REFCURSOR,
    Output_Accessories_DBCIDoorData OUT SYS_REFCURSOR,
    Output_Input_BaysData OUT SYS_REFCURSOR
)
AS 
CategoryName VARCHAR2(40);
WindExposureId NUMBER;
SnowExposureId NUMBER;
BEGIN
    OPEN  Output_CLM_DesignCodesData  FOR
        SELECT
            "MBS_Code" as "Code",
            "MBS_Design_type" as "Design_type",
            "MBS_Year" as "Year",
            "MBS_Cold_Version" as "Cold_Version",
            "MBS_Hot_Version" as "Hot_Version",
            "MBS_Local" as "Local",
            "MBS_FileName MBS_FileName" as "FileName",
            "Edition" as "MbsBuildingCodeBaseIbcYear"
        FROM "CLM_DesignCodes" CLM, "Project" P
        WHERE "ProjectId" = ProjectId and CLM."DesignCodeId" = P."DesignCodeId";
        
    OPEN  Output_ProjectData  FOR
        SELECT
             P."IsCanadaBasedDesignCode" as "DesignCodeIsCanadaBased",
             P."IsHurricaneCoastline",
             P."WindSpeed",
             P."GroundSnow",
             P."DesignCodeId",
             P."DesignCodeName",
             P."IsDesignCodeIbc2012Based",
             P."RainLoad",
             P."MinimumSnowLoad",
             P."LiveLoad",
             P."IsLiveLoadReductionAllowed",
             P."WindLoad",
             CASE WHEN "InputEngineering" = 'Imperial' THEN 'Y' ELSE 'N' END as "UseImperialEngineering",
             CASE WHEN "InputDimensional" = 'Imperial' THEN 'Y' ELSE 'N' END as "UseImperialDimensions",
             P."SeismicSa" as "SeismicSs",
             P."SeismicS1",
             P."SeismicSa1Dot0",
             P."SeismicSa2Dot0",
             S."Name" as "SiteClass_Name",
             P."Country",
             P."State"
            FROM 
            "Project" P , "CLM_SiteClasses" S
            WHERE "ProjectId" = ProjectId and S."SiteClassId" = P."SiteClassId";
            
    
    OPEN  Output_CLM_WindExposuresData  FOR
        SELECT
            "ExposureFactor" as "ExposureFactor",
            "Name" as "WindExposureMetaName"
        FROM "CLM_WindExposures"
        WHERE "WindExposureId" = WindExposureId;
    OPEN  Output_CLM_SnowExposuresData  FOR
        SELECT
            "Name" as "SnowExposureMetaName"
        FROM "CLM_SnowExposures"
        WHERE "SnowExposureId" = SnowExposureId;
    OPEN  Output_InformationData  FOR
        SELECT
            "FrameType"
        FROM "BuildingInformation"
        WHERE "BuildingInformationId" = BuildingId;
        
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
        END IF; 
    IF ( CategoryName = 'SingleSlopeSideWallC' OR CategoryName = 'SingleSlopeSideWallA') THEN
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
        END IF;
    OPEN  Output_CollateralsData  FOR
        SELECT
            "Occupancy",
            "SprinklerLoad",
            "OtherLoad",
            "CeilingLoad",
            "ThermalFactor" as "ThermalCondition"
            FROM 
            "Collaterals"
            WHERE "BuildingNumber" = BuildingId;
            
    OPEN  Output_OccupanciesData  FOR
        SELECT
            "SeismicLoadImportanceFactorForCanada",
            "SeismicImportanceLoadFactorForIbc2012Based",
            "WindLoadImportanceFactorForCanada",
            "WindLoadImportanceFactorForIbc2012Based",
            "WindLoadImportanceFactorForNonIbc2012Based",
            "SeismicImportanceLoadFactorForNonIbc2012Based",
            "SnowLoadImportanceFactorForCanada",
            "SnowLoadImportanceFactor"
        FROM "Occupancies" o , "Collaterals" c
        WHERE c."Occupancy" = o."Name" and "BuildingNumber" = BuildingId;
            
    OPEN  Output_BracingData  FOR
        SELECT
            "SW1Tiers",
            "SW2Tiers",
            "EW3Tiers",
            "EW4Tiers",
            "EW4Tiers",
            "RoofBracingLocations" as "RoofTiers"
        FROM "Bracing"
        WHERE "BuildingNumber" = BuildingId;
        
    OPEN  Output_DeflectionsData  FOR
        SELECT
            "PurlinsLive" as "ExtensionPurlinLiveDeflection",
            "PurlinsSnow" as "ExtensionPurlinWindDeflection",
            "WallCol" as "EndwallColumnDeflection",
            "RaftersLive" as "EndwallRafterLiveDeflection",
            "RaftersWind" as "EndwallRafterWindDeflection",
            "WallGirts" as "WallGirtDeflection",
            "WallPanel" as "WallPanelDeflection",
            "RoofPanelLive" as "RoofPanelLiveDeflection",
            "RoofPanelWind" as "RoofPanelWindDeflection",
            "FrameWind" as "WindFramingWindDeflection",
            "FrameCrane" as "MainFrameCraneDeflection",
            "FrameTotalSeismic" as "MainFrameSeismicDeflection",
            "FrameSeismic" as "WindFramingSeismicDeflection",
            "RoofLive" as "RoofPurlinLiveDeflection",
            "RoofWind" as "RoofPurlinWindDeflection"
        FROM "Deflections"
        WHERE "BuildingNumber" = BuildingId;
        
    OPEN  Output_Input_RoofData  FOR
        SELECT
            CASE WHEN "Type" = 'Double-Lok' OR "Type" = 'Ultra-Dek' THEN 'Y' ELSE 'N' END as "IsStandingSeam"
        FROM "Input_Roof"
        WHERE "BuildingInformationId" = BuildingId;
        
    OPEN  Output_Accessories_DBCIDoorData FOR
        SELECT
            "DoorSeries" as "DbciDoorSeries",
            "Width"
        FROM "Accessories_DBCIDoor"
        WHERE "BuildingId" = BuildingId;
        
    OPEN  Output_Input_BaysData FOR
        SELECT
            "Elevation",
            "BayNumber",
            "Width"
        FROM "Input_Bays"
        WHERE "BuildingInformationId" = BuildingId;
        
END MBS_PRICING;
/