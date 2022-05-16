CREATE OR REPLACE PROCEDURE abs_mdi."PROJECTLOCATION_VALIDATE" (
    CompanyId    IN   NUMBER,
    Longitude    IN   FLOAT,
    Latitude     IN   FLOAT,
    Output_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN Output_Data FOR SELECT
                             COUNT(1)
                         FROM
                                  "ShippingZone" s
                             INNER JOIN "GeoRegions" g ON g."GeoRegionId" = s."GeoRegionId"
                         WHERE
                                 s."CompanyId" = CompanyId
                             AND g."IsDelete" = 'N'
                             AND SDO_CONTAINS(g."Region_New", SDO_UTIL.FROM_WKTGEOMETRY('POINT('
                                                                                        || Longitude
                                                                                        || ' '
                                                                                        || Latitude
                                                                                        || '),4326')) = 'TRUE';
END PROJECTLOCATION_VALIDATE;
/