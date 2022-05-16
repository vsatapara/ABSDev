CREATE OR REPLACE PROCEDURE abs_mdi."INCLUSIONEXCLUSIONSHIPPINGZONE_UPDATE" 
(
	InclusionExclusionId IN NUMBER,
	GeoRegionId IN NUMBER,
	IsGeoRegionIncluded IN CHAR,
	Zone IN CHAR,
	UserBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS
BEGIN
	UPDATE "ShippingZone" SET
		"InclusionExclusionId" = InclusionExclusionId,
		"GeoRegionId" = GeoRegionId,
		"IsGeoRegionIncluded" = IsGeoRegionIncluded,
        "Zone" = Zone,
        "ModifiedBy" = UserBy,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
	WHERE "InclusionExclusionId" = InclusionExclusionId AND "GeoRegionId" = GeoRegionId
    AND EXISTS (SELECT 1 FROM "ShippingZone" WHERE "InclusionExclusionId"=InclusionExclusionId AND "GeoRegionId" = GeoRegionId);
	
     INSERT INTO "ShippingZone"
     (
		"InclusionExclusionId",
        "GeoRegionId",
		"IsGeoRegionIncluded",
        "Zone",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
     )
	SELECT
		InclusionExclusionId,
        GeoRegionId,
		IsGeoRegionIncluded,
        Zone,
        UserBy,
        CURRENT_TIMESTAMP,
        IpAddress
     FROM DUAL
     WHERE NOT EXISTS (SELECT 1 FROM "ShippingZone" WHERE "InclusionExclusionId"=InclusionExclusionId AND "GeoRegionId" = GeoRegionId);
END InclusionExclusionShippingZone_Update;
/