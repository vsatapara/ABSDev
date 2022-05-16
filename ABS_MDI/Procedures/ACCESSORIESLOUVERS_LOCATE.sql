CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIESLOUVERS_LOCATE" (
    BuildingId                          IN   NUMBER,
    Output_InformationData              OUT  SYS_REFCURSOR,
    Output_GeometryData                 OUT  SYS_REFCURSOR,
    Output_GirtBaySpacingData           OUT  SYS_REFCURSOR,
    Output_GirtBaySpacingData_RBS       OUT  SYS_REFCURSOR,
    Output_GirtBaySpacingData_WBS       OUT  SYS_REFCURSOR,
    Output_EndWallData                  OUT  SYS_REFCURSOR,
    Output_EndWallData_ColumnSpacing    OUT  SYS_REFCURSOR,
    Output_BracingData                  OUT  SYS_REFCURSOR,
    Output_XBraceLocationData           OUT  SYS_REFCURSOR,
    Output_RoofData                     OUT  SYS_REFCURSOR,
    Output_GirtsAndPurlinStyle_Data     OUT  SYS_REFCURSOR,
    Output_GirtsDepth_Data              OUT  SYS_REFCURSOR,
    Output_Partition_Data               OUT  SYS_REFCURSOR,
    Output_PartitionModuleSpacing_Data  OUT  SYS_REFCURSOR,
    Output_Insulation_Data              OUT  SYS_REFCURSOR,
    Output_FramedOpening_Data           OUT  SYS_REFCURSOR,
    Output_OpenArea_Data                OUT  SYS_REFCURSOR
) AS
    Category               VARCHAR2(40);
    QuoteORPrice           VARCHAR2(100);
    ProjectId              NUMBER;
    IsForQuote             NUMBER;
    HighSideWallElevation  VARCHAR2(1);
    Elevation              VARCHAR(2);
    FrameType              VARCHAR(50);
