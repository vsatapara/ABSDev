CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_ALL_DETAIL" (
     ProjectId IN NUMBER,
    BuildingId IN NUMBER,
    Accesories_Type IN VARCHAR2,
    Output_RoofVents_Data OUT SYS_REFCURSOR,
    Output_WallLTP_Data OUT SYS_REFCURSOR,
    Output_Louvers_Data OUT SYS_REFCURSOR,
    Output_FrameOpening_Data OUT SYS_REFCURSOR,
    Output_PurlinExtensions_Data OUT SYS_REFCURSOR,
    Output_Partitions_Data OUT SYS_REFCURSOR,
    Output_PartitionsModuleSpacing_Data OUT SYS_REFCURSOR,
    Output_TopMountedSlideDoor_Data  OUT SYS_REFCURSOR,
    Output_Canopy_Data OUT SYS_REFCURSOR,
    Output_DbciDoors_Data IN OUT SYS_REFCURSOR,
    Output_OpenAreas_Data OUT SYS_REFCURSOR,
    Output_Windows_Data OUT SYS_REFCURSOR,
    Output_ParapetWalls_Data OUT SYS_REFCURSOR,
    Output_Facade_Data OUT SYS_REFCURSOR,
    Output_SupportBeams_Data  OUT SYS_REFCURSOR,
    Output_WalkDoors_Data  OUT SYS_REFCURSOR,
    Output_Liners_Data OUT SYS_REFCURSOR,
    Output_Cranes_Data OUT SYS_REFCURSOR,
    Output_Mezzanines_Data OUT SYS_REFCURSOR,
    Output_MezzanineOpening_Data OUT SYS_REFCURSOR,
    Output_MezzanineSpacing_Data OUT SYS_REFCURSOR
)
as     
begin
    IF ( LOWER(Accesories_Type) = 'vents' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_RoofVents_Data FOR SELECT
                                        "VentsId",
                                        "BuildingId",
                                        "ProjectId",
                                        "Quantity",
                                        "RoofVent",
                                        "Elevation",
                                        "BayNumber",
                                        "Color",
                                        "Size",
                                        "DistFromLeftCorner",
                                        "DistFromLeftCol",
                                        "DistFromLeftWall"
                                    FROM
                                        "Accessories_Vents"
                                    WHERE 
                                        "BuildingId"=BuildingId
                                        AND "ProjectId" = ProjectId
                                        AND "IsDelete" = 'N';
    END IF;
    IF ( LOWER(Accesories_Type) = 'wallpartitionltp' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_WallLTP_Data FOR SELECT
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
                                "TopElevation",
                                "Length",
                                "PartitionNumber"
                       FROM
                             "Accesories_WallLTP" aw JOIN "Accesories_WallLTP_Size" ws ON aw."LTPSize" = ws."Value"
                              JOIN "Accesories_WallLTP_Common" wc ON ws."Id" = wc."SizeId"
                              JOIN "M_PanelType" MPanel ON wc."TypeId" = MPanel."Id"
                         WHERE
                            "BuildingInformationId"=BuildingId
                            AND "ProjectId" = ProjectId
                             AND MPanel."Type"=aw."Type"
                             AND "IsDelete" = 'N';
    END IF;
    IF ( LOWER(Accesories_Type) = 'louvers' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_Louvers_Data FOR SELECT
                                    AL."LouverId",
                                    AL."ProjectId",
                                    AL."BuildingId",
                                    AL."Quantity",
                                    AL."Elevation",
                                    AL."BayNumber",
                                    AL."SillHeight",
                                    AL."HeaderHeight",
                                    AL."Width",
                                    AL."DistFromLeftCorner",
                                    AL."DistFromLeftCol",
                                    AL."PartitionNumber"
                                    FROM
                                    "Accessories_Louvers" AL
                                    Where  AL."BuildingId"=BuildingId
                                        AND AL."ProjectId" = ProjectId
                                        AND AL."IsDelete" = 'N';   
                                         END IF;
    IF ( LOWER(Accesories_Type) = 'dbcidoors' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_DbciDoors_Data FOR SELECT
                                    AD."DbciDoorId",
                                    AD."ProjectId",
                                    AD."BuildingId",
                                    AD."Quantity",
                                    AD."Elevation",
                                    AD."BayNumber",
                                    AD."SillHeight",
                                    AD."Heigth",
                                    AD."Width",
                                    AD."DistFromLeftCorner",
                                    AD."DistFromLeftCol",
                                    AD."DistFromFloor",
                                    AD."PartitionNumber"
                                    FROM
                                    "Accessories_DBCIDoor" AD
                                    Where  AD."BuildingId"=BuildingId
                                        AND AD."ProjectId" = ProjectId
                                        AND AD."IsDelete" = 'N';   
    END IF;
    IF ( LOWER(Accesories_Type) = 'framedopenings' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_FrameOpening_Data FOR SELECT
                                    "FramedOpeningId",
                                    "BuildingNumber",
                                    "ProjectId",
                                    "Elevation",
                                    "BayNumber",
                                    "Type",
                                    "Width",
                                    "Height",
                                    "DistFromLeftCorner",
                                    "DistFromLeftCol",
                                    "SillHeight",
                                    "HeaderHeight",
                                    "FourSided",
                                    "PartitionNumber"
                                    FROM
                                    "Accessories_FramedOpening" 
                                    Where "BuildingNumber" = BuildingId
                                            AND "ProjectId" = ProjectId
                                            AND "IsDelete" = 'N';    
    END IF;
    IF ( LOWER(Accesories_Type) = 'purlinextensions' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_PurlinExtensions_Data FOR SELECT
                                                APE."PurlinExtensionId",
                                                APE."ProjectId",
                                                APE."BuildingNumber",
                                                APE."Elevation",
                                                APE."DistanceFromLeftCorner",
                                                APE."StartCol",
                                                APE."StopCol",
                                                APE."Projection"
                                                FROM
                                                "Accesories_PurlinExtensions" APE 
                                                where APE."BuildingNumber" = BuildingId 
                                                and APE."ProjectId" = ProjectId
                                                and APE."IsDelete" = 'N';  
    END IF;
    IF ( LOWER(Accesories_Type) = 'partitions' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_Partitions_Data FOR SELECT
                                "PartitionId",
                                "BuildingNumber",
                                "Type",
                                "Length",
                                "Height",
                                "DistFromEndWall",
                                "DistFromSideWall",
                                "FullHeight",
                                "ProjectId"
                         FROM
                             "Accesories_Partition"
                         WHERE
                                "BuildingNumber" = BuildingId
                                AND "ProjectId" = ProjectId
                                AND "IsDelete" = 'N'; 
        OPEN Output_PartitionsModuleSpacing_Data FOR SELECT
                               PMS."ModuleId",
                               PMS."PartitionId",
                               PMS."Width",
                               PMS."BayNumber"
                         FROM
                             "Accesories_PartitionModuleSpacing" PMS
                             JOIN "Accesories_Partition" P on PMS."PartitionId" = P."PartitionId"
                         WHERE
                                 P."BuildingNumber" = BuildingId
                                 AND P."ProjectId" = ProjectId
                                 AND P."IsDelete" = 'N'
                                 Order by PMS."ModuleId";
    END IF;
    IF ( LOWER(Accesories_Type) = 'topmountedslidedoors' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_TopMountedSlideDoor_Data FOR SELECT
                                          "TopMountedSlideDoorId",
                                          "BuildingNumber",
                                          "ProjectId",
                                          "Elevation",
                                          "BayNumber",
                                          "Width",
                                          "Height",
                                          "DistFromLeftCorner",
                                          "DistFromLeftCol",
                                          "HeaderHeight",
                                          "PartitionNumber"
                                      FROM
                                          "Accesories_TopMountedSlideDoor"
                                      WHERE
                                          "BuildingNumber" = BuildingId
                                          AND "ProjectId" = ProjectId
                                          AND "IsDelete" = 'N';
    END IF;
    IF ( LOWER(Accesories_Type) = 'canopy' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_Canopy_Data FOR SELECT 
                                        "AccessoriesCanopyId",
                                        "BuildingNumber",
                                        "Select_Elevation",
                                        "StartColumn",
                                        "StopColumn",
                                        "DistFromLeftCorner" as "DistFromLeftCorner",
                                        "Length",
                                        "CanopyType",
                                        "Projection",
                                        "HeightLocation",
                                        "Slope",
                                        "AtEave",
                                        "SoffitFramingClearance"        
                                 FROM "Accessories_Canopy"
                                WHERE "BuildingNumber"=BuildingId
                                --AND "ProjectId" = ProjectId
                                AND "IsDelete" = 'N'
                                AND "IsValid"=1;
    END IF;
    IF ( LOWER(Accesories_Type) = 'openareas' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_OpenAreas_Data FOR SELECT 
                                    "Id",
                                    "BuildingNumber",
                                    "Elevation",
                                    "BayNumber",
                                    "DistFromLeftCorner",
                                    "DistFromLeftColumn",
                                    "OpeningType",
                                    "OpenEndwall",
                                    "OpeningWidth",
                                    "OpeningHeight",
                                    "MaterialType",
                                    "MaterialWeight",
                                    "MaterialThickness",
                                    "DistSteelLinetoBeam",
                                    "DistSteelLinetoMaterial",
                                    "MasonryType",
                                    "MaterialDirection",
                                    "ShearWall",
                                    "PercentOpenforWind",
                                    "LeftJamb",
                                    "LeftJambFlash",
                                    "LeftJambFlangeWidth",
                                    "LeftJambFlangeThick",
                                    "LeftJambWebDepth",
                                    "LeftJambWebThick",
                                    "RightJamb",
                                    "RightJambFlash",
                                    "RightJambFlangeWidth",
                                    "RightJambFlangeThick",
                                    "RightJambWebDepth",
                                    "RightJambWebThick",
                                    "HeaderFlash",
                                    "HeaderFlashType",
                                    "HeaderFlashColor",
                                    "AttachmentNumber",
                                    "AllowableDrift",
                                    "BeamSelected",
                                    "BeamStartCol",
                                    "BeamStopCol",
                                    "BeamHeight",
                                    "BeamFlanges",
                                    "BeamWebThick",
                                    "BeamWebDepth",
                                    "BeamFlangeThick",
                                    "BeamFlangeWidth",
                                    "BeamDeflection",
                                    "BeamAttachmentSpacing",
                                    "BeamSteelline",
                                    "BeamSection",
                                    "BeamWeight",
                                    "BeamPrice",
                                    "BeamIsPriced",
                                    "BeamErrorCode",
                                    "LedgerAngle",
                                    "AllElevations",
                                    "ColumnBracing",
                                    "NoOutsideColumns",
                                    "PanelsSpan",
                                    "NoFlangeBelow",
                                    "AllowableInsulation",
                                    "PartitionNumber",
                                    "DeductPanelsTrimOnly",
                                    "FullWidth",
                                    "ParapetByOther",
                                    "HeaderFlashColorValsparCode",
                                    "HeaderFlashColorSpecialName"
                                  FROM "OpenAreas" 
                            Where "BuildingNumber" = BuildingId
                            --AND "ProjectId" = ProjectId
                            AND "IsDeleted" = 'N';
    END IF;
   IF ( LOWER(Accesories_Type) = 'windows' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_Windows_Data FOR SELECT
                                    AW."WindowId",
                                    AW."ProjectId",
                                    AW."BuildingNumber",
                                    AW."Quantity",
                                    AW."Elevation",
                                    AW."BayNumber",
                                    AW."SillHeight",
                                    AW."HeaderHeight",
                                    AW."Width",
                                    AW."DistFromLeftCorner",
                                    AW."DistFromLeftCol",
                                    AW."PartitionNumber"
                                    FROM
                                    "Accesories_Windows" AW
                                    Where  AW."BuildingNumber"=BuildingId
                                        AND AW."ProjectId" = ProjectId
                                        AND AW."IsDelete" = 'N';   
    END IF;
    IF ( LOWER(Accesories_Type) = 'parapetwalls' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_ParapetWalls_Data FOR SELECT
                                    "BuildingInformationId",
                                    "Elevation",
                                    "StartColumn",
                                    "StopColumn",
                                    "DistFromLeftCorner",
                                    "Height"
                                     FROM
                                    "Accessories_Parapet"
                                    Where  "BuildingInformationId"=BuildingId
                                        AND "ProjectId" = ProjectId
                                        AND "IsDelete" = 'N';   
    END IF;
     IF ( LOWER(Accesories_Type) = 'facade' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_Facade_Data FOR SELECT
                                        "BuildingInformationId",
                                        "Elevation",
                                        "StartCol",
                                        "StopCol",
                                        "DistFromLeftCorner",
                                        "Length",
                                        "Type",
                                        "Projection",
                                        "Height",
                                        "Gutter",
                                        "Slant",
                                        "SoffitElevation"
                                    FROM
                                        "Accessories_Facade"
                                    Where  "BuildingInformationId"=BuildingId
                                        AND "ProjectId" = ProjectId
                                        AND "IsDelete" = 'N';   
    END IF;
     IF ( LOWER(Accesories_Type) = 'supportbeams' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_SupportBeams_Data FOR SELECT
                                        "BuildingNumber",
                                        "Elevation",
                                        "BeamStartCol",
                                        "BeamStopCol",
                                        "BeamHeight"
                                    FROM
                                        "SupportBeams"
                                    Where  "BuildingNumber"=BuildingId
                                      --  AND "ProjectId" = ProjectId
                                        AND "IsDelete" = 'N';   
    END IF; 
    IF ( LOWER(Accesories_Type) = 'walkdoors' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_WalkDoors_Data FOR 
                                    SELECT 
                                    "BuildingId",
                                    "Elevation",
                                    "BayNumber",
                                    "HeaderHeight",
                                    "Width",
                                    "DistFromLeftCorner",
                                    "DistFromLeftCol",
                                    "PartitionNumber",
                                    "DistanceFromFloor"
                                    FROM "Accessories_WalkDoors"
                                    Where  "BuildingId"=BuildingId
                                       AND "ProjectId" = ProjectId
                                        AND "IsDelete" = 'N';   
    END IF;
    IF ( LOWER(Accesories_Type) = 'roofliner' OR LOWER(Accesories_Type) = 'wallpartitionliner' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_Liners_Data FOR
                                    SELECT Liners."BuildingNumber",
                                            Liners."Elevation",
                                            CoverageType."ItemText" "LinerCoverage",
                                            NVL(Liners."DistFromLeftCorner",0) "DistFromLeftCorner",
                                            NVL(Liners."FullHeight",0) "FullHeight",
                                            NVL(Liners."Height",0) "Height",
                                            NVL(Liners."Length",0) "Length",
                                            NVL(Liners."Width",0) "Width",
                                            PanelType."Type" "PanelType",
                                            NVL(Liners."StartColumn",0) "StartColumn",
                                            NVL(Liners."StopColumn",0) "StopColumn" ,
                                            NVL(Liners."XFrom",0) "XFrom",
                                            NVL(Liners."XTo",0) "XTo",
                                            NVL(Liners."YFrom",0) "YFrom",
                                            NVL(Liners."YTo",0) "YTo",
                                            NVL(Liners."PartitionNumber",0) "PartitionNumber"
                                            FROM "Accessories_Liners" Liners
                                            Left Join "M_PanelType" PanelType on PanelType."Id" = Liners."PanelType" 
                                            Left Join "TableOfTables" CoverageType on CoverageType."Id" = Liners."LinerCoverage" 
                                        Where  Liners."BuildingNumber"=BuildingId
                                           AND Liners."ProjectId" = ProjectId
                                            AND Liners."IsDelete" = 'N';   
    END IF;
    IF ( LOWER(Accesories_Type) = 'cranes' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_Cranes_Data FOR
                                    SELECT
                                        "CraneId",
                                        "ProjectId",
                                        "BuildingId",
                                        "ModuleNumber",
                                        "CenterlineOfRunwayBeamToSteelline",
                                        "CenterlineToCenterlineOfRails",
                                        "StartFrameline",
                                        "StopFrameLine",
                                        "ColBaseToTopOfRail",
                                        "SeperateSupportCol"
                                    FROM
                                        "Accessories_Cranes"
                                    WHERE 
                                        "BuildingId"=BuildingId
                                    AND "ProjectId" = ProjectId
                                    AND "IsDelete" = 'N';
    END IF;
    IF ( LOWER(Accesories_Type) = 'mezzanines' OR LOWER(Accesories_Type) = 'allaccessories') THEN
        OPEN Output_Mezzanines_Data FOR
                                    SELECT
                                        "BuildingNumber",
                                        "MezzanineNumber",
                                        "MezzaninesId",
                                        "StartFrameline",
                                        "StopFrameline",
                                        "OpenDistFromSw",
                                        "OpenDistFromFrameline"  ,
                                        "OpenLengthAlongSw",
                                        "OpenWidthAlongEw",
                                        "OpenDistFromFrameline",
                                        "DistFromSW",
                                        "OpenLengthAlongSw",
                                        "Width",
                                        "FloorHeight",
                                        "JoistParallelToPurlins",
                                        "JoistSpacing"
                                    FROM
                                        "EDSPrice_IO_Mezzanines"
                                    WHERE 
                                        "BuildingNumber"=BuildingId
                                    AND "ProjectId" = ProjectId
                                    AND "IsDelete" = 'N';
         OPEN Output_MezzanineOpening_Data FOR 
                                    SELECT
                                         "MezzaninesId",
                                        "BuildingNumber",
                                        "MezzanineNumber"  ,
                                         "OpeningNumber"  ,
                                        "OpenDistFromSw"  ,
                                        "OpenDistFromFrameline"  ,
                                        "OpenWidthAlongEw" ,
                                        "OpenLengthAlongSw" 
                                    FROM
                                        "EDSPrice_IO_MezzanineOpening"
                                    WHERE
                                        "BuildingNumber"=BuildingId
                                    AND "ProjectId" = ProjectId 
                                    AND "IsDelete" = 'N';
        OPEN Output_MezzanineSpacing_Data FOR 
                                SELECT
                                     "MezzaninesId",
                                    "BuildingNumber",
                                    "MezzanineNumber"  ,
                                     "FramelineNumber" , 
                                     "AlltheSame", 
                                     "Spacing1"   , 
                                     "Spacing2", 
                                     "Spacing3" , 
                                     "Spacing4"  , 
                                     "Spacing5", 
                                     "Spacing6"  , 
                                     "Spacing7" , 
                                     "Spacing8" , 
                                     "Spacing9"  , 
                                     "Spacing10", 
                                     "Spacing11" , 
                                     "Spacing12"  , 
                                     "Spacing13"  , 
                                     "Spacing14" , 
                                     "Spacing15", 
                                     "Spacing16" , 
                                     "Spacing17"  , 
                                     "Spacing18", 
                                     "Spacing19" , 
                                     "Spacing20" , 
                                     "Spacing21" , 
                                     "Spacing22", 
                                     "Spacing23", 
                                     "Spacing24" , 
                                     "Spacing25", 
                                     "Spacing26" , 
                                     "Spacing27" , 
                                     "Spacing28" , 
                                     "Spacing29" , 
                                     "Spacing30",
                                     "ForLongitudinal"
                                 FROM
                                    "EDSPrice_IO_MezzanineSpacing"
                                WHERE
                                    "BuildingNumber"=BuildingId
                                AND "ProjectId" = ProjectId
                                AND "IsDelete" = 'N';
    END IF;
END ACCESSORIES_ALL_DETAIL;
/