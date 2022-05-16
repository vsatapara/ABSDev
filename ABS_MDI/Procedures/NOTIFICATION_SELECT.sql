CREATE OR REPLACE PROCEDURE abs_mdi."NOTIFICATION_SELECT" 
(
    NotificationId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
        SELECT 
            "NotificationId",
            "NotificationName",
            "IsActive",
            "Content",
            to_char("StartDate",'MM/DD/YYYY HH24:MI:SS') "STARTDATE",
            to_char("EndDate",'MM/DD/YYYY HH24:MI:SS') "ENDDATE",
            "CompanyId",
            "SortOrder",
            "IsSystemNotification",
            "FeaturedImageId",
            AT."AttachmentName" as FeaturedImageName,
            AT."AttachmentPath" as FeaturedImagePath            
          FROM "Notification" N
          LEFT OUTER JOIN "Attachment" AT ON N."FeaturedImageId" = AT."AttachmentId"
          WHERE "NotificationId"=NotificationId;
END Notification_Select;
/