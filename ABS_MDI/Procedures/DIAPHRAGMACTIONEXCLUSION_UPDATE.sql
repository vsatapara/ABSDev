CREATE OR REPLACE PROCEDURE abs_mdi."DIAPHRAGMACTIONEXCLUSION_UPDATE" 
(
    DiaphragmActionExclusionId IN NUMBER,
    GeoRegionId IN NUMBER,
    CompanyId IN NUMBER,
    IsGeoRegionExclude IN CHAR,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    ModifiedBy IN NUMBER
)
AS 
BEGIN
     UPDATE "DiaphragmActionExclusions" SET
        "GeoRegionId" = GeoRegionId,
        "CompanyId" = CompanyId,
        "IpAddress" = IpAddress,
        "ModifiedBy" = ModifiedBy,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IsGeoRegionExclude" = IsGeoRegionExclude
    WHERE "DiaphragmActionExclusionId"= DiaphragmActionExclusionId;
END DIAPHRAGMACTIONEXCLUSION_UPDATE;
/