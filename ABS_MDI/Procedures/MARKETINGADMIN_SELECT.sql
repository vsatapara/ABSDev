CREATE OR REPLACE PROCEDURE abs_mdi."MARKETINGADMIN_SELECT" 
(
   MarketingAdminId IN NUMBER,
   Out_Data OUT SYS_REFCURSOR   
)
AS 
BEGIN
   OPEN Out_Data FOR 
      SELECT 
        "MarketingAdminId",
		"Title",
		"SortOrder",
		"Content",
		"ActionButtonTitle",
		"ActionButtonUrl",
		"IsActive",
        "FileId",
        AT."AttachmentName" as FileName,
        AT."AttachmentPath" as FilePath        
      FROM "MarketingAdmin" M 
      LEFT OUTER JOIN "Attachment" AT ON M."FileId" = AT."AttachmentId"
      WHERE "MarketingAdminId" = MarketingAdminId and M."IsDelete" = 'N';
END MarketingAdmin_Select;
/