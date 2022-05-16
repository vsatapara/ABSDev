CREATE OR REPLACE PROCEDURE abs_mdi."INCLUSIONEXCLUSIONSHIPPINGZONE_SELECT" 
(
    InclusionExclusionId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
     SELECT 
         SZ."IsGeoRegionIncluded" AS IsGeoRegionIncluded,
         GEO."GeoRegionId",
         GEO."Name" AS GeoRegionName,
         SZ."Zone"
       FROM "GeoRegions" GEO 
      LEFT OUTER JOIN "ShippingZone"  SZ
      ON GEO."GeoRegionId" = SZ."GeoRegionId"
       AND SZ."InclusionExclusionId" = InclusionExclusionId;
END InclusionExclusionShippingZone_Select;
/