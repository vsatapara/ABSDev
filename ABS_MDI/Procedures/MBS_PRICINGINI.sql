CREATE OR REPLACE PROCEDURE abs_mdi."MBS_PRICINGINI" (
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
    Output_Input_BaysData OUT SYS_REFCURSOR,
    Output_DiaphragmActionData OUT SYS_REFCURSOR,
    Output_SystemVariableData OUT SYS_REFCURSOR,
    Output_EndwallNo1 OUT SYS_REFCURSOR,
    Output_EndwallNo2 OUT SYS_REFCURSOR,
    Output_Company OUT SYS_REFCURSOR,
    Output_Trim OUT SYS_REFCURSOR,
    Output_Wall OUT SYS_REFCURSOR,
    OUTPUT_TRIMCOLORSELECTIONS out SYS_REFCURSOR,
    Output_Accessories_Window OUT SYS_REFCURSOR,
    Output_Accessories_Louvers OUT SYS_REFCURSOR,
    Output_Accessories_WalkDoor OUT SYS_REFCURSOR,
    Output_Accessories_FramedOpening OUT SYS_REFCURSOR,
    Output_Accessories_Canopy OUT SYS_REFCURSOR,
    Output_Accessories_Wainscot OUT SYS_REFCURSOR,
    Output_Accessories_PurlinExtension OUT SYS_REFCURSOR,
    Output_Accessories_Liners OUT SYS_REFCURSOR,
     OUTPUT_GIRTSBAYSPACING  OUT  SYS_REFCURSOR,
    OUTPUT_GIRTSBAYSPACING_ROOF           OUT  SYS_REFCURSOR,
    OUTPUT_GIRTSBAYSPACING_GIRT           OUT  SYS_REFCURSOR,
    OUTPUT_GIRTSBAYSPACING_GIRTSPECIFIED  OUT  SYS_REFCURSOR,
    OUTPUT_GIRTSBAYSPACING_WALL           OUT  SYS_REFCURSOR,
    OUTPUT_GIRTSBAYSPACING_PURLIN         OUT  SYS_REFCURSOR,
    OUTPUT_ENDWALL_COLSPACING             OUT  SYS_REFCURSOR,
    Output_Partition_Data               OUT  SYS_REFCURSOR,
    Output_PartitionModuleSpacing_Data  OUT  SYS_REFCURSOR,
    RoofLinear_Data OUT SYS_REFCURSOR,
    WallLinear_Data OUT SYS_REFCURSOR,
    WallLTP_Data  OUT SYS_REFCURSOR,
    RoofLTP_Data OUT SYS_REFCURSOR,
    Output_Accessories_Vents OUT SYS_REFCURSOR,
    Output_Accessories_Insulation OUT SYS_REFCURSOR,
    Output_RubberPipeFlash_Data OUT SYS_REFCURSOR,
    Purchaser_Data OUT SYS_REFCURSOR,
    Address_Data OUT SYS_REFCURSOR,
    Shipping_Data OUT SYS_REFCURSOR,
    OUTPUT_FRAME_GROUP                    OUT  SYS_REFCURSOR,
    OUTPUT_FRAME_LINE                     OUT  SYS_REFCURSOR,
    OUTPUT_FRAME_MODULE                   OUT  SYS_REFCURSOR,
    OUTPUT_FRAME_INTERIORCOLUMN           OUT  SYS_REFCURSOR,
    Output_Customer OUT SYS_REFCURSOR,
    Output_EndWall OUT SYS_REFCURSOR,
    Output_ShopCoat OUT SYS_REFCURSOR
    
) AS 
CategoryName VARCHAR2(40);
WindExposureId NUMBER;
SnowExposureId NUMBER;
BEGIN
 MBSACCESSORIESGUID_CREATE(BuildingId,ProjectId);
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
             P."CreatedBy",
             P."Latitude",
             P."Longitude",
             P."ProjectName",
             P."RainIntensity",
             P."ExpiryDate",
             P."State"
            FROM 
            "Project" P , "CLM_SiteClasses" S
            WHERE "ProjectId" = ProjectId and S."SiteClassId" = P."SiteClassId";
            
    OPEN  Output_DiaphragmActionData  FOR
        SELECT
            d."IsGeoRegionExclude" as "IsDiaphragmActionAllowedAndVisible"
        FROM "DiaphragmActionExclusions" d , "Project" p
        WHERE "ProjectId" = ProjectId and d."CompanyId" = p."CompanyId" ;
            
    SELECT "WindExposureId","SnowExposureId" INTO WindExposureId,SnowExposureId FROM "Project" WHERE "ProjectId" = ProjectId ;
    
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
            "FrameType",
            "BuildingName",
            "Elevation",
            "HighSideWallElevation"
        FROM "BuildingInformation"
        WHERE "BuildingInformationId" = BuildingId AND NVL("IsDelete", 'N') = 'N';
        
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
            "RoofBracingType",
            "SW1BracingLocations",
            "SW2BracingLocations",
            "EW3BracingLocations",
            "EW4BracingLocations",
            "RoofBracingLocations" as "RoofTiers",    
            "SW1BracingType",
            "SW2BracingType",
            "EW3BracingType",
            "EW4BracingType",
            CASE WHEN "SW1BracingLocations" is null THEN TO_CHAR(0) ELSE TO_CHAR(LENGTH("SW1BracingLocations")-LENGTH(REPLACE("SW1BracingLocations",',',''))+1) END AS SW1BracingLocationCount,
            CASE WHEN "SW2BracingLocations" is null THEN TO_CHAR(0) ELSE TO_CHAR(LENGTH("SW2BracingLocations")-LENGTH(REPLACE("SW2BracingLocations",',',''))+1) END AS SW2BracingLocationCount,
            CASE WHEN "EW3BracingLocations" is null THEN TO_CHAR(0) ELSE TO_CHAR(LENGTH("EW3BracingLocations")-LENGTH(REPLACE("EW3BracingLocations",',',''))+1) END AS EW3BracingLocationCount,
            CASE WHEN "EW4BracingLocations" is null THEN TO_CHAR(0) ELSE TO_CHAR(LENGTH("EW4BracingLocations")-LENGTH(REPLACE("EW4BracingLocations",',',''))+1) END AS EW4BracingLocationCount,
             CASE WHEN "RoofBracingLocations" is null THEN TO_CHAR(0) ELSE TO_CHAR(LENGTH("RoofBracingLocations")-LENGTH(REPLACE("RoofBracingLocations",',',''))+1) END AS RoofBracingLocationCount                      
        FROM "Bracing"
        WHERE "BuildingNumber" = BuildingId AND NVL("IsDelete", 'N') = 'N';
        
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
            "RoofWind" as "RoofPurlinWindDeflection",
            "WallCol",
            "RaftersLive" as "ExtensionBeamLiveDeflection",
            "RaftersWind" as "ExtensionBeamWindDeflection",
            "RaftersLive" as "FacadeMansardArmDeflection",
            "WallPanel" as "FacadeMansardPanelDeflection",
            "WallGirts" as "FacadeMansardGirtDeflection",
            "FrameLive" as "MainFrameHorizontalDeflection",
            "RaftersLive" as "MainFrameVerticalDeflection"
        FROM "Deflections"
        WHERE "BuildingNumber" = BuildingId AND NVL("IsDeleted", 'N') = 'N';
        
    OPEN  Output_Input_RoofData  FOR
        SELECT
            CASE WHEN "Type" = 'Double-Lok' OR "Type" = 'Ultra-Dek' THEN 'Y' ELSE 'N' END as "IsStandingSeam",
            "Type",
            "Clip",
            "FastenerLength",
            "FastenerHeadFinish",
            "Gauge",
            "EaveIcing",
            "ULRating"
        FROM "Input_Roof"
        WHERE "BuildingInformationId" = BuildingId;
        
 OPEN  Output_Trim For
 SELECT
            "SW1Drops",
            "SW2Drops",
            "SW1TrimOption",
            "SW2TrimOption",
            "TrimProfile",
            "SW1NorthernGutter"
        FROM "Input_Trim"
        WHERE "BuildingNumber" = BuildingId AND NVL("IsDelete", 'N') = 'N';
        
    OPEN  Output_Accessories_DBCIDoorData FOR
  SELECT
            a."DoorSeries" as "DbciDoorSeries",
            a."Width",
            a."BayNumber",
    a."Quantity",
    a."Elevation",
    a."DistFromLeftCorner",
    a."DistFromLeftCol",
    a."DoorSize",
    a."DoorColor",
    a."Width",
    a."Heigth",
    a."ResistWind",
    a."Insulated",
    a."LockType",
    a."LocateInLiner",
    a."Seal",
    a."OperatorType",
    a."RemoteTransmitter",
    a."Hood",
   a."Weigth",
    a."Price",
    a."IsPriced",
    a."LeftSteelLine",
    a."PartitionNumber",
    a."DistFromFloor",
    a."CoverTrim",
    a."ColorValsparCode",
    a."ColorSpecialName",
    a."PreGalvanizedFraming",
    a."ClipAttachment",
    a."IpAddress",
    a."IsDelete",
    a."CreatedBy",
    a."CreatedDate",
    a."ModifiedBy",
    a."ModifiedDate",
    a."TrimColor",
   a."Type",
   a."TrimColorValsparCode",
    a."TrimColorSpecialName",
    a."SillHeight",
    a."ErrorCode",
    m."AccessoriesGuid"
        FROM "Accessories_DBCIDoor" a
        JOIN "MBSAccessoriesGuid" m
        ON a."DbciDoorId" = m."AccessoriesId"
        WHERE a."BuildingId" = BuildingId AND  a."ProjectId"=ProjectId AND NVL("IsDelete", 'N') = 'N' AND  m."AccessoriesName"='AccessoriesDBCIdoor' ;
        
    OPEN  Output_Input_BaysData FOR
        SELECT
            "Elevation",
            "BayNumber",
            "Width"
        FROM "Input_Bays"
        WHERE "BuildingInformationId" = BuildingId;
        
   OPEN  Output_SystemVariableData  FOR
        SELECT
       "DefaultPurlinPeakSpace",
            "DefaultPurlinMaxSpace",
            "DefaultPurlinGirtLocation",
            "DefaultPurlinLowGirtLocation",
            "DefaultBearingFrameSetback",
            "DefaultMainFrameSetback"
         FROM "BuildingQuoteVariable";
         
  OPEN Output_EndwallNo1 FOR
       SELECT COUNT(*) AS "BayNo"
