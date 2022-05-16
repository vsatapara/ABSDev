CREATE OR REPLACE PROCEDURE abs_mdi."CLM_BUILDINGLOADVALUE_LIST" (
    Longitude               IN   FLOAT,
    Latitude                IN   FLOAT,
    DesignCodeId            IN   VARCHAR2,
    BuildingLoadValue_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN BuildingLoadValue_Data FOR 
    SELECT
        lv."LoadValueId",
        lv."GoverningCodeId",
        lv."LoadTypeId",
        lv."IsValueUnknown",
        lv."IsImperial",
        lv."Value_01",
        lv."Value_02",
        lv."Value_03",
        lv."Value_04",
        lv."Elevation_01",
        lv."Elevation_02",
        lv."Elevation_03",
        lv."Elevation_04",
        lv."RefDesignCodeID",
        gc."DesignCodeId",
        lt."Description"        
    FROM
        "CLM_GeoRegions"      gr
        RIGHT JOIN "CLM_GoverningCodes"  gc ON gr."GeoRegionId" = gc."GeoRegionId"
        RIGHT JOIN "CLM_LoadValues"      lv ON gc."GoverningCodeId" = lv."GoverningCodeId"
        RIGHT JOIN "CLM_LoadTypes"       lt ON lv."LoadTypeId" = lt."LoadTypeId"
    WHERE
        SDO_CONTAINS(gr."Shape",SDO_UTIL.FROM_WKTGEOMETRY('POINT('||Longitude||' '||Latitude||'),4326')) = 'TRUE'        
        AND (gc."DesignCodeId" IN (select regexp_substr(DesignCodeId,'[^,]+', 1, level) from dual
                                connect by regexp_substr(DesignCodeId,'[^,]+', 1, level) is not null ))
    ORDER BY
        SDO_GEOM.SDO_AREA(gr."Shape") ASC;
    --FETCH NEXT 5 ROWS ONLY;
END CLM_BuildingLoadValue_List;
/