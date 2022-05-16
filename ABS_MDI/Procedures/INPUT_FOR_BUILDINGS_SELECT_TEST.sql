CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_FOR_BUILDINGS_SELECT_TEST" (
    ProjectId                             IN   NUMBER,
    BuildingInformationId                 IN   NUMBER,
    Accesories_Type                       IN VARCHAR2,
    OUTPUT_INFORMATION                    OUT  SYS_REFCURSOR,
    OUTPUT_GEOMETRY                       OUT  SYS_REFCURSOR,
    OUTPUT_ENDWALL                        OUT  SYS_REFCURSOR,
    OUTPUT_ENDWALL_COLSPACING             OUT  SYS_REFCURSOR,
    OUTPUT_ENDWALL_RECESSES               OUT  SYS_REFCURSOR,
    OUTPUT_ENDWALL_COLUMNSPACING_OPTION   OUT  SYS_REFCURSOR,
    OUTPUT_GIRTSBAYSPACING                OUT  SYS_REFCURSOR,
    OUTPUT_GIRTSBAYSPACING_ROOF           OUT  SYS_REFCURSOR,
    OUTPUT_GIRTSBAYSPACING_GIRT           OUT  SYS_REFCURSOR,
    OUTPUT_GIRTSBAYSPACING_GIRTSPECIFIED  OUT  SYS_REFCURSOR,
    OUTPUT_GIRTSBAYSPACING_WALL           OUT  SYS_REFCURSOR,
    OUTPUT_GIRTSBAYSPACING_PURLIN         OUT  SYS_REFCURSOR,
    OUTPUT_FRAME_GROUP                    OUT  SYS_REFCURSOR,
    OUTPUT_FRAME_LINE                     OUT  SYS_REFCURSOR,
    OUTPUT_FRAME_MODULE                   OUT  SYS_REFCURSOR,
    OUTPUT_FRAME_INTERIORCOLUMN           OUT  SYS_REFCURSOR,
    OUTPUT_BRACING                        OUT  SYS_REFCURSOR,
    OUTPUT_BRACING_PFRAMESIDEWALL         OUT  SYS_REFCURSOR,
    OUTPUT_BRACING_PFRAMEENDWALL          OUT  SYS_REFCURSOR,
    OUTPUT_BRACING_XBRACELOCATION         OUT  SYS_REFCURSOR,
    OUTPUT_DEFLECTION                     OUT  SYS_REFCURSOR,
    OUTPUT_COLLATERAL                     OUT  SYS_REFCURSOR,
    OUTPUT_TRIM                           OUT  SYS_REFCURSOR,
    OUTPUT_TRIMCOLORSELECTIONS            OUT  SYS_REFCURSOR,
    OUTPUT_WALL                           OUT  SYS_REFCURSOR,
    OUTPUT_INSULATION                     OUT  SYS_REFCURSOR,
    OUTPUT_PROJECT                        OUT  SYS_REFCURSOR,
    OUTPUT_ROOF                           OUT  SYS_REFCURSOR,
    OUTPUT_SHOPCOAT                       OUT  SYS_REFCURSOR,
    OUTPUT_ADDLINES                       OUT  SYS_REFCURSOR,
    OUTPUT_LOADS                          OUT  SYS_REFCURSOR,
    OUTPUT_POINTLOADS                     OUT  SYS_REFCURSOR,
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
    Output_Cranes_Data OUT SYS_REFCURSOR    
) AS
    Category  VARCHAR2(40);
    L_COUNT   NUMBER(5);
