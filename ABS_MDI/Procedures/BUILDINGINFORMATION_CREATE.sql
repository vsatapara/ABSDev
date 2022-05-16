CREATE OR REPLACE PROCEDURE abs_mdi."BUILDINGINFORMATION_CREATE" (
    BuildingLabel          IN   VARCHAR2,
    BuildingStructure      IN   VARCHAR2,
    BuildingName           IN   VARCHAR2,
    BuildingType           IN   VARCHAR2,
    Elevation              IN   VARCHAR2,
    FrameType              IN   VARCHAR2,
    ProjectId              IN   NUMBER,
    IpAddress              IN   VARCHAR2 DEFAULT NULL,
    CreatedBy              IN   VARCHAR2,
    AttachmentElevation    IN   VARCHAR2 DEFAULT NULL,
    HighSideWallElevation  IN   VARCHAR2 DEFAULT NULL,
    ParentBuildingId       IN   NUMBER DEFAULT NULL,
    OutputId               OUT  NUMBER
) AS
    IsBuildingExist            NUMBER DEFAULT 0;
    BuildingInformationId      NUMBER DEFAULT 0;
    HighSideWallElevationTemp  VARCHAR2(20);
BEGIN
    SELECT
        COUNT(*)
    INTO IsBuildingExist
    FROM
        "BuildingInformation"
    WHERE
            "BuildingLabel" = BuildingLabel
        AND "ProjectId" = ProjectId
        AND "IsDelete" != 'Y';
    IF IsBuildingExist = 0 THEN
        HighSideWallElevationTemp := HighSideWallElevation;
        IF FrameType = 'Lean-to' THEN
            BEGIN
                IF AttachmentElevation = 'EWA' THEN
                    HighSideWallElevationTemp := 'EWC';
                ELSIF AttachmentElevation = 'EWC' THEN
                    HighSideWallElevationTemp := 'EWA';
                ELSIF AttachmentElevation = 'EWB' THEN
                    HighSideWallElevationTemp := 'EWD';
                ELSIF AttachmentElevation = 'EWD' THEN
                    HighSideWallElevationTemp := 'EWB';
                ELSIF AttachmentElevation = 'SWA' THEN
                    HighSideWallElevationTemp := 'SWC';
                ELSIF AttachmentElevation = 'SWC' THEN
                    HighSideWallElevationTemp := 'SWA';
                ELSIF AttachmentElevation = 'SWB' THEN
                    HighSideWallElevationTemp := 'SWD';
                ELSIF AttachmentElevation = 'SWD' THEN
                    HighSideWallElevationTemp := 'SWB';
                END IF;
            END;
        END IF;
        INSERT INTO "BuildingInformation" (
            "BuildingLabel",
            "Structure",
            "BuildingName",
            "BuildingType",
            "Elevation",
            "FrameType",
            "ProjectId",
            "CreatedBy",
            "CreatedDate",
            "IpAddress",
            "IsDelete",
            "AttachmentElevation",
            "HighSideWallElevation",
            "ParentBuildingId"
        ) VALUES (
            BuildingLabel,
            BuildingStructure,
            BuildingName,
            BuildingType,
            Elevation,
            FrameType,
            ProjectId,
            CreatedBy,
            CURRENT_TIMESTAMP,
            IpAddress,
            'N',
            AttachmentElevation,
            HighSideWallElevationTemp,
            ParentBuildingId
        ) RETURNING "BuildingInformationId" INTO OutputId;
    ELSE
        SELECT
            "BuildingInformationId"
        INTO BuildingInformationId
        FROM
            "BuildingInformation"
        WHERE
                "BuildingLabel" = BuildingLabel
            AND "ProjectId" = ProjectId
            AND ROWNUM < 2;
        OutputId := BuildingInformationId;
        BuildingInformation_Update(BuildingInformationId => BuildingInformationId, BuildingLabel => BuildingLabel,
                                  BuildingStructure => BuildingStructure,
                                  BuildingName => BuildingName,
                                  BuildingType => BuildingType,
                                  Elevation => Elevation,
                                  FrameType => FrameType,
                                  ProjectId => ProjectId,
                                  IpAddress => IpAddress,
                                  ModifiedBy => CreatedBy,
                                  AttachmentElevation => AttachmentElevation,
                                  HighSideWallElevation => HighSideWallElevation,
                                  ParentBuildingId => ParentBuildingId);
    END IF;
END BuildingInformation_Create;
/