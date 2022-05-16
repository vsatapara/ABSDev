CREATE OR REPLACE PROCEDURE abs_mdi."DIAPHRAGMACTIONEXCLUSION_CREATE" 
(
    GeoRegionId IN NUMBER,
    CompanyId IN NUMBER,
    IsGeoRegionExclude IN CHAR,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    CreatedBy IN NUMBER
)
AS 
BEGIN
     INSERT INTO "DiaphragmActionExclusions"
     (
        "GeoRegionId",
        "CompanyId",
        "CreatedBy",
        "CreatedDate",
        "IsGeoRegionExclude",
        "IpAddress"
     )
     VALUES
     (
        GeoRegionId,
        CompanyId,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IsGeoRegionExclude,
        IpAddress
     );
END DIAPHRAGMACTIONEXCLUSION_CREATE;
/