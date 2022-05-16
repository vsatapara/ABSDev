CREATE OR REPLACE PROCEDURE abs_mdi."BuildingInformationChild_List" (
    ProjectId    IN   NUMBER,
    Output_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN Output_Data FOR SELECT
                             info."BuildingInformationId",
                             info."BuildingLabel",
                             info."Structure",
                             info."BuildingName",
                             info."BuildingType",
                             info."Elevation",
                             info."FrameType",
                             info."ProjectId",
                             info."IpAddress",
                             info."IsDelete",
                             info."ParentBuildingId",
                             info."HighSideWallElevation",
                             info."AttachmentElevation",
                             info."UseSeismicDesignCategory",
                             info."IsComplete",
                             CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT('(', info."BuildingLabel"), ')'), info."BuildingName"),
                                                  CASE
                                                      WHEN info."Structure" IS NOT NULL THEN
                                                               '('
                                                  END
                             ),
                                           CASE
                                               WHEN "Structure" IS NOT NULL THEN
                                                        (
                                                            CASE info."Structure"
                                                                WHEN 'E'  THEN
                                                                    'Existing'
                                                                WHEN 'F'  THEN
                                                                    'Future'
                                                            END
                                                        )
                                           END
                             ),
                                    CASE
                                        WHEN info."Structure" IS NOT NULL THEN
                                            ')'
                                    END
                             )                                     AS "BuildingNameWithBuildingLabel",
                             NVL(girts."RoofBaySpacing", 0)        AS "Bays",
                             G."BuildingLength",
                             G."BuildingWidth",
                             CASE info."Elevation"
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
                             END                                   AS "BuildingHeight",
                             (SELECT "FrameType" FROM "Input_Endwall" where  "EndWallNo"=1 and "BuildingNo"=info."BuildingInformationId") AS "EndWall3",
                             (SELECT "FrameType" FROM "Input_Endwall" where  "EndWallNo"=2 and "BuildingNo"=info."BuildingInformationId") AS "EndWall4"
                         FROM
                             "BuildingInformation"    info
                             LEFT JOIN "Input_GirtsBaySpacing"  girts ON girts."BuildingInformationId" = info."BuildingInformationId"
                             LEFT OUTER JOIN "GeometryInformation"    G ON info."BuildingInformationId" = G."BuildingInformationId"
                         WHERE
                                 info."ProjectId" = ProjectId
                             AND info."IsDelete" != 'Y'
                         ORDER BY
                             info."BuildingInformationId";
END "BuildingInformationChild_List";
/