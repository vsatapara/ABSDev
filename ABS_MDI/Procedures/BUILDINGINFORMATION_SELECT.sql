CREATE OR REPLACE PROCEDURE abs_mdi."BUILDINGINFORMATION_SELECT" 
(
    BuildingInformationId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN Output_Data FOR 
        SELECT
            "BuildingInformationId",
            "BuildingLabel",
            "Structure",
            "BuildingName",
            "BuildingType",
            "Elevation",
            "FrameType",
            "ProjectId",
            "AttachmentElevation",
            "HighSideWallElevation",
            "ParentBuildingId"
        FROM
            "BuildingInformation"
        WHERE "BuildingInformationId" = BuildingInformationId and "IsDelete" != 'Y';
END BuildingInformation_Select;
/