CREATE OR REPLACE PROCEDURE abs_mdi."CLM_BUILDINGCODE_LIST" (
    Longitude          IN   FLOAT,
    Latitude           IN   FLOAT,
    BuildingCode_Data  OUT  SYS_REFCURSOR,
    BuildingRain_Data  OUT  SYS_REFCURSOR
) 
as
BEGIN
    OPEN BuildingCode_Data FOR 
    SELECT
       gr."GeoRegionId",
       gc."GoverningCodeId",
       gc."DesignCodeId",
       --dc."Code",
       dc."Description",
       --dc."Edition",
       dc."Designation",
       dc."IsIBC2012Based",
       dc."IsCanadaBased",
       dc."USGSRefDesignCodeId",
       cl."IsSeismicNewCal",
       eds."EDSStandAlone"
   FROM
       "CLM_GeoRegions"      gr
       RIGHT JOIN "CLM_GoverningCodes"  gc ON gr."GeoRegionId" = gc."GeoRegionId"
       RIGHT JOIN "CLM_DesignCodes"     dc ON gc."DesignCodeId" = dc."DesignCodeId"
       INNER JOIN "CL_Settings"         cl ON dc."Designation" = cl."BuildingCode"
       RIGHT JOIN "EDSPrice_BuildingCodeMapping"     eds ON EDS."ABSCode" = dc."Designation"
   WHERE
       SDO_CONTAINS(gr."Shape",SDO_UTIL.FROM_WKTGEOMETRY('POINT('||Longitude||' '||Latitude||'),4326')) = 'TRUE'
       AND gc."IsForDesignCodeSelection" = 'Y'
       AND dc."Active" = 'Y'
       AND cl."IsSupport" = 'Y'
   ORDER BY
       SDO_GEOM.SDO_AREA(gr."Shape") ASC,
       dc."SortOrder",
       dc."Edition" ASC;
       --FETCH FIRST 5 ROWS ONLY;
    OPEN BuildingRain_Data FOR 
    SELECT
          gr."AnsiId",
          mb."RainI1" as Rain1,
          mb."RainI2" as Rain2
      FROM
          "CLM_GeoRegions"  gr 
          RIGHT JOIN "CLM_MBMAData" mb ON gr."AnsiId" = mb."AnsiId"
      WHERE
        SDO_CONTAINS(gr."Shape",SDO_UTIL.FROM_WKTGEOMETRY('POINT('||Longitude||' '||Latitude||'),4326')) = 'TRUE'
        AND (NVL(gr."AnsiId",'') != '' or gr."AnsiId" is not null)
      ORDER BY
          SDO_GEOM.SDO_AREA(gr."Shape") ASC;
     -- FETCH FIRST 5 ROWS ONLY;
END CLM_BuildingCode_List;
/