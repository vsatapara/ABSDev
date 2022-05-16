CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYBUILDING_LIST" (
    projectid    IN   NUMBER,
    output_data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN output_data FOR SELECT
                             bi."BuildingInformationId"    id,
                             bi."BuildingName"             name,
                             bi."BuildingLabel"            label,
                             bi."Elevation"                elevation,
                             bi."IsComplete"               iscomplete,
                             bi."ParentBuildingId",
                             bi."BuildingType",
                             bi."Structure"                structure,
                             CASE
                                 WHEN gpd."DepthName" = 'LBP' THEN
                                     1
                                 ELSE
                                     0
                             END                           "IsLBPBuilding",
                             CASE
                                 WHEN (
                                     SELECT
                                         COUNT(*)
                                     FROM
                                         "Input_Endwall" ie
                                     WHERE
                                             ie."FrameType" = 'Hipped Endwall'
                                         AND ie."BuildingNo" = bi."BuildingInformationId"
                                         AND nvl(ie."IsDeleted", 'N') = 'N'
                                 ) > 0 THEN
                                     1
                                 ELSE
                                     0
                             END                           "IsHippedBuilding",
                             mpd."Type"                    AS "WallType",
                             G."PeakHeight"                AS "PeakHeight",
                             G."BuildingWidth"             AS "BuildingWidth",
                             G."BuildingLength"            AS "BuildingLength",
                             bi."FrameType"                AS "FrameType"
                         FROM
                             "BuildingInformation"    bi
                             LEFT JOIN "Input_GirtsBaySpacing"  gs ON gs."BuildingInformationId" = bi."BuildingInformationId"
                             LEFT JOIN "GirtsAndPurlinDepth"    gpd ON gpd."DepthId" = gs."RoofPurlinDepth"
                             LEFT JOIN "Input_Wall"             iw ON iw."BuildingInformationId" = bi."BuildingInformationId"
                             LEFT JOIN "M_PanelType"            mpd ON mpd."Id" = iw."Type"
                             LEFT JOIN "GeometryInformation"    G ON G."BuildingInformationId" = bi."BuildingInformationId" 
                         WHERE
                                 bi."ProjectId" = projectid
                             AND nvl(bi."IsDelete", 'N') != 'Y'
                         ORDER BY
                             bi."BuildingLabel" ASC;
END accessorybuilding_list;
/