FROM  "Input_Endwalls_ColumnSpacing" C2
        JOIN "Input_Endwall" C1 ON C1."EndWallID" = C2."EndWallID"
         WHERE
       C1."BuildingNo" = BuildingId AND C1."EndWallNo"=1
         AND NVL(C2."IsDeleted", 'N') = 'N' AND  NVL(C1."IsDeleted", 'N') = 'N'
        ORDER BY
            C1."EndWallNo",
            C2."CSID";
            
     OPEN Output_EndwallNo2 FOR
       SELECT COUNT(*) AS "BayNo"
FROM  "Input_Endwalls_ColumnSpacing" C2
        JOIN "Input_Endwall" C1 ON C1."EndWallID" = C2."EndWallID"
         WHERE
       C1."BuildingNo" = BuildingId AND C1."EndWallNo"=2
         AND NVL(C2."IsDeleted", 'N') = 'N' AND  NVL(C1."IsDeleted", 'N') = 'N'
        ORDER BY
            C1."EndWallNo",
            C2."CSID";         
 OPEN OUTPUT_GIRTSBAYSPACING FOR SELECT
                                      BaySpacing."SW1Style",c1."StyleName",
                                        BaySpacing."GirtSpacingId",
                                       BaySpacing."BuildingInformationId",
                                       BaySpacing."SW1Style",
                                       BaySpacing."SW2Style",
                                       BaySpacing."EW1Style",
                                       BaySpacing."EW2Style",
                                       BaySpacing."RoofPurlinStyle",
                                       BaySpacing."SW1Depth",
                                       BaySpacing."SW2Depth",
                                       BaySpacing."EW1Depth",
                                       BaySpacing."EW2Depth",
                                       BaySpacing."RoofPurlinDepth",
                                       BaySpacing."SW1Optimize",
                                       BaySpacing."SW2Optimize",
                                       BaySpacing."EW1Optimize",
                                       BaySpacing."EW2Optimize",
                                       BaySpacing."RoofPurlinOptimize",
                                       BaySpacing."RoofBaySpacing",
                                       BaySpacing."WallBaySpacing",
                                       BaySpacing."GirtSpacing",
                                       BaySpacing."PurlinSpacing",
                                       BaySpacing."LBPMinDepth",
                                       BaySpacing."LBPMaxDepth"
                                   FROM
                                            "Input_GirtsBaySpacing" BaySpacing
                                       inner join "GirtsAndPurlinStyle" c1
                                       on BaySpacing."SW1Style" = c1."StyleId" 
                                   WHERE
                                           BaySpacing."BuildingInformationId" = BuildingId
                                       AND BaySpacing."IsDelete" != 'Y';
                                           OPEN OUTPUT_GIRTSBAYSPACING_ROOF FOR SELECT
                                            Roof."RoofBaySpaceId",
                                            Roof."BuildingInformationId",
                                            Roof."Elevation",
                                            Roof."BayNumber",
                                            Roof."Width"
                                        FROM
                                                 "Input_Bays" Roof
                                            JOIN "BuildingInformation" Info ON Roof."BuildingInformationId" = Info."BuildingInformationId"
                                        WHERE
                                                Roof."BuildingInformationId" = BuildingId
                                            AND Info."ProjectId" = ProjectId
                                        ORDER BY
                                            Roof."Elevation",
                                            Roof."BayNumber";
    OPEN OUTPUT_GIRTSBAYSPACING_GIRT FOR SELECT
                                            Girt."GirtBaySpaceId",
                                            Girt."GirtSpacingId",
                                            Girt."SW1Type",
                                            Girt."SW2Type",
                                            Girt."EW1Type",
                                            Girt."EW2Type"
                                        FROM
                                                 "Input_GirtsBaySpacing_Girt" Girt
                                            JOIN "Input_GirtsBaySpacing"  BaySpacing ON Girt."GirtSpacingId" = BaySpacing."GirtSpacingId"
                                            JOIN "BuildingInformation"    Info ON BaySpacing."BuildingInformationId" = Info."BuildingInformationId"
                                        WHERE
                                                BaySpacing."BuildingInformationId" = BuildingId
                                            AND Info."ProjectId" = ProjectId AND NVL(BaySpacing."IsDelete", 'N') = 'N';
    OPEN OUTPUT_GIRTSBAYSPACING_GIRTSPECIFIED FOR SELECT
                                                     GirtSpecified."GirtSpecifiedId",
                                                     GirtSpecified."GirtBaySpaceId",
                                                     GirtSpecified."Elevation",
                                                     GirtSpecified."SpacingNumber",
                                                     GirtSpecified."Spacing",
                                                     GirtSpecified."Type"
                                                 FROM
                                                          "Input_GirtsBaySpacing" BaySpacing
                                                     JOIN "BuildingInformation"                  Info ON BaySpacing."BuildingInformationId" = Info.
                                                     "BuildingInformationId"
                                                     JOIN "Input_GirtsBaySpacing_Girt"           Girt ON BaySpacing."GirtSpacingId" = Girt."GirtSpacingId"
                                                     JOIN "Input_GirtsBaySpacing_GirtSpecified"  GirtSpecified ON Girt."GirtBaySpaceId" =
                                                     GirtSpecified."GirtBaySpaceId"
                                                 WHERE
                                                         BaySpacing."BuildingInformationId" = BuildingId
                                                     AND Info."ProjectId" = ProjectId
                                                 ORDER BY
                                                     GirtSpecified."Type",
                                                     GirtSpecified."SpacingNumber";
    OPEN OUTPUT_GIRTSBAYSPACING_WALL FOR SELECT
                                            Wall."WallBaySpaceId",
                                            Wall."GirtSpacingId",
                                            Wall."Elevation",
                                            Wall."RoofBayNumber",
                                            Wall."DistFromLeftColumn",
                                            Wall."BaseRecess",
                                            Wall."RoofBayWidth"
                                        FROM
                                                 "Input_GirtsBaySpacing_Wall" Wall
                                            JOIN "Input_GirtsBaySpacing"  BaySpacing ON Wall."GirtSpacingId" = BaySpacing."GirtSpacingId"
                                            JOIN "BuildingInformation"    Info ON BaySpacing."BuildingInformationId" = Info."BuildingInformationId"
                                        WHERE
                                                BaySpacing."BuildingInformationId" = BuildingId
                                            AND Info."ProjectId" = ProjectId
                                        ORDER BY
                                            Wall."Elevation",
                                            Wall."Sequence";
    OPEN OUTPUT_GIRTSBAYSPACING_PURLIN FOR SELECT
                                              Purlin."PurlinBaySpaceId",
                                              Purlin."GirtSpacingId",
                                              Purlin."NominalSpacing",
                                              Purlin."OnSlope"
                                          FROM
                                                   "Input_GirtsBaySpacing_Purlin" Purlin
                                              JOIN "Input_GirtsBaySpacing"  BaySpacing ON Purlin."GirtSpacingId" = BaySpacing."GirtSpacingId"
                                              JOIN "BuildingInformation"    Info ON BaySpacing."BuildingInformationId" = Info."BuildingInformationId"
                                          WHERE
                                                  BaySpacing."BuildingInformationId" = BuildingId
                                              AND Info."ProjectId" = ProjectId;
                                       
