CREATE OR REPLACE PROCEDURE abs_mdi."GEOREGION_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
      SELECT 
        "GeoRegionId",
        "Name",
        "IsActive",
        "KMLFileId",
        "AttachmentPath",
        "AttachmentName",
        "KMLFileId",
        SDO_UTIL.TO_WKTGEOMETRY("GeoRegions"."Region_New") as Region_New
      FROM "GeoRegions","Attachment"
      WHERE ( "GeoRegions"."KMLFileId" = "Attachment"."AttachmentId") and ("GeoRegions"."IsDelete" != 'Y' or "GeoRegions"."IsDelete" is null );
END GEOREGION_LIST;
/