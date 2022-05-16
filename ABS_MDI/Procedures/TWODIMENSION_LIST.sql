CREATE OR REPLACE PROCEDURE abs_mdi."TWODIMENSION_LIST" (
    ProjectId IN NUMBER ,   
    Output_Data OUT SYS_REFCURSOR
    )
AS
BEGIN
    OPEN Output_Data FOR
        select
          DISTINCT(bi."BuildingInformationId"),
          bi."ParentBuildingId",
          "BuildingLabel",
          "BuildingName",
          "BuildingType",
          bi."Elevation",
          "AttachmentElevation",
          bi."FrameType",
          "BuildingWidth",
          "BuildingLength",
          "DistanceToRidgeSideWallB",
          "DistanceToRidgeSideWallD",
          "DistanceToRidgeSideWallA",
          "DistanceToRidgeSideWallC",
          "EaveHeightSideWallA",
          "EaveHeightSideWallC",
          "EaveHeightSideWallB",
          "EaveHeightSideWallD",
          "XDistance",
          "YDistance",
           NVL("XDirection",' ') as "Direction",
          "StartColumn",
          "StopColumn",
          "AttachmentOffset",
          NVL((SELECT "RoofBaySpacing" from "Input_GirtsBaySpacing" ig WHERE ig."BuildingInformationId"=bi."BuildingInformationId" AND ROWNUM = 1),0) "BaySideWall",
          NVL((SELECT "BayCount" from "Input_Endwall" ie WHERE ie."BuildingNo"=bi."BuildingInformationId" AND ie."EndWallNo" =1 AND NVL(ie."IsDeleted", 'N') = 'N' AND ROWNUM = 1 ),0) "BayEWB",
          NVL((SELECT "BayCount" from "Input_Endwall" ie WHERE ie."BuildingNo"=bi."BuildingInformationId" AND ie."EndWallNo" =2 AND NVL(ie."IsDeleted", 'N') = 'N' AND ROWNUM = 1),0) "BayEWD",
          NVL((SELECT "SpecifiedSetback" from "Input_Endwall" ie WHERE ie."BuildingNo"=bi."BuildingInformationId" AND ie."EndWallNo" =1 AND NVL(ie."IsDeleted", 'N') = 'N' AND ROWNUM = 1),0) "SpecifiedSetback3",
          NVL((SELECT "SpecifiedSetback" from "Input_Endwall" ie WHERE ie."BuildingNo"=bi."BuildingInformationId" AND ie."EndWallNo" =2 AND NVL(ie."IsDeleted", 'N') = 'N' AND ROWNUM = 1),0) "SpecifiedSetback4",
          "XCoordinate",
          "YCoordinate"
     from "GeometryInformation" gi , 
     "BuildingInformation" bi
     --"Input_Endwall" ie
     where bi."ProjectId" = ProjectId and bi."IsDelete" != 'Y'
     and bi."BuildingInformationId" = gi."BuildingInformationId"
     order by "BuildingLabel" ASC;
 END TwoDimension_List;
/