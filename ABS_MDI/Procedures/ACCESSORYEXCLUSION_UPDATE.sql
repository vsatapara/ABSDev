CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYEXCLUSION_UPDATE" 
 (
	AccessoryId IN NUMBER,
    ParentCompanyId IN NUMBER,
	GeoRegionId IN NUMBER,
	IsExcluded IN CHAR,
	UserBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS
BEGIN
	UPDATE "AccessoryExclusionZone" SET
		"AccessoryId" = AccessoryId,
        "CompanyId" = ParentCompanyId,
		"GeoRegionId" = GeoRegionId,
		"IsExcluded" = IsExcluded,
        "ModifiedBy" = UserBy,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
	WHERE "AccessoryId" = AccessoryId AND "GeoRegionId" = GeoRegionId AND "CompanyId" = ParentCompanyId
    AND EXISTS (SELECT 1 FROM "AccessoryExclusionZone" WHERE "AccessoryId"=AccessoryId AND "GeoRegionId" = GeoRegionId AND "CompanyId" = ParentCompanyId);
	
     INSERT INTO "AccessoryExclusionZone"
     (
		"AccessoryId",
        "CompanyId",
        "GeoRegionId",
		"IsExcluded",
        "ModifiedBy",
        "ModifiedDate",
        "IpAddress"
     )
	SELECT
		AccessoryId,
        ParentCompanyId,
        GeoRegionId,
		IsExcluded,
        UserBy,
        CURRENT_TIMESTAMP,
        IpAddress
     FROM DUAL
     WHERE NOT EXISTS (SELECT 1 FROM "AccessoryExclusionZone" WHERE "AccessoryId"=AccessoryId AND "GeoRegionId" = GeoRegionId AND "CompanyId" = ParentCompanyId);
END AccessoryExclusion_Update;
/