OPEN Output_Company FOR SELECT
            c."IsQuickQuoteAvailable"
        FROM "Company" c , "Project" p
        WHERE "ProjectId" = ProjectId and c."CompanyId" = p."CompanyId" AND NVL(c."IsDelete", 'N') = 'N';  
OPEN Output_Wall FOR SELECT
                            Wall."WallId",
                            Wall."BuildingInformationId",
                            Wall."Type",
                            Wall."Gauge",
                            Wall."Thick",
                            Wall."BaseFraming",
                            Wall."BaseFlash",
                            Wall."BaseClosure",
                            Wall."SealedWall",
                            Wall."Washers",
                            Wall."Notch",
                            Wall."RakeClosure",
                            Wall."EaveClosureStrip",
                            Wall."FastenerType",
                            Wall."FastenerHeadFinish",
                            Wall."FastenerLength",
                            Wall."Warranty",
                            Wall."FactoryAppliedSealant",
                            Wall."ReverseRolled",
                            Wall."OutsideMetalClosure",
                            Wall."SidelapSealant",
                            Wall."FoamTape",
                            Wall."ColdStorageBuilding",
                            Wall."ExteriorSkinProfile",
                            Wall."ExteriorSkinTexture",
                            Wall."InteriorSkinProfile",
                            Wall."InteriorSkinTexture",
                            Wall."InteriorSkinGauge",
                            Wall."Width",
                            Wall."NotchWidth",
                            Wall."NotchDepth",
                            Wall."NotchType",
                            ColorSel."WallPanel",
                            ColorSel."WallPanelValsparCode",
                            ColorSel."WallPanelSpecialName",
                            ColorSel."WallPanelText",
                            ColorSel."WallPanelHashCode",
                            ColorSel."WallInteriorSkin",
                            ColorSel."WallInteriorSkinValsparCode",
                            ColorSel."WallInteriorSkinSpecialName",
                            ColorSel."WallInteriorText",
                            ColorSel."WallInteriorHashCode",
                            Wall."RValue",
                            Wall."UValue",
                            PanelType."Type"             "TypeName",
                            PanelDropdown."Value"        "BaseFramingName",
                            BaseFlashDropdown."Value"    "BaseFlashName",
                            GaugeDropdown."Value"        "GaugeValue",
                            FastenerDropdown."Value"      "FastenerTypeLength",
                            FastenerTypeValue."Value"      "FastenerTypeValue",
                            FastenerHeadValue."Value"      "FastenerHeadValue",
                            BaseClosureDropdown."Value"    "BaseClosureName" 
                        FROM
                                 "Input_Wall" Wall
                            JOIN "M_PanelType"                PanelType ON Wall."Type" = PanelType."Id"
                             JOIN "Input_TrimColorSelections"  ColorSel ON Wall."BuildingInformationId" = ColorSel."BuildingNumber"
                            LEFT JOIN "M_Panel_Dropdown"      PanelDropdown ON Wall."BaseFraming" = PanelDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"      BaseFlashDropdown ON Wall."BaseFlash" = BaseFlashDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"      BaseClosureDropdown ON Wall."BaseClosure" = BaseClosureDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"      GaugeDropdown ON Wall."Gauge" = GaugeDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"      FastenerDropdown ON Wall."FastenerLength" = FastenerDropdown."Id"
                             LEFT JOIN "M_Panel_Dropdown"      FastenerTypeValue ON Wall."FastenerType" = FastenerTypeValue."Id"
                             LEFT JOIN "M_Panel_Dropdown"      FastenerHeadValue ON Wall."FastenerHeadFinish" = FastenerHeadValue."Id"
                        WHERE
                                Wall."BuildingInformationId" = BuildingId
                            AND Wall."IsDelete" != 'Y';
              
 OPEN OUTPUT_TRIMCOLORSELECTIONS FOR SELECT
                                           "WallPanel",
                                           "EaveFlashColor",
                                           "CornerFlashColor",
                                           "GableFlashColor",
                                           "BaseFlashColor",
                                           "RoofPanel",
                                           "GuttersColor",
                                           "DownspoutsColor"
                                       FROM
                                           "Input_TrimColorSelections"
                                       WHERE
                                               "BuildingNumber" = BuildingId
                                           AND NVL("IsDelete", 'N') = 'N'; 
