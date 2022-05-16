CREATE OR REPLACE PROCEDURE abs_mdi."DIAPHRAGMACTIONEXCLUSION_LIST" 
(
    CompanyId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
    SELECT 
        "DiaphragmActionExclusionId",
        "GeoRegions"."GeoRegionId" as "GeoRegionId",
        "GeoRegions"."Name" as "GeoRegionName",
        "CompanyId",
        "IsGeoRegionExclude",
        SDO_UTIL.TO_WKTGEOMETRY("GeoRegions"."Region_New") as Region_New
    FROM "GeoRegions" 
    left outer join "DiaphragmActionExclusions"  on "DiaphragmActionExclusions"."GeoRegionId"="GeoRegions"."GeoRegionId"  AND "CompanyId" = CompanyId
    WHERE "GeoRegions"."IsActive"='Y' and "GeoRegions"."IsDelete" !='Y';
END DIAPHRAGMACTIONEXCLUSION_LIST;
/