BEGIN
    SELECT
        "ProjectId"
    INTO ProjectId
    FROM
        "BuildingInformation"
    WHERE
            "BuildingInformationId" = BuildingId
        AND ROWNUM = 1;
    SELECT
        "PriceStatus"
    INTO QuoteORPrice
    FROM
        "Project"
    WHERE
            "ProjectId" = ProjectId
        AND ROWNUM = 1;
    OPEN Output_InformationData FOR SELECT
                                       "FrameType",
                                       NVL("AttachmentElevation", 'N/A')      AS "AttachmentElevation",
                                       "Elevation",
                                       CASE QuoteORPrice
                                           WHEN 'ForPricingOrder' THEN
                                               0
                                           ELSE
                                               1
                                       END                                    AS "ForQuote",
                                       "BuildingType",
                                       "HighSideWallElevation"
                                   FROM
                                       "BuildingInformation"
                                   WHERE
                                       "BuildingInformationId" = BuildingId;
    SELECT
        "Elevation",
        "FrameType",
        SUBSTR("HighSideWallElevation", 3) AS "HighSideWallElevation"
    INTO
        Elevation,
        FrameType,
        HighSideWallElevation
    FROM
        "BuildingInformation" b
    WHERE
            b."BuildingInformationId" = BuildingId
        AND ROWNUM = 1;
    IF ( Elevation = 'S' ) THEN
        OPEN Output_GeometryData FOR SELECT
                                         "BuildingWidth",
                                         "BuildingLength",
                                         "DistanceToRidgeSideWallA"  AS "DistanceToRidgeSideWallOne",
                                         "DistanceToRidgeSideWallC"  AS "DistanceToRidgeSideWallTwo",
                                         "EaveHeightSideWallA"       AS "EaveHeightSideWallOne",
                                         "EaveHeightSideWallC"       AS "EaveHeightSideWallTwo",
                                         "RoofSlopeSideWallA"        AS "RoofSlopeSideWallOne",
                                         "RoofSlopeSideWallC"        AS "RoofSlopeSideWallTwo",
                                         "PeakHeight"
                                     FROM
                                         "GeometryInformation"
                                     WHERE
                                         "BuildingInformationId" = BuildingId;
    ELSE
        IF ( FrameType = 'Symmetrical' ) THEN
            OPEN Output_GeometryData FOR SELECT
                                             "BuildingWidth",
                                             "BuildingLength",
                                             "DistanceToRidgeSideWallB"  AS "DistanceToRidgeSideWallOne",
                                             "DistanceToRidgeSideWallD"  AS "DistanceToRidgeSideWallTwo",
                                             "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                             "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                             "RoofSlopeSideWallB"        AS "RoofSlopeSideWallOne",
                                             "RoofSlopeSideWallD"        AS "RoofSlopeSideWallTwo",
                                             "PeakHeight"
                                         FROM
                                             "GeometryInformation"
                                         WHERE
                                             "BuildingInformationId" = BuildingId;
        ELSIF ( FrameType = 'Unsymmetrical' ) THEN
            OPEN Output_GeometryData FOR SELECT
                                             "BuildingWidth",
                                             "BuildingLength",
                                             "DistanceToRidgeSideWallD"  AS "DistanceToRidgeSideWallOne",
                                             "DistanceToRidgeSideWallB"  AS "DistanceToRidgeSideWallTwo",
                                             "EaveHeightSideWallD"       AS "EaveHeightSideWallOne",
                                             "EaveHeightSideWallB"       AS "EaveHeightSideWallTwo",
                                             "RoofSlopeSideWallD"        AS "RoofSlopeSideWallOne",
                                             "RoofSlopeSideWallB"        AS "RoofSlopeSideWallTwo",
                                             "PeakHeight"
                                         FROM
                                             "GeometryInformation"
                                         WHERE
                                             "BuildingInformationId" = BuildingId;
        ELSIF ( FrameType = 'Single Slope' ) THEN
            IF ( HighSideWallElevation = 'D' ) THEN
                OPEN Output_GeometryData FOR SELECT
                                                 "BuildingWidth",
                                                 "BuildingLength",
                                                 "DistanceToRidgeSideWallD"  AS "DistanceToRidgeSideWallOne",
                                                 "DistanceToRidgeSideWallB"  AS "DistanceToRidgeSideWallTwo",
                                                 "EaveHeightSideWallD"       AS "EaveHeightSideWallOne",
                                                 "EaveHeightSideWallB"       AS "EaveHeightSideWallTwo",
                                                 "RoofSlopeSideWallD"        AS "RoofSlopeSideWallOne",
                                                 "RoofSlopeSideWallB"        AS "RoofSlopeSideWallTwo",
                                                 "PeakHeight"
                                             FROM
                                                 "GeometryInformation"
                                             WHERE
                                                 "BuildingInformationId" = BuildingId;
            ELSE
                OPEN Output_GeometryData FOR SELECT
                                                 "BuildingWidth",
                                                 "BuildingLength",
                                                 "DistanceToRidgeSideWallB"  AS "DistanceToRidgeSideWallOne",
                                                 "DistanceToRidgeSideWallD"  AS "DistanceToRidgeSideWallTwo",
                                                 "EaveHeightSideWallB"       AS "EaveHeightSideWallOne",
                                                 "EaveHeightSideWallD"       AS "EaveHeightSideWallTwo",
                                                 "RoofSlopeSideWallB"        AS "RoofSlopeSideWallOne",
                                                 "RoofSlopeSideWallD"        AS "RoofSlopeSideWallTwo",
                                                 "PeakHeight"
                                             FROM
                                                 "GeometryInformation"
                                             WHERE
                                                 "BuildingInformationId" = BuildingId;
            END IF;
        ELSIF ( FrameType = 'Lean-to' ) THEN
            OPEN Output_GeometryData FOR SELECT
                                             "BuildingWidth",
                                             "BuildingLength",
                                             "DistanceToRidgeSideWallD"  AS "DistanceToRidgeSideWallOne",
                                             "DistanceToRidgeSideWallB"  AS "DistanceToRidgeSideWallTwo",
                                             "EaveHeightSideWallD"       AS "EaveHeightSideWallOne",
                                             "EaveHeightSideWallB"       AS "EaveHeightSideWallTwo",
                                             "RoofSlopeSideWallD"        AS "RoofSlopeSideWallOne",
                                             "RoofSlopeSideWallB"        AS "RoofSlopeSideWallTwo",
                                             "PeakHeight"
                                         FROM
                                             "GeometryInformation"
                                         WHERE
                                             "BuildingInformationId" = BuildingId;
        END IF;
    END IF;
            
    --OPEN  Output_GeometryData FOR
    --    SELECT 
    --         "BuildingWidth",
    --        NVL("RoofSlopeSideWallA",0) As "RoofSlopeSideWallOne",
    --        NVL("DistanceToRidgeSideWallB",0) AS "DistanceToRidgeSideWallOne",
    --        NVL("DistanceToRidgeSideWallD",0) AS "DistanceToRidgeSideWallTwo",
    --        NVL("EaveHeightSideWallB",0) AS "EaveHeightSideWallOne",
    --        NVL("EaveHeightSideWallD",0) AS "EaveHeightSideWallTwo",
   --         NVL("RoofSlopeSideWallB",0) AS "RoofSlopeSideWallOne",
   --         NVL("RoofSlopeSideWallD",0) AS "RoofSlopeSideWallTwo",   
   --         "BuildingLength",
   --         "PeakHeight"
   --     FROM 
  --      "GeometryInformation"
   --     WHERE "BuildingInformationId" = BuildingId;
        
                             OPEN Output_GirtBaySpacingData FOR SELECT
                                          "SW1Style",
                                          "SW2Style",
                                          "EW1Style",
                                          "EW2Style",
                                          "SW1Depth",
                                          "SW2Depth",
                                          "EW1Depth",
                                          "EW2Depth",
                                          "RoofPurlinStyle",
                                          "RoofPurlinDepth",
                                          "LBPMinDepth",
                                          "LBPMaxDepth",
                                          "RoofBaySpacing",
                                          "GirtSpacing",
                                          "PurlinSpacing"
                                      FROM
                                          "Input_GirtsBaySpacing"
                                      WHERE
                                          "BuildingInformationId" = BuildingId;
    OPEN Output_GirtBaySpacingData_RBS FOR SELECT
                                              "RoofBaySpaceId",
                                              "BuildingInformationId",
                                              "Elevation",
                                              "BayNumber",
                                              "Width"
                                          FROM
                                              "Input_Bays"
                                          WHERE
                                              "BuildingInformationId" = BuildingId;
    OPEN Output_GirtBaySpacingData_WBS FOR SELECT
                                              "WallBaySpaceId",
                                              "GirtSpacingId",
                                              "Elevation",
                                              "RoofBayNumber",
                                              "DistFromLeftColumn",
                                              "BaseRecess",
                                              "RoofBayWidth",
                                              "Sequence"
                                          FROM
                                              "Input_GirtsBaySpacing_Wall"
                                          WHERE
                                              "GirtSpacingId" = (
                                                  SELECT
                                                      "GirtSpacingId"
                                                  FROM
                                                      "Input_GirtsBaySpacing"
                                                  WHERE
                                                      "BuildingInformationId" = BuildingId
                                              );
    OPEN Output_EndWallData FOR SELECT
                                   "EndWallID",
                                   "FrameType",
                                   "EndWallNo",
                                   "ElevationType",
                                   "ColumnSpacingType",
                                   "InsulationTrim",
                                   "NonStandardSetback",
                                   "DesignedSetback",
                                   "SpecifiedSetback",
                                   "BayCount"
                               FROM
                                   "Input_Endwall"
                               WHERE
                                       "BuildingNo" = BuildingId
                                   AND NVL("IsDeleted", 'N') = 'N';
    OPEN Output_EndWallData_ColumnSpacing FOR SELECT
                                                 "CSType",
                                                 "BayNo",
                                                 "BaySpacing",
                                                 "EndWallID"
                                             FROM
                                                 "Input_Endwalls_ColumnSpacing"
                                             WHERE
                                                     "BuildingNo" = BuildingId
                                                 AND NVL("IsDeleted", 'N') = 'N';
    OPEN Output_BracingData FOR SELECT
                                   "SW1BracingType",
                                   "SW1Tiers",
                                   "SW1BracingLocations",
                                   "SW1UnbraceableLocations",
                                   "SW1ExcludeDiaphragm",
                                   "SW2BracingType",
                                   "SW2Tiers",
                                   "SW2BracingLocations",
                                   "SW2UnbraceableLocations",
                                   "SW2ExcludeDiaphragm",
                                   "EW3BracingType",
                                   "EW3Tiers",
                                   "EW3BracingLocations",
                                   "EW3UnbraceableLocations",
                                   "EW3ExcludeDiaphragm",
                                   "EW4BracingType",
                                   "EW4Tiers",
                                   "EW4BracingLocations",
                                   "EW4UnbraceableLocations",
                                   "EW4ExcludeDiaphragm",
                                   "RoofBracingType",
                                   "RoofBracingLocations",
                                   "RoofUnbraceableLocations",
                                   "RoofExcludeDiaphragm",
                                   NVL("SW1FBBCRight", ' ')      AS "SW1FBBCRight",
                                   NVL("SW2FBBCRight", ' ')      AS "SW2FBBCRight",
                                   "PortalRafterDepth1",
                                   "PortalRafterDepth2",
                                   "PortalRafterDepth3",
                                   "PortalRafterDepth4",
                                   "SW1PFrameHeight",
                                   "SW2PFrameHeight",
                                   "EW3PFrameHeight",
                                   "EW4PFrameHeight"
                               FROM
                                   "Bracing" Braces
                               WHERE
                                       "BuildingInformationId" = BuildingId
                                   AND Braces."IsReset" <> 'Y';
    OPEN Output_XBraceLocationData FOR SELECT
                                          "XBraceAnchorId",
                                          "BayNumber",
                                          "DistFromLeftCornerLeft",
                                          "DistFromLeftColumnLeft",
                                          "DistFromLeftCornerRight",
                                          "DistFromLeftColumnRight",
                                          "LeftSteelLine",
                                          "BracingId",
                                          "Elevation",
                                          "BuildingInformationId"
                                      FROM
                                          "Bracing_XBraceAnchor" XBraces
                                      WHERE
                                          "BuildingInformationId" = BuildingId;
    OPEN Output_RoofData FOR SELECT
                                "Type"
                            FROM
                                "Input_Roof"
                            WHERE
                                "BuildingInformationId" = BuildingId;
    OPEN Output_GirtsAndPurlinStyle_Data FOR SELECT
                                                "StyleId"    AS Id,
                                                "StyleName"  AS Name
                                            FROM
                                                "GirtsAndPurlinStyle"
                                            ORDER BY
                                                Id;
    OPEN Output_GirtsDepth_Data FOR SELECT
                                       "DepthId"     AS Id,
                                       "DepthName"   AS Name,
                                       "DepthValue"  AS Value
                                   FROM
                                       "GirtsAndPurlinDepth"
                                   --WHERE "IsForGirts" = 1
                                   ORDER BY Id;
    OPEN Output_Partition_Data FOR SELECT
                                      Partition."PartitionId"                       "PartitionNumber",
                                      Partition."Length",
                                      PanelType."Type"                              "PanelType",
                                      PartitionMaster."CategoryValue"               "PartitionType",
                                      CASE
                                          WHEN "FullHeight" = 'Y' THEN
                                              1
                                          ELSE
                                              0
                                      END                                           "FullHeight",
                                      "Height",
                                      "DistFromEndWall"                             "DistFromLeftCorner",
                                      "DistFromSideWall"                            "DistFromWall",
                                      PartitionMasterSheeterSide."CategoryValue"    "SheeterSide"
                                  FROM
                                           "Accesories_Partition" Partition
                                      JOIN "M_PanelType"                 PanelType ON Partition."PanelType" = PanelType."Id"
                                      JOIN "Accesories_PartitionMaster"  PartitionMaster ON Partition."Type" = PartitionMaster."OptionId"
                                      JOIN "Accesories_PartitionMaster"  PartitionMasterSheeterSide ON Partition."SheeterSide" = PartitionMasterSheeterSide.
                                      "OptionId"
                                  WHERE
                                          Partition."BuildingNumber" = BuildingId
                                      AND Partition."PanelType" IN ( 1, 2 )
                                      AND "IsDelete" = 'N'
                                  ORDER BY
                                      "PartitionId";
    OPEN Output_PartitionModuleSpacing_Data FOR SELECT
                                                   Partition."PartitionId" "PartitionNumber",
                                                   Spacing."Width",
                                                   "BayNumber"
                                               FROM
                                                        "Accesories_PartitionModuleSpacing" Spacing
                                                   JOIN "Accesories_Partition" Partition ON Spacing."PartitionId" = Partition."PartitionId"
                                               WHERE
                                                       Partition."BuildingNumber" = BuildingId
                                                   AND Partition."PanelType" IN ( 1, 2 )
                                                   AND Partition."IsDelete" = 'N'
                                               ORDER BY
                                                   Partition."PartitionId",
                                                   "BayNumber";
    OPEN Output_Insulation_Data FOR SELECT
                                       "Facing" AS Facing
                                   FROM
                                       "Insulation"
                                   WHERE
                                           "BuildingNumber" = BuildingId
                                       AND "IsDelete" <> 'Y';
    OPEN Output_FramedOpening_Data FOR SELECT
                                          "FramedOpeningId",
                                          "BuildingNumber",
                                          "Elevation",
                                          "BayNumber",
                                          "DistFromLeftCorner",
                                          "DistFromLeftCol",
                                          "SillHeight",
                                          "HeaderHeight"
                                      FROM
                                          "Accessories_FramedOpening"
                                      WHERE
                                              "BuildingNumber" = BuildingId
                                          AND "IsDelete" = 'N';
    OPEN Output_OpenArea_Data FOR SELECT
                                     "Id",
                                     "BuildingNumber",
                                     "Elevation",
                                     "BayNumber",
                                     "DistFromLeftCorner",
                                     "DistFromLeftColumn",
                                     "OpeningType",
                                     "OpeningWidth",
                                     "OpeningHeight",
                                     "PartitionNumber"
                                 FROM
                                     "OpenAreas"
                                 WHERE
                                         "BuildingNumber" = BuildingId
                                     AND "IsDeleted" = 'N';
END ACCESSORIESLOUVERS_LOCATE;
/