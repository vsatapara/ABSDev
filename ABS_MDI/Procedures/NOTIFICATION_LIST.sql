CREATE OR REPLACE PROCEDURE abs_mdi."NOTIFICATION_LIST" 
(
Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN Output_Data FOR 
      SELECT 
        "NotificationId",
        "IsActive",
        "Content",
        to_char("StartDate",'MM/DD/YYYY HH24:MI:SS') "StartDate",
        to_char("EndDate",'MM/DD/YYYY HH24:MI:SS') "EndDate",        
        "CompanyId",
        "SortOrder",
        "IsSystemNotification",
        "NotificationName",
        "FeaturedImageId",
        A."AttachmentName" AS FeaturedImageName,
        A."AttachmentPath" AS FeaturedImagePath
      FROM "Notification" N
      LEFT JOIN "Attachment" A ON A."AttachmentId" = "FeaturedImageId"
	WHERE N."IsDelete" IS NULL OR N."IsDelete" = 'N';
END Notification_List;
/