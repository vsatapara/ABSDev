CREATE OR REPLACE PROCEDURE abs_mdi."MENUADMIN_FILTER" 
(
    CompanyId IN NUMBER,
    MenuAdminId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
 OPEN Output_Data FOR
SELECT
    "ImageVideoId",
    "Content",
    "Url",
    "HasEmbededVideo",
    A."AttachmentName" AS ImageVideoName,
    A."AttachmentPath" AS ImageVideoPath
FROM
    "MenuAdmin" M
      LEFT JOIN "Attachment" A ON A."AttachmentId" = M."ImageVideoId"
   WHERE M."CompanyId" = CompanyId and M."IsDelete" = 'N' and M."MenuAdminId" = MenuAdminId;
END MenuAdmin_Filter;
/