OPEN Output_Accessories_Window FOR SELECT
 w."WindowId",
     w."BuildingNumber",
     w."Quantity",
     w."Elevation",
     w."BayNumber",
     w."Type",
     w."SillHeight",
     w."HeaderHeight",
     w."Width",
     w."DistFromLeftCorner",
     w."DistFromLeftCol",
     w."TrimColor",
     w."WindowColor",
     w."SubFraming",
     w."GlassType",
     w."Quality",
     w."IsBuyout",
     w."Weight",
     w."Price",
     w."IsPriced",
     w."ErrorCode",
     w."InsulatedGlass",
     w."FrameFinish",
     w."LocatedInLiner",
     w."LeftSteelLine",
     w."PartitionNumber",
     w."WindowCategory",
     w."InsulationRetainerKit",
     w."CWindowRating",
     w."WindowSize",
     w."BracedBay",
     w."IsDelete",
     w."CreatedBy",
     w."CreatedDate",
     w."ModifiedBy",
     w."ModifiedDate",
     w."IpAddress",
     w."ProjectId",
     w."IncludeFramedOpening",
    w."IsLocate",
    m."AccessoriesGuid"
FROM
    "Accesories_Windows" w
      JOIN "MBSAccessoriesGuid" m
    ON w."WindowId" = m."AccessoriesId"
     WHERE
     w."BuildingNumber" = BuildingId  AND  m."AccessoriesName"='AccessoriesWindows' AND  w."ProjectId"=ProjectId
     AND w."IncludeFramedOpening" != 'N'AND NVL(w."IsDelete", 'N') = 'N';
    
OPEN Output_Accessories_Louvers FOR    SELECT
    l."LouverId",
    l."ProjectId",
    l."BuildingId",
    l."Quantity",
    l."Elevation",
    l."BayNumber",
    l."SillHeight",
    l."HeaderHeight",
    l."Width",
    l."DistFromLeftCorner",
    l."DistFromLeftCol",
    l."TrimColor",
    l."LouverColor",
    l."SubFraming",
    l."Type",
    l."LouverSize",
    l."LocatedInLiner",
    l."IncludeFramedOpening",
    l."RunOfLouvers",
    l."PartitionNumber",
    l."BracedBay",
    l."LouverColorValsparCode",
    l."LouverColorSpecialName",
    l."IpAddress",
    l."IsDelete",
    l."CreatedBy",
    l."CreatedDate",
    l."ModifiedBy",
    l."ModifiedDate",
    l."TrimColorValsparCode",
    l."TrimColorSpecialName",
    l."Quality",
    l."WallExhausterPowerSource",
    l."LouverWeight",
    l."LouverPrice",
    l."WallExhausterWeight",
    l."WallExhausterPrice",
    l."LouverIsPriced",
    l."LouverErrorCode",
    l."WallExhausterIsPriced",
    l."WallExhausterErrorCode",
     m."AccessoriesGuid"
FROM
    "Accessories_Louvers" l
     JOIN "MBSAccessoriesGuid" m
    ON l."LouverId" = m."AccessoriesId"
WHERE   l."BuildingId" = BuildingId AND l."ProjectId"=ProjectId AND  m."AccessoriesName"='AccessoriesLouvers' AND NVL(l."IsDelete", 'N') = 'N';
    
OPEN Output_Accessories_WalkDoor FOR   SELECT    
    w."WalkDoorId",
    w."ProjectId",
    w."BuildingId",
    w."Quantity",
    w."Elevation",
    w."BayNumber",
    w."Type",
    w."HeaderHeight",
    w."Width",
    w."DistFromLeftCorner",
    w."DistFromLeftCol",
    w."TrimColor",
    w."DoorColor",
    w."SwingDirection",
    w."LatchGuard",
    w."SubFraming",
    w."Skin",
    w."Lite",
    w."Closer",
    w."Locktype",
    w."Quality",
    w."LeafType",
    w."StyleSet",
    w."IsBuyout",
    w."Weight",
    w."Price",
    w."IsPriced",
    w."ErrorCode",
    w."KnockDown",
    w."Style",
    w."WindRated",
    w."Size",
    w."KeyedAlike",
    w."PanicHardware",
    w."ChainStop",
    w."Insulated",
    w."FloridaApproval",
    w."LocatedInLiner",
    w."Glazing",
    w."KickPlate",
    w."LeftSteelLine",
    w."PartitionNumber",
    w."LocateRightSideBay",
    w."DistanceFromFloor",
    w."DadeBrowardApproved",
    w."SsbHinges",
    w."AddAnchors",
    w."LeafInsulated",
    w."LeafsBothActive",
    w."Alabel3hour",
    w."AdaCompliant",
    w."AdditionalAnchorsQty",
    w."TrimColorValsparCode",
    w."TrimColorSpecialName",
    w."CreatedBy",
    w."CreatedDate",
    w."ModifiedBy",
    w."ModifiedDate",
    w."IpAddress",
    w."IsDelete",
    w."Gauge",
    w."FireRated",
    w."InterChangeableLockKit",
    w."ExistingOpeningMasonryAnchor",
    w."InActiveLeaf",
    w."WireMasonryAnchor",
    w."Masonry",
    w."AnodizedFrame",
    w."DoorGlass",
    w."Glass",
    w."Closure",
    w."MasonaryApplication",
    w."BottomRail",
    w."IsLocate",
    w."LocateLeftSideBay",
    m."AccessoriesGuid"
FROM
    "Accessories_WalkDoors"  w
    JOIN "MBSAccessoriesGuid" m
    ON w."WalkDoorId" = m."AccessoriesId"
 WHERE   w."BuildingId" = BuildingId AND  w."ProjectId"=ProjectId  AND  m."AccessoriesName"='AccessoriesWalkdoor' AND NVL(w."IsDelete", 'N') = 'N';
 
 
