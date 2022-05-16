CREATE OR REPLACE PROCEDURE abs_mdi."CLM_BUILDINGSEISMICVALUE_LIST" (
    Longitude             IN   FLOAT,
    Latitude              IN   FLOAT,
    DesignCodeId          IN   Number,
    BuildingSeismic_Data  OUT  SYS_REFCURSOR
) AS
TotalCount       NUMBER;
BEGIN
    /*OPEN BuildingSeismic_Data FOR 
    SELECT
              sv."SS",
              sv."S1"
          FROM
              "CLM_USGSSeismicValues" sv --WITH (INDEX(idx_GeoPoint))
          WHERE
          sv."DesignCodeID" = DesignCodeId 
          AND sv."GeoPoint".SDO_POINT.X = Longitude
          AND sv."GeoPoint".SDO_POINT.y = Latitude
          --AND ( SDO_GEOM.SDO_DISTANCE("GeoPoint", SDO_GEOMETRY(2001, 4326, SDO_POINT_TYPE(Longitude,Latitude, NULL), NULL, NULL)) < 1 ) )
          --ORDER BY  SDO_GEOM.SDO_DISTANCE("GeoPoint", SDO_GEOMETRY(2001, 4326, SDO_POINT_TYPE(Longitude, Latitude,NULL), NULL, NULL))
          FETCH NEXT 5 ROWS ONLY;*/
      --OPEN BuildingSeismic_Data FOR 
       -- SELECT
       --       sv."SS",
      --        sv."S1"
      --    FROM
      --        "CLM_USGSSeismicValues" sv --WITH (INDEX(idx_GeoPoint))
      --    WHERE
      --      ( sv."DesignCodeID" IN (select regexp_substr(DesignCodeId,'[^,]+', 1, level) from dual
       --                         connect by regexp_substr(DesignCodeId,'[^,]+', 1, level) is not null ) )
           -- AND SDO_CONTAINS(sv."GeoPoint",SDO_UTIL.FROM_WKTGEOMETRY('POINT('||Longitude||' '||Latitude||'),4326')) = 'TRUE'
          --and sv."GeoPoint".SDO_POINT.X =Longitude  and sv."GeoPoint".SDO_POINT.Y =Latitude;
        --  and SDO_GEOM.SDO_DISTANCE(sv."GeoPoint",SDO_UTIL.FROM_WKTGEOMETRY('POINT('||Longitude||' '||Latitude||'),4326')) < 1;
           --  FETCH NEXT 5 ROWS ONLY;    
    /*SELECT
        COUNT(*)
    INTO TotalCount
    FROM
        "CLM_USGSSeismicValues_NearestCalc"
   WHERE "Lat" = ROUND(Latitude,2) AND "Lon" = ROUND(Longitude,2) AND "DesignCodeID" = DesignCodeId;
        IF TotalCount = 0 THEN
        BEGIN
        INSERT INTO "CLM_USGSSeismicValues_NearestCalc" 
        SELECT
            DesignCodeId, 
              ROUND(Latitude,2),
              ROUND(Longitude,2),
              sv."SS",
              sv."S1",
              SDO_GEOM.SDO_DISTANCE(sv."GeoPoint",MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(Longitude, Latitude, NULL), NULL, NULL)) as DistanceVal
          FROM
              "CLM_USGSSeismicValues" sv --WITH (INDEX(idx_GeoPoint))
          WHERE
            sv."DesignCodeID" = DesignCodeId
           -- AND SDO_CONTAINS(sv."GeoPoint",SDO_UTIL.FROM_WKTGEOMETRY('POINT('||Longitude||' '||Latitude||'),4326')) = 'TRUE'
          --and sv."GeoPoint".SDO_POINT.X =Longitude  and sv."GeoPoint".SDO_POINT.Y =Latitude;
          --and SDO_GEOM.SDO_DISTANCE(sv."GeoPoint",SDO_UTIL.FROM_WKTGEOMETRY('POINT('||Longitude||' '||Latitude||'),4326')) < 1
          and SDO_GEOM.SDO_DISTANCE(sv."GeoPoint",MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(Longitude, Latitude, NULL), NULL, NULL)) < 1
          --and rownum =1
         --order by SDO_GEOM.SDO_DISTANCE(sv."GeoPoint",SDO_UTIL.FROM_WKTGEOMETRY('POINT('||Longitude||' '||Latitude||'),4326'))
         order by SDO_GEOM.SDO_DISTANCE(sv."GeoPoint",MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(Longitude, Latitude, NULL), NULL, NULL))
       FETCH FIRST 1 ROWS ONLY; 
        END;
    END IF;
    OPEN BuildingSeismic_Data FOR 
    SELECT "SS", "S1", "DistanceVal"  FROM "CLM_USGSSeismicValues_NearestCalc" WHERE "Lat" = ROUND(Latitude,2) AND "Lon" = ROUND(Longitude,2) AND "DesignCodeID" = DesignCodeId;
   */
   
    OPEN BuildingSeismic_Data FOR 
    SELECT
          sv."SS",
          sv."S1",
          SDO_GEOM.SDO_DISTANCE(sv."GeoPoint",MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(Longitude, Latitude, NULL), NULL, NULL)) as DistanceVal
    FROM
        "CLM_USGSSeismicValues" sv --WITH (INDEX(idx_GeoPoint))
    WHERE
        sv."DesignCodeID" = DesignCodeId
        and SDO_GEOM.SDO_DISTANCE(sv."GeoPoint",MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(Longitude, Latitude, NULL), NULL, NULL)) < 1
       -- order by SDO_GEOM.SDO_DISTANCE(sv."GeoPoint",MDSYS.SDO_GEOMETRY(2001, NULL, MDSYS.SDO_POINT_TYPE(Longitude, Latitude, NULL), NULL, NULL))
    FETCH FIRST 1 ROWS ONLY; 
       
END CLM_BuildingSeismicValue_List;
/