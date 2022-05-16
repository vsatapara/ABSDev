CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_PARTITION_SELECT" (
    PartitionId    IN   NUMBER,
    Partition_Data               OUT  SYS_REFCURSOR,
    PartitionModuleSpacing_Data  OUT  SYS_REFCURSOR,
    PartitionGirtSpacing_Data  OUT  SYS_REFCURSOR 
    )
AS 
BEGIN
    OPEN Partition_Data FOR SELECT
                                "PartitionId",
                                "BuildingNumber",
                                "Type",
                                "Length",
                                "Height",
                                "DistFromEndWall",
                                "DistFromSideWall",
                                "FullHeight",
                                "PanelType",
                                "Width",
                                "Thickness",
                                "ReverseRoll",
                                "ExteriorProfile",
                                "ExteriorGuage",
                                "ExteriorTexture",
                                "ExteriorColor",
                                "ExteriorColorSpecialName",
                                "ExteriorColorValsparCode",
                                "InteriorProfile",
                                "InteriorGuage",
                                "InteriorTexture",
                                "InteriorColor",
                                "InteriorColorSpecialName",
                                "InteriorColorValsparCode",
                                "FactoryAppliedSealant",
                                "SheeterSide",
                                "ExteriorWall",
                                "RecessFoundation",
                                "BaseClosureStrips",
                                "PurlinTrimColor",
                                "PurlinTrimColorSpecialName",
                                "PurlinTrimColorValsparCode",
                                "CornerTrimColor",
                                "CornerTrimColorSpecialName",
                                "CornerTrimColorValsparCode",
                                "FramingByOthers",
                                "BaseCondition",
                                "FastenerHeadFinish",
                                "FastenerLength",
                                "GirtSpacing",
                                "ProjectId",
                                "GirtDepth",
                                "GirtType"
                         FROM
                             "Accesories_Partition"
                         WHERE
                                 "PartitionId" = PartitionId ;
                                 
    OPEN PartitionModuleSpacing_Data FOR SELECT
                                --"ProjectId",
                               "ModuleId",
                            ---   "BuildingInformationId",
                               "PartitionId",
                               "Width",
                               "BayNumber"
                         FROM
                             "Accesories_PartitionModuleSpacing"
                         WHERE
                                 "PartitionId" = PartitionId Order by "ModuleId";
                                
   OPEN PartitionGirtSpacing_Data FOR SELECT
                                "PartitionGirtSpacingId",
                             ---   "BuildingInformationId",
                                "PartitionId",
                                "Width"
                                --"ProjectId"
                            FROM
                                "Accesories_PartitionGirtSpacing"
                            where "PartitionId"=PartitionId Order by "PartitionGirtSpacingId";
                                 
END ACCESORIES_PARTITION_SELECT;
/