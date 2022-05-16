CREATE OR REPLACE PROCEDURE abs_mdi."DIAPHRAGMACTIONEXCLUSIONGEOREGIONWITHCORDINATES_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
       SELECT 
         "GeoRegionId",
         "Name",
         "Region" 
       FROM "GeoRegions" 
       WHERE "GeoRegionId" NOT IN (Select distinct "GeoRegionId" from "DiaphragmActionExclusions")
       AND "GeoRegions"."IsActive" = 'Y' AND "IsDelete" != 'Y';
END DiaphragmActionExclusionGeoRegionWithCordinates_List;
/