OPEN Output_Accessories_FramedOpening FOR    SELECT    
     f."FramedOpeningId",
     f."BuildingNumber",
     f."ProjectId",
     f."Elevation",
     f."BayNumber",
     f."Material",
     f."Type",
     f."Width",
     f."Height",
     f."DistFromLeftCorner",
     f."DistFromLeftCol",
     f."SillHeight",
     f."HeaderHeight",
     f."HeaderType",
     f."JambType",
     f."CeeDepth",
     f."InsideFlangeWidth",
     f."InsideFlangeThick",
     f."OutsideFlangeWidth",
     f."OutsideFlangeThick",
     f."WebDepth",
     f."WebThick",
     f."DoubleJambs",
     f."FourSided",
     f."TrimOnly",
     f."PanelCredit",
     f."Clearance",
     f."Weight",
     f."Price",
     f."IsPriced",
     f."ErrorCode",
     f."ClosureTrim",
     f."ClosureTrimSize",
     f."ClosureTrimColor",
     f."ClosureTrimColorValsparCode",
     f."ClosureTrimColorSpecialName",
     f."DoNotCutGirts",
     f."OverheadDoor",
     f."Quantity",
     f."PreGalvanizedFraming",
     f."FullCoverHeadTrim",
     f."DoubleHeader",
     f."DoNotCutPanel",
     f."LocatedInLiner",
     f."LeftSteelLine",
     f."PartitionNumber",
     f."ClipAttachment",
     f."BracingBay",
     f."CreatedBy",
     f."CreatedDate",
     f."ModifiedBy",
     f."ModifiedDate",
     f."IsDelete",
    f."IpAddress",
     m."AccessoriesGuid"
FROM
    "Accessories_FramedOpening" f
     JOIN "MBSAccessoriesGuid" m
    ON f."FramedOpeningId" = m."AccessoriesId"
    WHERE   f."BuildingNumber" = BuildingId AND   m."AccessoriesName"='AccessoriesFramedOpening' AND f."ProjectId"=ProjectId AND NVL(f."IsDelete", 'N') = 'N';
     
 OPEN Output_Accessories_Canopy FOR    SELECT
    "AccessoriesCanopyId",
    "BuildingNumber",
    "Select_Elevation",
    "StartColumn",
    "StopColumn",
    "CanopyType",
    "Projection",
    "Slope",
    "Panel",
    "SoffitPanelColor",
    "SoffitGaudge",
    "ReturnDownspouts",
    "Gutter",
    "RoofTieTrimColor",
    "CanopyCornerTrimColor",
    "CanopySillCapTrimColor",
    "SoffitTrimColor",
    "SoffitPanelType",
    "CanopyPanelColor",
    "CanopyPanelGauge",
    "CanopySSClipType",
    "ThermalBlockType",
    "ExtendRoofInsulation",
    "GutterType",
    "GutterSize",
    "DownspoutDrops",
    "IncludeElbow",
    "DownspoutHeight",
    "GutterColor",
    "DownspoutColor",
    "SoffitFramingClearance",
    "HasSnowRetentionSystem",
    "IncludeSnowClipPerPanel",
    "SnowClipQuantity",
    "ColorStripQuantity",
    "RoofPanelType",
    "ReverseRollSoffit",
    "ReverseRollFace",
    "DistFromLeftCorner",
    "Length",
    "HeightLocation",
    "SoffitPanel",
    "SoffitTrim",
    "AtEave",
    "PanelFinish",
    "CanopyFacingSpecial",
    "CanopyFacingWeight",
    "CanopyFacingDeflection",
    "SoffitFacingSpecial",
    "SoffitFacingWeight",
    "SoffitFacingDeflection",
    "Price",
    "Weight",
    "ErrorCode",
    "PriceMBCI",
    "WeightMBCI",
    "DesignIndex",
    "MainBuildingGutter",
    "RoofSquareFeet",
    "WallSquareFeet",
    "SoffitSquareFeet",
    "HeightOfFace",
    "SoffitPanelColorValsparCode",
    "SoffitPanelColorSpecialName",
    "RoofTieTrimColorValsparCode",
    "RoofTieTrimColorSpecialName",
    "CanopyCornerTrimColorValsparCode",
    "CanopyCornerTrimColorSpecialName",
    "CanopySillTrimColorValsparCode",
    "CanopySillTrimColorSpecialName",
    "SoffitTrimColorValsparCode",
    "SoffitTrimColorSpecialName",
    "PanelColorValsparCode",
    "PanelColorSpecialName",
    "GutterColorValsparCode",
    "GutterColorSpecialName",
    "DownspoutColorValsparCode",
    "DownspoutColorSpecialName",
    "IncludeSagAngles",
    "SnowLoad",
    "CreatedDate",
    "CreatedBy",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDelete",
    "ProjectId",
    "SoffitPanelColorValsparText",
    "SoffitPanelColorValsparHashCode",
    "RoofTieTrimColorValsparText",
    "RoofTieTrimColorValsparHashCode",
    "CanopyCornerTrimColorValsparText",
    "CanopyCornerTrimColorValsparHashCode",
    "CanopySillCapTrimColorValsparText",
    "CanopySillCapTrimColorValsparHashCode",
    "SoffitTrimColorValsparText",
    "SoffitTrimColorValsparHashCode",
    "PanelColorValsparText",
    "PanelColorValsparHashCode",
    "GutterColorValsparText",
    "GutterColorValsparHashCode",
    "DownspoutColorValsparText",
    "DownspoutColorValsparHashCode"
FROM
    "Accessories_Canopy"
     WHERE   "BuildingNumber" = BuildingId and "IsValid" = 1 AND NVL("IsDelete", 'N') = 'N';
     
 OPEN Output_Accessories_Wainscot FOR  SELECT
        W."PanelTypeId",
        W."PanelThicknessId",
        W."FromColumn",
        W."Qty",
        W."Hieght",
        W."ToColumn",
        W."TransitionStyleId",
        W."Elevation",
        W."TransitionTrimColorId",
        W."PanelColorId",
        PT."Type" as PanelTypeName,
        PD."Value" as PanelThicknessValue
        From 
        "Accesories_Wainscot" W
        LEFT join "M_PanelType" PT
        on W."PanelTypeId"=PT."Id"
        LEFT JOIN "M_Panel_Dropdown" PD
        on  W."PanelThicknessId"=PD."Id"
        where
        W."BuildingInformationId"=BuildingId AND NVL(W."IsDelete", 'N') = 'N';
        
