CREATE OR REPLACE PROCEDURE abs_mdi."INCLUSIONEXCLUSIONSHIPPINGZONEWITHCORDINATES_LIST" 
(
    CompanyId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
       SELECT 
         SZ."CompanyId",
         SZ."IsGeoRegionIncluded",
         GEO."GeoRegionId",
         GEO."Name" AS GeoRegionName ,
         GEO."Region" AS Coordinates ,
         SZ."Zone"
       FROM "GeoRegions" GEO 
      INNER JOIN "ShippingZone"  SZ
      ON GEO."GeoRegionId" = SZ."GeoRegionId"
       AND SZ."CompanyId" = CompanyId;
       --WHERE SZ."Zone" = 'Y';
END InclusionExclusionShippingZoneWithCordinates_List;
/