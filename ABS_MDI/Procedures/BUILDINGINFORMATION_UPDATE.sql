CREATE OR REPLACE PROCEDURE abs_mdi."BUILDINGINFORMATION_UPDATE" 
(
    BuildingInformationId IN NUMBER,
    BuildingLabel IN VARCHAR2,
    BuildingStructure IN VARCHAR2,
    BuildingName IN VARCHAR2,
    BuildingType IN VARCHAR2,
    Elevation IN VARCHAR2,
    FrameType IN VARCHAR2,
    ProjectId IN NUMBER,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    ModifiedBy IN VARCHAR2,
    AttachmentElevation IN VARCHAR2 DEFAULT NULL,
    HighSideWallElevation IN VARCHAR2 DEFAULT NULL,
    ParentBuildingId IN NUMBER DEFAULT NULL
)
AS 
HighSideWallElevationTemp VARCHAR2(20);
BEGIN
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
    
     UPDATE "BuildingInformation" 
     SET
        "BuildingLabel" = BuildingLabel,
        "Structure" = BuildingStructure,
        "BuildingName" = BuildingName,
        "BuildingType" = BuildingType,
        "Elevation" = Elevation,
        "FrameType" = FrameType,
        "ProjectId" = ProjectId,
        "ModifiedBy" = ModifiedBy,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress,
        "AttachmentElevation" = AttachmentElevation,
        "HighSideWallElevation" = HighSideWallElevationTemp,
        "ParentBuildingId" = ParentBuildingId
     WHERE "BuildingInformationId" = BuildingInformationId;
END BuildingInformation_Update;
/