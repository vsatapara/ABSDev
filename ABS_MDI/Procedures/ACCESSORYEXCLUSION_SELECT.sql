CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYEXCLUSION_SELECT" 
(
    AccessoryId IN NUMBER,
    CompanyId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
       SELECT 
         AEZ."AccessoryExclusionId",
         AEZ."AccessoryId",
         AEZ."IsExcluded",
         GEO."GeoRegionId",
         GEO."Name" AS GeoRegion  
       FROM "GeoRegions" GEO 
     LEFT JOIN  "AccessoryExclusionZone" AEZ 
      ON GEO."GeoRegionId" = AEZ."GeoRegionId" AND AEZ."CompanyId" = CompanyId
       AND AEZ."AccessoryId" = AccessoryId 
       WHERE GEO."IsActive" = 'Y' AND GEO."IsDelete" = 'N';
END AccessoryExclusion_Select;
/