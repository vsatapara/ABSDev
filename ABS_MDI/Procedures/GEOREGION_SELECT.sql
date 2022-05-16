CREATE OR REPLACE PROCEDURE abs_mdi."GEOREGION_SELECT" (
    GeoRegionId  IN   NUMBER,
    Output_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN Output_Data FOR SELECT
                             "GeoRegionId",
                             "Name",
                             "IsActive",
                             "Region",
                             "AttachmentName"
                         FROM
                             "GeoRegions"  g
                             LEFT JOIN "Attachment"  a ON g."KMLFileId" = a."AttachmentId"
                         WHERE
                             "GeoRegionId" = GeoRegionId;
END GEOREGION_SELECT;
/