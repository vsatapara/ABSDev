CREATE OR REPLACE PROCEDURE abs_mdi."BUILDING_LIST" (
    Output_Data OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN Output_Data FOR SELECT DISTINCT
                             B."BuildingInformationId",
                             B."BuildingLabel",
                             CONCAT(B."BuildingName",(
                                 CASE B."Structure"
                                     WHEN 'E'  THEN
                                         ' (Existing)'
                                     WHEN 'F'  THEN
                                         ' (Future)'
                                     ELSE
                                         ''
                                 END
                             ))   AS "BuildingName",
                             B."FrameType",
                             B."ProjectId",
                             G."BuildingLength",
                             G."BuildingWidth",
                             CASE B."Elevation"
                                 WHEN 'S' THEN
                                         CASE
                                             WHEN G."EaveHeightSideWallC" > G."EaveHeightSideWallA" THEN
                                                 G."EaveHeightSideWallC"
                                             ELSE
                                                 G."EaveHeightSideWallA"
                                         END
                                 ELSE
                                     CASE
                                         WHEN G."EaveHeightSideWallB" > G."EaveHeightSideWallD" THEN
                                                 G."EaveHeightSideWallB"
                                         ELSE
                                             G."EaveHeightSideWallD"
                                     END
                             END  AS "BuildingHeight"
                         FROM
                             "BuildingInformation"  B
                             LEFT OUTER JOIN "GeometryInformation"  G ON B."BuildingInformationId" = G."BuildingInformationId"
                         WHERE
                             "IsDelete" != 'Y'
                         ORDER BY
                             B."BuildingLabel";
END BUILDING_LIST;
/