BEGIN
    OPEN OUTPUT_INFORMATION FOR SELECT
                                    BI."BuildingInformationId",
                                    BI."BuildingLabel",
                                    BI."Structure",
                                    BI."BuildingName",
                                    BI."BuildingType",
                                    BI."Elevation",
                                    BI."FrameType",
                                    BI."ProjectId",
                                    BI."AttachmentElevation",
                                    BI."HighSideWallElevation",
                                    BI."ParentBuildingId",
                                    P."ProjectName",
                                    p."UserRoleId",
                                    BI."IsComplete",
                                    CASE
                                        WHEN p."ProjectBuildingType" = 1    THEN
                                            'Express'
                                        WHEN p."ProjectBuildingType" = 2    THEN
                                            'Standard'
                                        ELSE
                                            ''
                                    END AS "ProjectBuildingType"
                                FROM
                                    "BuildingInformation"  BI,
                                    "Project"              P
                                WHERE
                                        BI."BuildingInformationId" = BuildingInformationId
                                    AND P."ProjectId" = ProjectId
                                    AND BI."IsDelete" != 'Y';
    SELECT
        COUNT(*)
    INTO L_COUNT
    FROM
        "GeometryInformation"
    WHERE
            "BuildingInformationId" = BuildingInformationId
        AND ROWNUM = 1;
    IF ( L_COUNT > 0 ) THEN
        SELECT
            "Category"
        INTO Category
        FROM
            "GeometryInformation"
        WHERE
                "BuildingInformationId" = BuildingInformationId
            AND ROWNUM = 1;
    END IF;
    IF ( Category = 'SymmetricalEndWall' OR Category = 'NonSymmetricalEndWall' ) THEN
        OPEN OUTPUT_GEOMETRY FOR SELECT
                                     "GeometryInformationId",
                                     "BuildingInformationId",
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "Category",
                                     "DistanceToRidgeSideWallB"  AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallD"  AS DistanceToRidgeSideWallTwo,
                                     "EaveHeightSideWallB"       AS EaveHeightSideWallOne,
                                     "EaveHeightSideWallD"       AS EaveHeightSideWallTwo,
                                     "RoofSlopeSideWallB"        AS RoofSlopeSideWallOne,
                                     "RoofSlopeSideWallD"        AS RoofSlopeSideWallTwo,
                                     "XDistance",
                                     "YDistance",
                                     "XDirection",
                                     "YDirection",
                                     "StartColumn",
                                     "StopColumn",
                                     "AttachmentOffset",
                                     "PeakHeight",
                                     "XCoordinate",
                                     "YCoordinate"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    ELSIF ( Category = 'SymmetricalSideWall' OR Category = 'NonSymmetricalSideWall' ) THEN
        OPEN OUTPUT_GEOMETRY FOR SELECT
                                     "GeometryInformationId",
                                     "BuildingInformationId",
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "Category",
                                     "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
                                     "EaveHeightSideWallA"       AS EaveHeightSideWallOne,
                                     "EaveHeightSideWallC"       AS EaveHeightSideWallTwo,
                                     "RoofSlopeSideWallA"        AS RoofSlopeSideWallOne,
                                     "RoofSlopeSideWallC"        AS RoofSlopeSideWallTwo,
                                     "XDistance",
                                     "YDistance",
                                     "XDirection",
                                     "YDirection",
                                     "StartColumn",
                                     "StopColumn",
                                     "AttachmentOffset",
                                     "PeakHeight",
                                     "XCoordinate",
                                     "YCoordinate"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    ELSIF ( Category = 'SingleSlopeEndWallB' OR Category = 'LeanToB' ) THEN
        OPEN OUTPUT_GEOMETRY FOR SELECT
                                     "GeometryInformationId",
                                     "BuildingInformationId",
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "Category",
                                     "DistanceToRidgeSideWallB"  AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallD"  AS DistanceToRidgeSideWallTwo,
                                     "EaveHeightSideWallB"       AS EaveHeightSideWallOne,
                                     "EaveHeightSideWallD"       AS EaveHeightSideWallTwo,
                                     "RoofSlopeSideWallB"        AS RoofSlopeSideWallOne,
                                     "RoofSlopeSideWallD"        AS RoofSlopeSideWallTwo,
                                     "XDistance",
                                     "YDistance",
                                     "XDirection",
                                     "YDirection",
                                     "StartColumn",
                                     "StopColumn",
                                     "AttachmentOffset",
                                     "PeakHeight",
                                     "XCoordinate",
                                     "YCoordinate"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    ELSIF ( Category = 'SingleSlopeSideWallC' OR Category = 'LeanToC' ) THEN
        OPEN OUTPUT_GEOMETRY FOR SELECT
                                     "GeometryInformationId",
                                     "BuildingInformationId",
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "Category",
                                     "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
                                     "EaveHeightSideWallA"       AS EaveHeightSideWallOne,
                                     "EaveHeightSideWallC"       AS EaveHeightSideWallTwo,
                                     "RoofSlopeSideWallA"        AS RoofSlopeSideWallOne,
                                     "RoofSlopeSideWallC"        AS RoofSlopeSideWallTwo,
                                     "XDistance",
                                     "YDistance",
                                     "XDirection",
                                     "YDirection",
                                     "StartColumn",
                                     "StopColumn",
                                     "AttachmentOffset",
                                     "PeakHeight",
                                     "XCoordinate",
                                     "YCoordinate"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    ELSIF ( Category = 'SingleSlopeSideWallA' OR Category = 'LeanToA' ) THEN
        OPEN OUTPUT_GEOMETRY FOR SELECT
                                     "GeometryInformationId",
                                     "BuildingInformationId",
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "Category",
                                     "DistanceToRidgeSideWallA"  AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallC"  AS DistanceToRidgeSideWallTwo,
                                     "EaveHeightSideWallA"       AS EaveHeightSideWallOne,
                                     "EaveHeightSideWallC"       AS EaveHeightSideWallTwo,
                                     "RoofSlopeSideWallA"        AS RoofSlopeSideWallOne,
                                     "RoofSlopeSideWallC"        AS RoofSlopeSideWallTwo,
                                     "XDistance",
                                     "YDistance",
                                     "XDirection",
                                     "YDirection",
                                     "StartColumn",
                                     "StopColumn",
                                     "AttachmentOffset",
                                     "PeakHeight",
                                     "XCoordinate",
                                     "YCoordinate"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    ELSIF ( Category = 'SingleSlopeEndWallD' OR Category = 'LeanToD' ) THEN
        OPEN OUTPUT_GEOMETRY FOR SELECT
                                     "GeometryInformationId",
                                     "BuildingInformationId",
                                     "BuildingWidth",
                                     "BuildingLength",
                                     "Category",
                                     "DistanceToRidgeSideWallB"  AS DistanceToRidgeSideWallOne,
                                     "DistanceToRidgeSideWallD"  AS DistanceToRidgeSideWallTwo,
                                     "EaveHeightSideWallB"       AS EaveHeightSideWallOne,
                                     "EaveHeightSideWallD"       AS EaveHeightSideWallTwo,
                                     "RoofSlopeSideWallB"        AS RoofSlopeSideWallOne,
                                     "RoofSlopeSideWallD"        AS RoofSlopeSideWallTwo,
                                     "XDistance",
                                     "YDistance",
                                     "XDirection",
                                     "YDirection",
                                     "StartColumn",
                                     "StopColumn",
                                     "AttachmentOffset",
                                     "PeakHeight",
                                     "XCoordinate",
                                     "YCoordinate"
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    ELSE
        OPEN OUTPUT_GEOMETRY FOR SELECT
                                     *
                                 FROM
                                     "GeometryInformation"
                                 WHERE
                                     "BuildingInformationId" = BuildingInformationId;
    END IF;
    OPEN OUTPUT_ENDWALL FOR SELECT
                               C1."ProjectId",
                               C1."BuildingNo",
                               C1."EndWallID",
                               C1."FrameType",
                               C1."ElevationType",
                               C1."EndWallNo",
                               C1."ColumnSpacingType",
                               C1."InsulationTrim",
                               C1."NonStandardSetback",
                               C1."DesignedSetback",
                               C1."SpecifiedSetback",
                               C1."BayCount"
                           FROM
                               "Input_Endwall" C1
                           WHERE
                                   C1."BuildingNo" = BuildingInformationId
                               AND NVL(C1."IsDeleted", 'N') = 'N'
                           ORDER BY
                               C1."EndWallNo";
    OPEN OUTPUT_ENDWALL_COLSPACING FOR SELECT
                                          C1."ProjectId",
                                          C1."BuildingNo",
                                          C1."EndWallNo",
                                          C1."EndWallID",
                                          C2."CSType",
                                          C2."BayNo",
                                          C2."BaySpacing",
                                          C2."CSID"
                                      FROM
                                               "Input_Endwalls_ColumnSpacing" C2
                                          JOIN "Input_Endwall" C1 ON C1."EndWallID" = C2."EndWallID"
                                      WHERE
                                              C1."BuildingNo" = BuildingInformationId
                                          AND NVL(C2."IsDeleted", 'N') = 'N'
                                          AND NVL(C1."IsDeleted", 'N') = 'N'
                                      ORDER BY
                                          C1."EndWallNo",
                                          C2."CSID";
    OPEN OUTPUT_ENDWALL_RECESSES FOR SELECT
                                        C1."ProjectId",
                                        C1."BuildingNo",
                                        C1."EndWallNo",
                                        C1."EndWallID",
                                        C2."EWRType",
                                        C2."RecessNo",
                                        C2."Recesses",
                                        C2."EWRID"
                                    FROM
                                             "Input_Endwalls_Recesses" C2
                                        JOIN "Input_Endwall" C1 ON C1."EndWallID" = C2."EndWallID"
                                    WHERE
                                            C1."BuildingNo" = BuildingInformationId
                                        AND NVL(C2."IsDeleted", 'N') = 'N'
                                        AND NVL(C1."IsDeleted", 'N') = 'N'
                                    ORDER BY
                                        C1."EndWallNo",
                                        C2."EWRID";
    OPEN OUTPUT_ENDWALL_COLUMNSPACING_OPTION FOR SELECT
                                                    *
                                                FROM
                                                    "OpenAreas"
                                                WHERE
                                                        "BuildingNumber" = BuildingInformationId and "OpenEndwall" != 0
                                                    AND NVL("IsDeleted", 'N') = 'N' ;
    OPEN OUTPUT_GIRTSBAYSPACING FOR SELECT
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
                                       BaySpacing."LBPMaxDepth",
                                       BaySpacing."OptimizePurlin",
                                       GPD."DepthValue" "PurlinDepth"
                                   FROM
                                            "Input_GirtsBaySpacing" BaySpacing
                                       JOIN "BuildingInformation" Info ON BaySpacing."BuildingInformationId" = Info."BuildingInformationId"
                                       JOIN "GirtsAndPurlinDepth" GPD ON  BaySpacing."RoofPurlinDepth" = GPD."DepthId"
                                   WHERE
                                           BaySpacing."BuildingInformationId" = BuildingInformationId
                                       AND Info."ProjectId" = ProjectId
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
                                                Roof."BuildingInformationId" = BuildingInformationId
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
                                                BaySpacing."BuildingInformationId" = BuildingInformationId
                                            AND Info."ProjectId" = ProjectId;
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
                                                         BaySpacing."BuildingInformationId" = BuildingInformationId
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
                                                BaySpacing."BuildingInformationId" = BuildingInformationId
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
                                                  BaySpacing."BuildingInformationId" = BuildingInformationId
                                              AND Info."ProjectId" = ProjectId;
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
                                   AND c1."BuildingNumber" = BuildingInformationId
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
                                      c1."ProjectId" = projectid
                                  AND c1."BuildingNumber" = buildinginformationid;
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
                                        c1."ProjectId" = projectid
                                    AND c1."BuildingNumber" = buildinginformationid;
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
                                                c1."ProjectId" = projectid
                                            AND c1."BuildingNumber" = buildinginformationid;
    OPEN OUTPUT_BRACING FOR SELECT
                               "BracingId",
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
                               "Purlins",
                               "Girts",
                               "ErectionRods",
                               "AllowTorsion",
                               "ErectionBayWidth",
                               "RafterFlangeBrace",
                               "ColumnFlangeBrace",
                               "SW1PFrameType",
                               "SW1PFrameHeight",
                               "PortalRafterDepth1",
                               "SW2PFrameType",
                               "SW2PFrameHeight",
                               "PortalRafterDepth2",
                               "SW1FBBCRight",
                               "SW2FBBCRight",
                               "SW1Girts",
                               "SW2Girts",
                               "EW3Girts",
                               "EW4Girts",
                               "EW3PFrameType",
                               "EW3PFrameHeight",
                               "PortalRafterDepth3",
                               "EW4PFrameType",
                               "EW4PFrameHeight",
                               "PortalRafterDepth4",
                               "OverrideFlangeBraceRoof",
                               "OverrideFlangeBraceWall",
                               "BuildingInformationId",
                               "LBPBracingLocation",
                               "IsReset"
                           FROM
                               "Bracing"
                           WHERE
                               "BuildingInformationId" = BuildingInformationId;
    OPEN OUTPUT_BRACING_PFRAMESIDEWALL FOR SELECT
                                              "PortalFrameId",
                                              "SW1Height",
                                              "SW1HeightValue",
                                              "SW1RodTiers",
                                              "SW1WebDepthMaxColumn",
                                              "SW1WebDepthMaxRafter",
                                              "SW2Height",
                                              "SW2HeightValue",
                                              "SW2RodTiers",
                                              "SW2WebDepthMaxColumn",
                                              "SW2WebDepthMaxRafter",
                                              "BracingId",
                                              "BuildingInformationId"
                                          FROM
                                              "SideWallPortalFrame"
                                          WHERE
                                              "BuildingInformationId" = BuildingInformationId;
    OPEN OUTPUT_BRACING_PFRAMEENDWALL FOR SELECT
                                             "EndWallProtalFrameId",
                                             "EW3Height",
                                             "EW3HeightValue",
                                             "EW3RodTiers",
                                             "EW3WebDepthMaxColumn",
                                             "EW3WebDepthMaxRafter",
                                             "EW4Height",
                                             "EW4HeightValue",
                                             "EW4RodTiers",
                                             "EW4WebDepthMaxColumn",
                                             "EW4WebDepthMaxRafter",
                                             "BracingId",
                                             "BuildingInformationId"
                                         FROM
                                             "EndWallPotalFrame"
                                         WHERE
                                             "BuildingInformationId" = BuildingInformationId;
    OPEN OUTPUT_BRACING_XBRACELOCATION FOR SELECT
                                              "XBraceAnchorId",
                                              "BayNumber",
                                              "DistFromLeftCornerLeft",
                                              "DistFromLeftColumnLeft",
                                              "DistFromLeftCornerRight",
                                              "DistFromLeftColumnRight",
                                              "LeftSteelLine",
                                              "Elevation",
                                              "BracingId",
                                              "BuildingInformationId"
                                          FROM
                                              "Bracing_XBraceAnchor"
                                          WHERE
                                              "BuildingInformationId" = BuildingInformationId;
    OPEN OUTPUT_DEFLECTION FOR SELECT
                                  "DeflectionId",
                                  "ProjectId",
                                  "BuildingNumber",
                                  "PurlinsLive",
                                  "PurlinsSnow",
                                  "PurlinsWind",
                                  "PurlinsGravity",
                                  "PurlinsUplift",
                                  "RaftersLive",
                                  "RaftersSnow",
                                  "RaftersWind",
                                  "RaftersGravity",
                                  "RaftersUplift",
                                  "WallGirts",
                                  "WallCol",
                                  "WallWind",
                                  "RoofLive",
                                  "RoofSnow",
                                  "RoofWind",
                                  "RoofGravity",
                                  "RoofUplift",
                                  "FrameLive",
                                  "FrameSnow",
                                  "FrameWind",
                                  "FrameSeismic",
                                  "FrameCrane",
                                  "FrameTotalWind",
                                  "FrameTotalSeismic",
                                  "FrameTotalGravity",
                                  "FramePortalWind",
                                  "FramePortalSeismic",
                                  "SuspendedCeiling",
                                  "FaceBrickWall",
                                  "DryvitFinish",
                                  "PurlinsLiveFlag",
                                  "PurlinsSnowFlag",
                                  "PurlinsWindFlag",
                                  "PurlinsGravityFlag",
                                  "PurlinsUpliftFlag",
                                  "RaftersLiveFlag",
                                  "RaftersSnowFlag",
                                  "RaftersWindFlag",
                                  "RaftersGravityFlag",
                                  "RaftersUpliftFlag",
                                  "WallGirtsFlag",
                                  "WallColFlag",
                                  "WallWindFlag",
                                  "RoofLiveFlag",
                                  "RoofSnowFlag",
                                  "RoofWindFlag",
                                  "RoofGravityFlag",
                                  "RoofUpliftFlag",
                                  "FrameLiveFlag",
                                  "FrameSnowFlag",
                                  "FrameWindFlag",
                                  "FrameSeismicFlag",
                                  "FrameCraneFlag",
                                  "FrameTotalWindFlag",
                                  "FrameTotalSeismicFlag",
                                  "FrameTotalGravityFlag",
                                  "FramePortalWindFlag",
                                  "FramePortalSeismicFlag",
                                  "RoofPanelLive",
                                  "RoofPanelSnow",
                                  "RoofPanelWind",
                                  "RoofPanelGravity",
                                  "RoofPanelUplift",
                                  "WallPanel",
                                  "RoofPanelLiveFlag",
                                  "RoofPanelSnowFlag",
                                  "RoofPanelWindFlag",
                                  "RoofPanelGravityFlag",
                                  "RoofPanelUpliftFlag",
                                  "WallPanelFlag",
                                  "UserAccept",
                                  "AdvFrames",
                                  "AdvPurlins",
                                  "AdvRafters",
                                  "TempInteger1",
                                  "TempInteger2",
                                  "TempInteger3",
                                  "TempDouble1",
                                  "TempDouble2",
                                  "TempDouble3",
                                  "TempString1",
                                  "TempString2",
                                  "TempString3",
                                  "CreatedBy",
                                  "CreatedDate",
                                  "ModifiedBy",
                                  "ModifiedDate",
                                  "IpAddress",
                                  "IsDeleted"
                              FROM
                                  "Deflections"
                              WHERE
                                      "ProjectId" = projectid
                                  AND "BuildingNumber" = BuildingInformationId;
    OPEN OUTPUT_COLLATERAL FOR SELECT
                                  "CollateralId",
                                  "ProjectId",
                                  "BuildingNumber",
                                  "CeilingLoad",
                                  "SprinklerLoad",
                                  "OtherLoad",
                                  "PlasterSheetrock",
                                  "RoofLoad",
                                  "FrameLoad",
                                  "BuildingCode",
                                  "Occupancy",
                                  "ThermalFactor",
                                  "BurLoad",
                                  "CalcRoofSnowLoad",
                                  "ProjectNumber",
                                  "BuildingCodeDesign",
                                  "ImportanceWind",
                                  "ImportanceSnow",
                                  "ImportanceSeismic",
                                  "WindEnclosureInput",
                                  "WindEnclosureDesign",
                                  "Escarpment",
                                  "SnowDrift",
                                  "StorageBuilding",
                                  "SlipperyRoof",
                                  "SeismicDesignCategory",
                                  "Figure6_6Frame",
                                  "BaseWindElevation",
                                  "TempString1",
                                  "TempString2",
                                  "TempString3",
                                  "TempDouble1",
                                  "TempDouble2",
                                  "TempDouble3",
                                  "TempInteger1",
                                  "TempInteger2",
                                  "TempInteger3",
                                  "Sw1SnowDrift",
                                  "Sw2SnowDrift",
                                  "Ew3SnowDrift",
                                  "Ew4SnowDrift",
                                  "HasSwSnowDrift",
                                  "HasEwSnowDrift",
                                  "SnowExposure",
                                  "UnobstructedFlow",
                                  "WindLoad",
                                  "BelowWindMin",
                                  "DeflectionWindSpeed",
                                  "SdsOverride",
                                  "Sd1Override",
                                  "CreatedBy",
                                  "CreatedDate",
                                  "ModifiedBy",
                                  "ModifiedDate",
                                  "IpAddress",
                                  "IsDeleted"
                              FROM
                                  "Collaterals"
                              WHERE
                                      "ProjectId" = projectid
                                  AND "BuildingNumber" = BuildingInformationId;
    OPEN OUTPUT_TRIM FOR SELECT
                            "TrimId",
                            "BuildingNumber",
                            "SW1TrimOption",
                            "SW2TrimOption",
                            "EW3TrimOption",
                            "EW4TrimOption",
                            "SW1NorthernGutter",
                            "SW2NorthernGutter",
                            "EW3NorthernGutter",
                            "EW4NorthernGutter",
                            "SW1GutterSize",
                            "SW2GutterSize",
                            "EW3GutterSize",
                            "EW4GutterSize",
                            "SW1IncludeElbows",
                            "SW2IncludeElbows",
                            "EW3IncludeElbows",
                            "EW4IncludeElbows",
                            "SW1Drops",
                            "SW2Drops",
                            "EW3Drops",
                            "EW4Drops",
                            "SW1DropHeight",
                            "SW2DropHeight",
                            "EW3DropHeight",
                            "EW4DropHeight",
                            "TrimProfile",
                            "AdditionalGutterSupports",
                            "IsSW1MatchEavaHeight",
                            "IsSW2MatchEavaHeight",
                            "IsEW3MatchEavaHeight",
                            "IsEW4MatchEavaHeight",
                            "SW1GutterDesignSize",
                            "SW2GutterDesignSize",
                            "EW3GutterDesignSize",
                            "EW4GutterDesignSize",
                            P."GroundSnow"
                        FROM
                                 "Input_Trim"
                            JOIN "Project" P ON "ProjectId" = ProjectId
                        WHERE
                            "BuildingNumber" = BuildingInformationId;
        --SELECT * FROM "Input_Trim" WHERE "BuildingNumber" = BuildingInformationId and NVL("IsDelete",'N')='N';
        --SELECT "GroundSnow" FROM "Project" WHERE "ProjectId" = ProjectId;

                    OPEN OUTPUT_TRIMCOLORSELECTIONS FOR SELECT
                                           *
                                       FROM
                                           "Input_TrimColorSelections"
                                       WHERE
                                               "BuildingNumber" = BuildingInformationId
                                           AND NVL("IsDelete", 'N') = 'N';
    OPEN OUTPUT_WALL FOR SELECT
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
                            Wall."RValue",
                            Wall."UValue",
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
                            PanelType."Type"             "TypeName",
                            PanelDropdown."Value"        "BaseFramingName",
                            BaseFlashDropdown."Value"    "BaseFlashName",
                            GaugeDropdown."Value"        "GaugeValue"
                        FROM
                                 "Input_Wall" Wall
                            JOIN "BuildingInformation"        Info ON Wall."BuildingInformationId" = Info."BuildingInformationId"
                            JOIN "Input_TrimColorSelections"  ColorSel ON Wall."BuildingInformationId" = ColorSel."BuildingNumber"
                            JOIN "M_PanelType"                PanelType ON Wall."Type" = PanelType."Id"
                            LEFT JOIN "M_Panel_Dropdown"           PanelDropdown ON Wall."BaseFraming" = PanelDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"           BaseFlashDropdown ON Wall."BaseFlash" = BaseFlashDropdown."Id"
                            LEFT JOIN "M_Panel_Dropdown"           GaugeDropdown ON Wall."Gauge" = GaugeDropdown."Id"
                        WHERE
                                Wall."BuildingInformationId" = BuildingInformationId
                            AND Info."ProjectId" = ProjectId
                            AND Wall."IsDelete" != 'Y';
    OPEN OUTPUT_INSULATION FOR SELECT
                                  NVL("BuildingInformationId", 0)      "BuildingNumber",
                                  NVL("BuildingHasInsulation", -1)      "BuildingHasInsulation",
                                  NVL("InsulationByBrand", 0)          "InsulationByBrand",
                                  NVL("ComCheck", 0)                   "ComCheck"
                              FROM
                                  "BuildingInformation"
                              WHERE
                                      "BuildingInformationId" = BuildingInformationId
                                  AND "IsDelete" != 'Y';
    OPEN OUTPUT_PROJECT FOR SELECT
                               Project."ProjectId",
                               Project."SeismicSa",
                               Project."Country",
                               Project."State",
                               Project."SeismicS1",
                               Project."SiteClassId",
                               Project."WindSpeed",
                               Project."WindExposureId",
                               Project."WindLoad",
                               Project."GroundSnow",
                               Project."DesignCodeName",
                               Project."WindLoadType",
                               Project."RainIntensity",
                               SiteClasses."Name" "SoilType"
                           FROM
                               "Project"          Project
                               LEFT JOIN "CLM_SiteClasses"  SiteClasses ON Project."SiteClassId" = SiteClasses."SiteClassId"
                           WHERE
                               "ProjectId" = ProjectId;
    OPEN OUTPUT_ROOF FOR SELECT
                            Roof."RoofId",
                            Roof."Type",
                            Roof."Width",
                            Roof."ULRating",
                            Roof."Thick",
                            Roof."Profile",
                            Roof."Gauge",
                            Roof."InteriorSkinProfile",
                            Roof."InteriorSkinGauge",
                            Roof."InteriorSkinTexture",
                            Roof."IncludeToolKit",
                            Roof."ProvideHandTools",
                            Roof."ColdStorageBuilding",
                            Roof."FactoryAppliedSealant",
                            Roof."FastenerType",
                            Roof."FastenerHeadFinish",
                            Roof."FastenerLength",
                            Roof."Warranty",
                            Roof."WeathertightnessTerm",
                            Roof."HasSnowRetentionSystem",
                            Roof."SnowRetentionRp1",
                            Roof."SnowRetentionRp2",
                            Roof."SnowRetentionRp3",
                            Roof."SnowRetentionRp4",
                            Roof."ThermalBlockType",
                            Roof."FMRating",
                            Roof."EaveIcing",
                            Roof."WideTape",
                            Roof."Clip",
                            Roof."StructScrews",
                            Roof."StitchScrews",
                            Roof."Material",
                            Roof."ThermalBlock",
                            Roof."MetalRibClosure",
                            Roof."SealedRoof",
                            Roof."RidgePan",
                            Roof."AlignmentStrip",
                            Roof."ULLetter",
                            Roof."EavePanelExtension",
                            Roof."IsBuyout",
                            Roof."SquareFeet",
                            Roof."ThermalBlockThickness",
                            Roof."ProvideBlocks",
                            Roof."RoofFirst",
                            Roof."InsulationClips",
                            Roof."Weathertightness",
                            Roof."SealedEave",
                            Roof."ThickInsulation",
                            Roof."RTSSystem",
                            Roof."RTSFinish",
                            Roof."RTSPanelType",
                            Roof."RTSThickness",
                            Roof."RTSSpacing",
                            Roof."RTSPanelGauge",
                            Roof."SeamerRental",
                            Roof."BuildingInformationId",
                            Roof."BURLoad",
                            Roof."NotByStar",
                            Roof."IncludeSnowClipPerPanel",
                            Roof."SnowClipQuantity",
                            Roof."ColorStripQuantity",
                            Roof."ExteriorSkinTexture",
                            Roof."FinishWarranty",
                            Roof."RValue",
                            Roof."Rp1SnowLoad",
                            Roof."Rp2SnowLoad",
                            Roof."Rp3SnowLoad",
                            Roof."Rp4SnowLoad",
                            ColorSel."RoofPanel",
                            ColorSel."RoofPanelValsparCode",
                            ColorSel."RoofPanelSpecialName",
                            ColorSel."RoofInteriorSkin",
                            ColorSel."RoofInteriorSkinValsparCode",
                            ColorSel."RoofInteriorSkinSpecialName"
                        FROM
                                 "Input_Roof" Roof
                            JOIN "BuildingInformation"        Info ON Roof."BuildingInformationId" = Info."BuildingInformationId"
                            JOIN "Input_TrimColorSelections"  ColorSel ON Roof."BuildingInformationId" = ColorSel."BuildingNumber"
                        WHERE
                            Roof."BuildingInformationId" = BuildingInformationId;
    OPEN OUTPUT_SHOPCOAT FOR SELECT
                                ShopCoat."ShopCoatId",
                                ShopCoat."BuildingInformationId",
                                ShopCoat."GalvanizedSecondary",
                                ShopCoat."SealWelds",
                                ShopCoat."HotDippedPrimary",
                                ShopCoat."HotDippedPrice",
                                ShopCoat."HotDippedWeight",
                                ShopCoat."SealWeldsPrice",
                                ShopCoat."SealWeldsWeight",
                                ShopCoat."QuoteNumber",
                                ShopCoat."QuoteYear",
                                ShopCoat."EstimatorInitials",
                                ShopCoat."ExpiresOn",
                                ShopCoat."BoltFinish",
                                ShopCoat."ShopCoatDrpId"
                            FROM
                                     "Input_ShopCoat" ShopCoat
                                JOIN "BuildingInformation" Info ON ShopCoat."BuildingInformationId" = Info."BuildingInformationId"
                            WHERE
                                    ShopCoat."BuildingInformationId" = BuildingInformationId
                                AND Info."ProjectId" = ProjectId
                                AND ShopCoat."IsDelete" != 'Y';
    OPEN OUTPUT_ADDLINES FOR SELECT
                                AddLines."AddLinesId",
                                LOWER(RAW_TO_GUID(AddLines."Guid")) Guid,
                                AddLines."ScreenType"
                            FROM
                                     "Input_AddLines" AddLines
                                JOIN "BuildingInformation" Info ON AddLines."BuildingInformationId" = Info."BuildingInformationId"
                            WHERE
                                    AddLines."BuildingInformationId" = BuildingInformationId
                                AND AddLines."ScreenType" = 'ShopCoat'
                                AND Info."ProjectId" = ProjectId;
    OPEN OUTPUT_LOADS FOR SELECT
                             G."WindEnclosure",
                             G."AccessoryEnclosure",
                             G."OAEnclosure",
                             C."Occupancy",
                             C."ThermalFactor",
                             C."UnobstructedFlow",
                             C."WindLoad",
                             C."BelowWindMin",
                             C."DeflectionWindSpeed",
                             S."EscarpmentId",
                             S."ProjectId",
                             S."BuildingNumber",
                             S."HillHeight",
                             S."Lh",
                             S."CrestDistance",
                             S."CrestUpwind",
                             S."FlatUpwindTerrain",
                             S."HillTallerBy2",
                             S."UpperHalfOfHill",
                             S."2ndRidgeOfHill",
                             S."TempString1",
                             S."TempString2",
                             S."TempDouble1",
                             S."TempDouble2",
                             S."TempInteger1",
                             S."TempInteger2",
                             S."Answers",
                             S."QuestionsAnswered",
                             S."Kzt"
                         FROM
                                  "Escarpment" S
                             JOIN "Collaterals"          C ON S."BuildingNumber" = C."BuildingNumber"
                             JOIN "GeometryInformation"  G ON S."BuildingNumber" = G."BuildingInformationId"
                         WHERE
                                 S."ProjectId" = ProjectId
                             AND S."BuildingNumber" = BuildingInformationId
                             AND S."IsDeleted" != 'Y';
    OPEN OUTPUT_POINTLOADS FOR SELECT
                                  P."PointLoadId",
                                  P."ProjectId",
                                  P."BuildingNumber",
                                  P."BayNumber",
                                  P."DistFromWall",
                                  P."DistFromFrame",
                                  P."Type",
                                  P."Load",
                                  P."Description",
                                  P."UnitLocation",
                                  P."InsideLength",
                                  P."InsideWidth",
                                  P."UnitDimension",
                                  P."CutPurlins",
                                  P."UnitLength",
                                  P."UnitWidth",
                                  P."UnitHeight",
                                  P."NumBeams",
                                  P."BeamByManufacturer",
                                  P."Number",
                                  P."IsCopy",
                                  P."OverlapOverride"
                              FROM
                                  "PointLoads" P
                              WHERE
                                      P."ProjectId" = ProjectId
                                  AND P."BuildingNumber" = BuildingInformationId
                                  AND P."IsDeleted" != 'Y';
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
                                        "BuildingId"=BuildingInformationId
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
                            "BuildingInformationId"=BuildingInformationId
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
                                    Where  AL."BuildingId"=BuildingInformationId
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
                                    Where  AD."BuildingId"=BuildingInformationId
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
                                    Where "BuildingNumber" = BuildingInformationId
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
                                                where APE."BuildingNumber" = BuildingInformationId 
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
                                "BuildingNumber" = BuildingInformationId
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
                                 P."BuildingNumber" = BuildingInformationId
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
                                          "BuildingNumber" = BuildingInformationId
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
                                WHERE "BuildingNumber"=BuildingInformationId
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
                            Where "BuildingNumber" = BuildingInformationId
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
                                    Where  AW."BuildingNumber"=BuildingInformationId
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
                                    Where  "BuildingInformationId"=BuildingInformationId
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
                                    Where  "BuildingInformationId"=BuildingInformationId
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
                                    Where  "BuildingNumber"=BuildingInformationId
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
                                    Where  "BuildingId"=BuildingInformationId
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
                                        Where  Liners."BuildingNumber"=BuildingInformationId
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
                                        "BuildingId"=BuildingInformationId
                                    AND "ProjectId" = ProjectId
                                    AND "IsDelete" = 'N';
    END IF;
END INPUT_FOR_BUILDINGS_SELECT_TEST;
/