OPEN  Output_Accessories_PurlinExtension FOR SELECT
    "PurlinExtensionId",
    "ProjectId",
    "BuildingNumber",
    "Elevation",
    "DistanceFromLeftCorner",
    "StartCol",
    "StopCol",
    "Projection",
    "BuildingWidth",
    "SoffitPanelType",
    "SoffitPanelGauge",
    "SoffitPanelColor",
    "SoffitPanelColorSpecialName",
    "SoffitPanelColorValsparCode",
    "SoffitTrimColor",
    "SoffitTrimColorSpecialName",
    "SoffitTrimColorSpecialCode",
    "IsInsulated",
    "SoffixFacingSpecial",
    "ReverseRollSoffit",
    "SoffitFacingWeight",
    "SoffitFacingDeflection",
    "IsDelete"
FROM
    "Accesories_PurlinExtensions"
    WHERE "BuildingNumber" = BuildingId AND NVL("IsDelete", 'N') = 'N'; 
    
    
  OPEN  Output_Accessories_Liners FOR SELECT  L."LinerId" AS "RoofLinerId",
                                 T."ItemText" LinearCoverage,
                                 L."StartColumn",
                                 L."StopColumn",
                                 L."XFrom",
                                 L."XTo",
                                 L."YFrom",
                                 L."YTo",
                                 P."Type" PanelType,
                                 PM."Value" PanelGauge,
                                 L."ReverseRoll",
                                 L."PanelColor",
                                 L."PanelColorValsparCode",
                                 L."PanelColorSpecialName",
                                 L."RidgeTrimGauge",
                                 L."RafterTieTrimGauge",
                                 L."EaveToWallTrimGauge",
                                 L."RidgeTrimColor",
                                 L."RidgeTrimColorSpecialName",
                                 L."RidgeTrimColorValsparCode",
                                 L."EaveToWallTrimColor",
                                 L."EaveToWallTrimColorValsparCode",
                                 L."EaveToWallTrimColorSpecialName",
                                 L."RafterTieTrimColor",
                                 L."RafterTieTrimColorValsparCode",
                                 L."RafterTieTrimColorSpecialName",
                                 PM2."Value" FastenerHeadFinish,
                                 PM1."Value" FastenerLength,
                                 L."Qty"
                         FROM
                             "Accessories_Liners" L
                             JOIN "TableOfTables" T
                             ON L."LinerCoverage"=T."Id"
                            LEFT JOIN "M_PanelType" P
                             ON L."PanelType" = P."Id"
                            LEFT  JOIN "M_Panel_Dropdown" PM
                             ON L."PanelGauge" = PM."Id"
                            LEFT  JOIN "M_Panel_Dropdown" PM1
                             ON L."FastenerLength" = PM1."Id"
                             LEFT JOIN "M_Panel_Dropdown" PM2
                             ON L."FastenerHeadFinish" = PM2."Id"
                         WHERE
                                 L."BuildingNumber" = BuildingId  AND  L."ProjectId"=ProjectId AND NVL(L."IsDelete", 'N') = 'N';      
    
    OPEN OUTPUT_ENDWALL_COLSPACING FOR SELECT
                                          C1."ProjectId",
                                          C1."BuildingNo",
                                          C1."EndWallNo",
                                          C1."EndWallID",
                                          C2."CSType",
                                          C2."BayNo",
                                          C2."BaySpacing",
                                          C2. "IsDeleted",
                                          C2."CSID"
                                      FROM
                                               "Input_Endwalls_ColumnSpacing" C2
                                          JOIN "Input_Endwall" C1 ON C1."EndWallID" = C2."EndWallID"
                                      WHERE
                                              C1."BuildingNo" = BuildingId
                                          AND NVL(C2."IsDeleted", 'N') = 'N' AND  NVL(C1."IsDeleted", 'N') = 'N'
                                      ORDER BY
                                          C1."EndWallNo",
                                          C2."CSID";
     OPEN Output_Partition_Data FOR SELECT
                                P."PartitionId",
                                 P."BuildingNumber",
                                 P."Type",
                                 P."Length",
                                 P."Height",
                                 P."DistFromEndWall",
                                 P."DistFromSideWall",
                                 P."FullHeight",
                                 P."PanelType",
                                 P."Width",
                                 P."Thickness",
                                 P."ReverseRoll",
                                 P."ExteriorProfile",
                                 P."ExteriorGuage",
                                 P."ExteriorTexture",
                                 P."ExteriorColor",
                                 P."ExteriorColorSpecialName",
                                 P."ExteriorColorValsparCode",
                                 P."InteriorProfile",
                                 P."InteriorGuage",
                                 P."InteriorTexture",
                                 P."InteriorColor",
                                 P."InteriorColorSpecialName",
                                 P."InteriorColorValsparCode",
                                 P."FactoryAppliedSealant",
                                 PM3."CategoryValue" SheeterSide,
                                 PM4."CategoryValue" ExteriorWall,
                                 P."RecessFoundation",
                                 P."BaseClosureStrips",
                                 P."PurlinTrimColor",
                                 P."PurlinTrimColorSpecialName",
                                 P."PurlinTrimColorValsparCode",
                                 P."CornerTrimColor",
                                 P."CornerTrimColorSpecialName",
                                 P."CornerTrimColorValsparCode",
                                 P."FramingByOthers",
                                 PM."CategoryValue" BaseCondition,
                                 P."FastenerHeadFinish",
                                 P."FastenerLength",
                                 P."GirtSpacing",
                                 P."ProjectId",
                                 PM1."CategoryValue" GirtDepth,
                                 PM2."CategoryValue" GirtType
                         FROM
                             "Accesories_Partition" P
                             JOIN "Accesories_PartitionMaster" PM
                             ON P."BaseCondition" = PM."OptionId"
                                JOIN "Accesories_PartitionMaster" PM1
                             ON P."GirtDepth" = PM1."OptionId"
                                JOIN "Accesories_PartitionMaster" PM2
                             ON P."GirtType" = PM2."OptionId"
                              JOIN "Accesories_PartitionMaster" PM3
                             ON P."SheeterSide" = PM3."OptionId"
                             JOIN "Accesories_PartitionMaster" PM4
                             ON P."ExteriorWall" = PM4."OptionId"
                         WHERE
                                  P."BuildingNumber" = BuildingId and  P."ProjectId"=ProjectId AND NVL( P."IsDelete", 'N') = 'N' ;
                                 
    OPEN Output_PartitionModuleSpacing_Data FOR SELECT
                                --"ProjectId",
                               "ModuleId",
                            ---   "BuildingInformationId",
                               "PartitionId",
                               "Width",
                               "BayNumber"
                         FROM
                             "Accesories_PartitionModuleSpacing"
                         WHERE
                                 "BuildingNumber" = BuildingId Order by "ModuleId";
   OPEN RoofLinear_Data FOR SELECT  L."LinerId" AS "RoofLinerId",
                                 T."ItemText" LinearCoverage,
                                 L."StartColumn",
                                 L."StopColumn",
                                 L."XFrom",
                                 L."XTo",
                                 L."YFrom",
                                 L."YTo",
                                 P."Type" PanelType,
                                 PM."Value" PanelGauge,
                                 L."ReverseRoll",
                                 L."PanelColor",
                                 L."PanelColorValsparCode",
                                 L."PanelColorSpecialName",
                                 L."RidgeTrimGauge",
                                 L."RafterTieTrimGauge",
                                 L."EaveToWallTrimGauge",
                                 L."RidgeTrimColor",
                                 L."RidgeTrimColorSpecialName",
                                 L."RidgeTrimColorValsparCode",
                                 L."EaveToWallTrimColor",
                                 L."EaveToWallTrimColorValsparCode",
                                 L."EaveToWallTrimColorSpecialName",
                                 L."RafterTieTrimColor",
                                 L."RafterTieTrimColorValsparCode",
                                 L."RafterTieTrimColorSpecialName",
                                 PM2."Value" FastenerHeadFinish,
                                 PM1."Value" FastenerLength,
                                 L."Qty"
                         FROM
                             "Accessories_Liners" L
                             JOIN "TableOfTables" T
                             ON L."LinerCoverage"=T."Id"
                            LEFT JOIN "M_PanelType" P
                             ON L."PanelType" = P."Id"
                            LEFT  JOIN "M_Panel_Dropdown" PM
                             ON L."PanelGauge" = PM."Id"
                            LEFT  JOIN "M_Panel_Dropdown" PM1
                             ON L."FastenerLength" = PM1."Id"
                             LEFT JOIN "M_Panel_Dropdown" PM2
                             ON L."FastenerHeadFinish" = PM2."Id"
                         WHERE
                                 L."BuildingNumber" = BuildingId  AND  L."ProjectId"=ProjectId AND NVL(L."IsDelete", 'N') = 'N';       
                                 
  OPEN WallLinear_Data FOR SELECT  L."LinerId" AS "RoofLinerId",
                                 T."ItemText" LinearCoverage,
                                 L."StartColumn",
                                 L."StopColumn",
                                 L."XFrom",
                                 L."XTo",
                                 L."YFrom",
                                 L."YTo",
                                 P."Type" PanelType,
                                 PM."Value" PanelGauge,
                                 L."ReverseRoll",
                                 L."PanelColor",
                                 L."PanelColorValsparCode",
                                 L."PanelColorSpecialName",
                                 L."RidgeTrimGauge",
                                 L."RafterTieTrimGauge",
                                 L."EaveToWallTrimGauge",
                                 L."RidgeTrimColor",
                                 L."RidgeTrimColorSpecialName",
                                 L."RidgeTrimColorValsparCode",
                                 L."EaveToWallTrimColor",
                                 L."EaveToWallTrimColorValsparCode",
                                 L."EaveToWallTrimColorSpecialName",
                                 L."RafterTieTrimColor",
                                 L."RafterTieTrimColorValsparCode",
                                 L."RafterTieTrimColorSpecialName",
                                 PM2."Value" FastenerHeadFinish,
                                 PM1."Value" FastenerLength,
                                 L."Qty"
                         FROM
                             "Accessories_Liners" L
                             JOIN "TableOfTables" T
                             ON L."LinerCoverage"=T."Id"
                            LEFT JOIN "M_PanelType" P
                             ON L."PanelType" = P."Id"
                            LEFT  JOIN "M_Panel_Dropdown" PM
                             ON L."PanelGauge" = PM."Id"
                            LEFT  JOIN "M_Panel_Dropdown" PM1
                             ON L."FastenerLength" = PM1."Id"
                             LEFT JOIN "M_Panel_Dropdown" PM2
                             ON L."FastenerHeadFinish" = PM2."Id"
                         WHERE
                                 L."BuildingNumber" = BuildingId  AND  L."ProjectId"=ProjectId AND NVL(L."IsDelete", 'N') = 'N';     
     
