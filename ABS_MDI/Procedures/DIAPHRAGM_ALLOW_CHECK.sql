CREATE OR REPLACE PROCEDURE abs_mdi."DIAPHRAGM_ALLOW_CHECK" (
    ProjectId  IN   NUMBER,
    OutputId   OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN OutputId FOR SELECT
                          CASE
                              WHEN COUNT(d."DiaphragmActionExclusionId") > 0 THEN
                                  0
                              ELSE
                                  1
                          END
                      FROM
                               "DiaphragmActionExclusions" d
                          INNER JOIN "GeoRegions"  g ON g."GeoRegionId" = d."GeoRegionId"
                          INNER JOIN "Project"     p ON p."CompanyId" = d."CompanyId"
                      WHERE
                              p."ProjectId" = ProjectId
                          AND g."IsDelete" = 'N'
                          AND SDO_CONTAINS(g."Region_New", SDO_UTIL.FROM_WKTGEOMETRY('POINT('
                                                                                     || p."Longitude"
                                                                                     || ' '
                                                                                     || p."Latitude"
                                                                                     || '),4326')) = 'TRUE';
END DIAPHRAGM_ALLOW_CHECK;
/