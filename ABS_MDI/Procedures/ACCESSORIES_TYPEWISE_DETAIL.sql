CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_TYPEWISE_DETAIL" (
    ProjectId IN NUMBER,
    BuildingId IN NUMBER,
    Accesories_Type IN VARCHAR2,
    Output_RoofVents_Data OUT SYS_REFCURSOR,
    Output_WallLTP_Data OUT SYS_REFCURSOR,
    Output_Louvers_Data OUT SYS_REFCURSOR,
    Output_FrameOpening_Data OUT SYS_REFCURSOR,
    Output_PurlinExtensions_Data OUT SYS_REFCURSOR,
    Output_Partitions_Data OUT SYS_REFCURSOR,
    Output_PartitionsModuleSpacing_Data OUT SYS_REFCURSOR
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
END ACCESSORIES_TYPEWISE_DETAIL;
/