OPEN WallLTP_Data FOR SELECT
                                "WallLTPId",
                                "BuildingInformationId",
                                "Quantity",
                                "Elevation",
                                aw."Type",
                                "Size",
                                "DistFromLeftCorner",
                                "DistFromLeftCol",
                                "PatternPerBay",
                                "EaveCondition",
                                "Continuous",
                                "TopElevation",
                                --"LTPSize",
                                ws."Id" "LTPSize",
                                "AccessoryConflictOverride",
                                "InsulationTrim",
                                "Length",
                                "PartitionNumber",
                                "ProjectId",
                                "StopValue",
                                "IsLocate"
                       FROM
                             "Accesories_WallLTP" aw JOIN "Accesories_WallLTP_Size" ws ON aw."LTPSize" = ws."Value"
                              JOIN "Accesories_WallLTP_Common" wc ON ws."Id" = wc."SizeId"
                              JOIN "M_PanelType" MPanel ON wc."TypeId" = MPanel."Id"
                         WHERE
                                 "BuildingInformationId" = BuildingId AND  "ProjectId"=ProjectId
                             AND MPanel."Type"=aw."Type"
                             AND "IsDelete" = 'N';
    OPEN RoofLTP_Data FOR SELECT
                             "RoofLTPId",
                             "BuildingNumber",
                             "ProjectId",
                             "Length",
                             "Size",
                             "Location",
                             "IsInsulated",
                             "IsUL90Framing",
                             "Qty"
                         FROM
                             "Accesories_RoofLTP"
                         WHERE
                                "BuildingNumber" = BuildingId AND  "ProjectId"=ProjectId
                             AND "IsDelete" = 'N';      
OPEN Output_Accessories_Vents FOR 
SELECT
    v."Quantity",
    v."RoofVent",
    v."Elevation",
    v."BayNumber",
    v."Color",
    v."Operator",
    v."OperatorWithCable",
    v."Surface",
    v."ExtensionPackage",
    v."TrimCollar",
    v."DistFromLeftCorner",
    v."DistFromLeftCol",
    v."Damper",
    v."IsDelete",
    d."DropDownValue" Operator,
    d1."DropDownValue" SizeValue,
    v."DistFromLeftWall",
    m."AccessoriesGuid"
FROM "Accessories_Vents" v JOIN "Accessories_Vents_DropdownValue" d
ON v."Operator" = d."Id"
JOIN "Accessories_Vents_DropdownValue" d1
ON v."Size" = d1."Id"
JOIN "MBSAccessoriesGuid" m
ON  v."VentsId"=m."AccessoriesId" 
WHERE v."BuildingId"=BuildingId AND m."AccessoriesName"= 'AccessoriesVents' AND v."ProjectId"=ProjectId AND NVL(v."IsDelete", 'N') = 'N'; 
 
 OPEN Output_Accessories_Insulation FOR   SELECT
     i."InsulationAccessoriesId",
     i."BuildingNumber",
     i."ItemNumber",
     i."Quantity",
     i."Description",
     i."Facing",
     i."Width",
     i."Weight",
     i."Price",
     i."IsPriced",
     i."ErrorCode",
    i."InsulationType",
     m."AccessoriesGuid"
