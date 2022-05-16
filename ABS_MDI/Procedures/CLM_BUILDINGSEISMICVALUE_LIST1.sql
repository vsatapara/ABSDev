CREATE OR REPLACE PROCEDURE abs_mdi."CLM_BUILDINGSEISMICVALUE_LIST1" (
    Longitude             IN   FLOAT,
    Latitude              IN   FLOAT,
    DesignCodeId          IN   varchar2,
    BuildingSeismic_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN BuildingSeismic_Data FOR 
    SELECT
              sv."SS",
              sv."S1"
          FROM
              "CLM_USGSSeismicValues" sv --WITH (INDEX(idx_GeoPoint))
          WHERE
          sv."DesignCodeID"  in (DesignCodeId)
          --    ( ( sv."DesignCodeID" = DesignCodeId )
          --      AND ( SDO_GEOM.SDO_DISTANCE("GeoPoint", SDO_GEOMETRY(2001, 4326, SDO_POINT_TYPE(Longitude,
          --      Latitude, NULL), NULL, NULL)) < 1 ) )
         -- ORDER BY
         --     SDO_GEOM.SDO_DISTANCE("GeoPoint", SDO_GEOMETRY(2001, 4326, SDO_POINT_TYPE(Longitude, Latitude,
         --     NULL), NULL, NULL))
          FETCH NEXT 5 ROWS ONLY;
END CLM_BUILDINGSEISMICVALUE_LIST1;
/