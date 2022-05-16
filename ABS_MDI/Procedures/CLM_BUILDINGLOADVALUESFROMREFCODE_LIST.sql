CREATE OR REPLACE PROCEDURE abs_mdi."CLM_BUILDINGLOADVALUESFROMREFCODE_LIST" (
    Longitude               IN   FLOAT,
    Latitude                IN   FLOAT,
    DesignCodeId            IN   VARCHAR2,
    LoadTypeId              IN   VARCHAR2,
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
        lv."RefDesignCodeID"
    FROM
        "CLM_GeoRegions"      gr
        RIGHT JOIN "CLM_GoverningCodes"  gc ON gr."GeoRegionId" = gc."GeoRegionId"
        RIGHT JOIN "CLM_DesignCodes"     dc ON gc."DesignCodeId" = dc."DesignCodeId"
        RIGHT JOIN "CLM_LoadValues"      lv ON gc."GoverningCodeId" = lv."GoverningCodeId"
    WHERE
        SDO_CONTAINS(gr."Shape",SDO_UTIL.FROM_WKTGEOMETRY('POINT('||Longitude||' '||Latitude||'),4326')) = 'TRUE'      
        AND dc."DesignCodeId" IN (select regexp_substr(DesignCodeId,'[^,]+', 1, level) from dual
                                connect by regexp_substr(DesignCodeId,'[^,]+', 1, level) is not null )
        AND lv."LoadTypeId"  IN (select regexp_substr(LoadTypeId,'[^,]+', 1, level) from dual
                                connect by regexp_substr(LoadTypeId,'[^,]+', 1, level) is not null )
        AND gc."IsForReference" = 'Y'
        AND lv."RefDesignCodeID" = 0
    ORDER BY
        SDO_GEOM.SDO_AREA(gr."Shape") ASC;
     --   FETCH NEXT 5 ROWS ONLY;
END CLM_BuildingLoadValuesFromRefCode_List;
/