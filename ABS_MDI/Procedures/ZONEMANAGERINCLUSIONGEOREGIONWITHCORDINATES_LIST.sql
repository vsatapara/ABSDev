CREATE OR REPLACE PROCEDURE abs_mdi."ZONEMANAGERINCLUSIONGEOREGIONWITHCORDINATES_LIST" (
    CompanyId    IN   NUMBER,
    Output_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN Output_Data FOR SELECT
                             GR."GeoRegionId",
                             "Name",
                             "Region"
                         FROM
                                  "GeoRegions" GR
                             JOIN "ShippingZone" SZ ON SZ."GeoRegionId" = GR."GeoRegionId"
                         WHERE
                                 SZ."CompanyId" = CompanyId
                             AND GR."IsActive" = 'Y'
                             AND "IsDelete" != 'Y';
END ZONEMANAGERINCLUSIONGEOREGIONWITHCORDINATES_LIST;
/