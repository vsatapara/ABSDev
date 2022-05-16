CREATE OR REPLACE PROCEDURE abs_mdi."INCLUSIONEXCLUSIONSHIPPINGZONE_LIST" 
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
         SZ."Zone",
         SDO_UTIL.TO_WKTGEOMETRY(GEO."Region_New") as Region_New
       FROM "GeoRegions" GEO 
      LEFT OUTER JOIN "ShippingZone"  SZ
      ON GEO."GeoRegionId" = SZ."GeoRegionId"
       AND SZ."CompanyId" = CompanyId
    WHERE GEO."IsDelete" = 'N' and GEO."IsActive"='Y';
END InclusionExclusionShippingZone_List;
/