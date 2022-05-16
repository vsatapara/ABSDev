CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYEXCLUSION_LIST" 
(
    CompanyId in Number,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
    --SELECT
    --"AccessoryExclusionZone"."AccessoryId"    AS "AccessoryId",
    --LISTAGG("GeoRegions"."Name", ',') WITHIN GROUP(ORDER BY "GeoRegions"."Name") AS "GeoRegion",
    --"Accessory"."Name" AS "Accessory"
    --FROM
    --     "AccessoryExclusionZone"
    --INNER JOIN "Accessory" ON "Accessory"."AccessoryId" = "AccessoryExclusionZone"."AccessoryId"
    --INNER JOIN "GeoRegions" ON "GeoRegions"."GeoRegionId" = "AccessoryExclusionZone"."GeoRegionId"
    --GROUP BY
    --"AccessoryExclusionZone"."AccessoryId",
    --"Accessory"."Name","AccessoryExclusionZone"."IsExcluded"
    --HAVING "AccessoryExclusionZone"."IsExcluded" = 'Y' ;
     select "AccessoryTypeId" AS "AccessoryId",
            "AccessoryType"."Name" AS "Accessory",
            (SELECT SUBSTR (SYS_CONNECT_BY_PATH ("Name", '#'), 2) csv
              FROM (SELECT "GeoRegions"."Name" , ROW_NUMBER () OVER (ORDER BY "GeoRegions"."Name" ) rn,
                           COUNT (*) OVER () cnt
                      FROM "AccessoryExclusionZone"
                      INNER JOIN "GeoRegions" ON "GeoRegions"."GeoRegionId" = "AccessoryExclusionZone"."GeoRegionId" and "GeoRegions"."IsActive" = 'Y' AND "GeoRegions"."IsDelete" = 'N'
                      where "AccessoryId" = "AccessoryType"."AccessoryTypeId" and "IsExcluded"='Y' AND "AccessoryExclusionZone"."CompanyId" = CompanyId)
             WHERE rn = cnt
             START WITH rn = 1
             CONNECT BY rn = PRIOR rn + 1) as "GeoRegion"        
    from "AccessoryType" where "ParentId" != 0 order by "AccessoryType"."DisplayOrder" asc;
END AccessoryExclusion_List;
/