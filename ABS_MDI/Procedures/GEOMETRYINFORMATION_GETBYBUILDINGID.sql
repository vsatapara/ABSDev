CREATE OR REPLACE PROCEDURE abs_mdi."GEOMETRYINFORMATION_GETBYBUILDINGID" 
(
    ProjectId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    G."GeometryInformationId",
    G."BuildingInformationId",
    G."BuildingWidth",
    G."BuildingLength",
    G."DistanceToRidgeSideWallB",
    G."DistanceToRidgeSideWallD",
    G."DistanceToRidgeSideWallA",
    G."DistanceToRidgeSideWallC",
    G."EaveHeightSideWallB",
    G."EaveHeightSideWallD",
    G."RoofSlopeSideWallB",
    G."RoofSlopeSideWallD",
    G."EaveHeightSideWallA",
    G."EaveHeightSideWallC",
    G."RoofSlopeSideWallA",
    G."RoofSlopeSideWallC",
    G."Swa",
    G."Swb",
    G."CreatedBy",
    G."CreatedDate",
    G."ModifiedBy",
    G."ModifiedDate",
    G."Category",
    G."CurrentBuilding",
    G."AvailableBuilding",
   -- G."Elevation",
    G."XDistance",
    G."YDistance",
    G."OffsetDistance",
    G."StartColumn",
    G."StopColumn",
    G."XDirection",
    G."YDirection",
    G."AttachmentOffset",
    G."PeakHeight",
    G."WindEnclosure",
    G."AccessoryEnclosure",
    G."OAEnclosure",
    G."XCoordinate",
    G."YCoordinate",
    B."BuildingLabel",
    B."BuildingName",
    B."BuildingType",
    B."FrameType",
    B."BuildingHasInsulation",
    B."InsulationByBrand",
    CASE B."Elevation"  WHEN 'S' THEN 'Sidewall'
    WHEN 'E' THEN 'Endwall'
    END AS "Elevation",
    case when B."FrameType" = 'Lean-to' then SUBSTR(B."HighSideWallElevation",-1) 
   else B."HighSideWallElevation" End AS "high_sidewall" ,
    B."Elevation" AS "attachment_wall" ,
    B."AttachmentElevation" AS "attached_to_wall" ,
    B."ParentBuildingId" AS "attached_to_building_number" ,
    B."Structure" AS "existing",
    B."ComCheck",
    B."ProjectId"
FROM
    "GeometryInformation" G
JOIN "BuildingInformation" B ON G."BuildingInformationId" = B."BuildingInformationId"
     WHERE
                B."ProjectId" in
                ( 
                        SELECT regexp_substr(ProjectId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(ProjectId, '[^,]+', 1, level) is not null
                 )
                 AND (B."IsDelete" IS NULL  OR B."IsDelete" != 'Y');
END;
/