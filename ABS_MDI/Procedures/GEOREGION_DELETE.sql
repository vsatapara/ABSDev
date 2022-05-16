CREATE OR REPLACE PROCEDURE abs_mdi."GEOREGION_DELETE" 
(
    GeoRegionId IN NUMBER,
    UserId IN NUMBER
)
AS 
BEGIN
    UPDATE "GeoRegions" SET
        "IsDelete" = 'Y',
        "ModifiedBy" = UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP
    WHERE "GeoRegionId" = GeoRegionId;
    
    delete from "ShippingZone" where "GeoRegionId"=GeoRegionId;
    delete from "AccessoryExclusionZone" where "GeoRegionId"=GeoRegionId;
    
    delete from "DiaphragmActionExclusions" where "GeoRegionId"=GeoRegionId;
END GEOREGION_DELETE;
/