FROM
    "InsulationAccessories" i
     JOIN "MBSAccessoriesGuid" m
    ON i."InsulationAccessoriesId" = m."AccessoriesId"
    WHERE 
     i."BuildingNumber"=BuildingId AND  m."AccessoriesName"='AccessoriesInsulation' AND NVL( i."IsDelete", 'N') = 'N';
     
  OPEN Output_RubberPipeFlash_Data FOR 
SELECT
    r."Quantity",
    r."OutsideDiameter",
    m."AccessoriesGuid"
    
FROM
    "Accessories_RubberPipeFlash" r
      JOIN "MBSAccessoriesGuid" m
    ON r."RubberPipeFlashId" = m."AccessoriesId"
WHERE
    r."BuildingId"=BuildingId  AND  m."AccessoriesName"='AccessoriesRubberPipeFlash' AND r."ProjectId"=ProjectId AND NVL(r."IsDelete", 'N') = 'N';
OPEN Purchaser_Data FOR SELECT
                    P."PurchaserId",
                    P."ProjectId",
                    P."BuyerNumber",
                    P."BuyerName",
                    P."BuyerCareOf",
                    P."BuyerContactName",
                    P."BuyerEmail1",
                    P."ManagerName",
                    P."BuyerMobileNumber",
                    P."BuyerFaxNumber",
                    P."BuyerDayPhone",
                    P."BuyerNightPhone",
                    P."CreatedBy",
                    P."CreatedDate",
                    P."IpAddress",
                    P."IsDelete"
                FROM "Purchaser" P   
                WHERE P."ProjectId"=ProjectId AND NVL(P."IsDelete", 'N') = 'N';
OPEN Address_Data FOR SELECT
    "AddressId",
    "ProjectId",
    "Address1",
    "Address2",
    "Country",
    "State",
    "County",
    "City",
    "ZipCode",
    "Longitude",
    "Latitude",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IsDelete",
    "IpAddress",
    "AddressType"
FROM
    "I_Address" 
    WHERE "ProjectId"=ProjectId AND NVL("IsDelete", 'N') = 'N';
OPEN Shipping_Data FOR SELECT
    "ShippingId",
    "ProjectId",
    "ShippingPointId",
    "ShippingTerms",
    "ShippingContact",
    "Notification",
    "DayPhone",
    "NightPhone",
    "FreightTerms",
    "FreightExpense",
    "Carrier",
    "Country",
    "State",
    "County",
    "City",
    "Address1",
    "Address2",
    "ZipCode",
    "Latitude",
    "Longitude",
    "RequestedDeliveryDate",
    "Miles1",
    "Miles2",
    "Miles3",
    "Rate1",
    "Rate2",
    "Rate3",
    "NumberLoads1",
    "NumberLoads2",
    "NumberLoads3",
    "TruckTarps",
    "CopyFlag",
    "AddIMPOverages",
    "AddExportOverages",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDeleted",
    "InternationalSite"
FROM
    "Shipping"  
     WHERE "ProjectId"=ProjectId AND NVL("IsDeleted", 'N') = 'N';
     
    OPEN OUTPUT_FRAME_GROUP FOR SELECT
                                   c1."GroupId",
                                   c1."ProjectId",
                                   c1."BuildingNumber",
                                   c1."GroupNumber",
                                   c1."ColType1",
                                   c1."ColType2",
                                   c1."WebDepth1",
                                   c1."WebDepth2",
                                   c1."RafterDepth1",
                                   c1."RafterDepth2",
                                   c1."ExtColRecession1",
                                   c1."ExtColRecession2",
                                   c1."Clearspan",
                                   c1."IsElevation1",
                                   c1."IsElevation2",
                                   c1."Elevation1",
                                   c1."Elevation2",
                                   c1."HighStrengthWashers",
                                   c1."IsAdvanceColumn"
                               FROM
                                   "BFM_Groups" c1
                               WHERE
                                       c1."ProjectId" = ProjectId
                                   AND c1."BuildingNumber" = BuildingId AND NVL(c1."IsDeleted", 'N') = 'N'
                              ORDER BY 
                                       c1."GroupNumber";
                                       
    OPEN OUTPUT_FRAME_LINE FOR SELECT
                                  c1."FrameLineId",
                                  c1."ProjectId",
                                  c1."BuildingNumber",
                                  c1."FrameLineNumber",
                                  c1."GroupNumber"
                              FROM
                                  "BFM_FrameLines" c1
                              WHERE
                                      c1."ProjectId" = ProjectId
                                  AND c1."BuildingNumber" = BuildingId AND NVL(c1."IsDeleted", 'N') = 'N';
    OPEN output_frame_module FOR SELECT
                                    c1."ModuleId",
                                    c1."ProjectId",
                                    c1."BuildingNumber",
                                    c1."GroupNumber",
                                    c1."ModuleNumber",
                                    c1."Width"
                                FROM
                                    "BFM_Modules" c1
                                WHERE
                                        c1."ProjectId" = ProjectId
                                    AND c1."BuildingNumber" = BuildingId AND NVL(c1."IsDeleted", 'N') = 'N';
    OPEN OUTPUT_FRAME_INTERIORCOLUMN FOR SELECT
                                            c1."ColumnId",
                                            c1."ProjectId",
                                            c1."BuildingNumber",
                                            c1."GroupNumber",
                                            c1."ColumnNumber",
                                            c1."IntColType",
                                            c1."IntColBaseType",
                                            c1."IntColRecess",
                                            c1."IntColHeaderType",
                                            c1."IntColMaxWebDepth",
                                            c1."BracedBays"
                                        FROM
                                            "BFM_Columns" c1
                                        WHERE
                                                c1."ProjectId" = ProjectId
                                            AND c1."BuildingNumber" = BuildingId AND NVL(c1."IsDeleted", 'N') = 'N';
   OPEN Output_Customer FOR  SELECT p."IsPrivateLabelBuilder"
 FROM "Project" c JOIN "Customer" p
 ON c."CustomerNo" = p."CustomerNo"
 WHERE c."ProjectId" = ProjectId AND NVL(c."IsDelete", 'N') = 'N';
 
 OPEN Output_EndWall FOR  
 SELECT
    "FrameType",
    "SpecifiedSetback"
FROM
    "Input_Endwall"
Where "BuildingNo"=BuildingId AND "ProjectId"=ProjectId AND NVL("IsDeleted", 'N') = 'N'; 
OPEN Output_ShopCoat FOR
 SELECT
                                    ShopCoat."ShopCoatDrpId" ShopCoatColor
                               FROM
                                        "Input_ShopCoat" ShopCoat JOIN "TableOfTables" T
                                        ON  ShopCoat."ShopCoatDrpId"=T."Id"
                                        JOIN "BuildingInformation" Info ON ShopCoat."BuildingInformationId" = Info."BuildingInformationId"
                                        WHERE  ShopCoat."BuildingInformationId" = BuildingId
                                  AND Info."ProjectId" = ProjectId
                                   AND ShopCoat."IsDelete" != 'Y';
END MBS_PRICINGINI;
/