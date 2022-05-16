CREATE OR REPLACE PROCEDURE abs_mdi."AllNotificationList" 
(
    CompanyId    IN   NUMBER,
    Output_SystemAdminData OUT SYS_REFCURSOR,
    Output_SysNotificationData OUT SYS_REFCURSOR,
    Output_NotificationData OUT SYS_REFCURSOR,
    Output_MaintainenceData OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN Output_SystemAdminData FOR SELECT
                             "RoleId",
                             "RoleName",
                             (SELECT
                                             CASE
                                                 WHEN "ParentId" = 0 THEN
                                                     "RoleId"
                                                 ELSE
                                                     "ParentId"
                                             END
                                         FROM
                                             "RoleMaster"
                                         WHERE
                                             "RoleId" = RM."ParentId")  AS "ParentId",
                             Case when "IsActive" = 'Y' Then 1 else 0 end as "IsActive",
                             Case when "IsView" = 'Y' Then 1 else 0 end as "IsView",
                             Case when "IsAdd" = 'Y' Then 1 else 0 end as "IsAdd",
                             Case when "IsEdit" = 'Y' Then 1 else 0 end as "IsEdit",
                             Case when "IsHistory" = 'Y' Then 1 else 0 end as "IsHistory",
                             Case when "IsDelete" = 'Y' Then 1 else 0 end as "IsDelete"
                         FROM
                             "RoleMaster" RM
                         WHERE
                             "IsActive" = 'Y'
                         UNION ALL
                         SELECT
                             "MenuAdmin"."MenuAdminId"    AS "RoleId",
                             "MenuAdmin"."Name"           AS "RoleName",
                             CASE "MenuAdmin"."ParentId"
                                 WHEN 0 THEN
                                     56
                                 ELSE
                                     "MenuAdmin"."ParentId"
                             END                          AS "ParentId",
                             1                          AS "IsActive",
                             1                          AS "IsView",
                             1                          AS "IsAdd",
                             1                          AS "IsEdit",
                             1                          AS "IsHistory",
                             1                          AS "IsDelete"
                         FROM
                             "MenuAdmin"
                         WHERE
                                 "IsDelete" = 'N'
                             AND "CompanyId" = CompanyId;

 OPEN Output_SysNotificationData FOR 
        SELECT 
            "NotificationId" as "NotificationId",
            "NotificationName" as "NotificationName",
            "Content",
            "SortOrder"         
          FROM "Notification" N
          LEFT OUTER JOIN "Attachment" AT ON N."FeaturedImageId" = AT."AttachmentId"
          WHERE (N."IsDelete" IS NULL OR N."IsDelete" = 'N') AND N."IsActive" = 'Y'
           AND CURRENT_TIMESTAMP BETWEEN "StartDate" AND "EndDate"
          Order by "EndDate"-CURRENT_TIMESTAMP  asc;
 OPEN Output_NotificationData FOR 
           SELECT 
            "CompanyNotificationId"  as "NotificationId",
            "CompanyNotificationName"as "NotificationName",
            "Content",
            "SortOrder"        
          FROM "CompanyNotification" N
          WHERE "CompanyId"=CompanyId
          AND N."IsDelete" != 'Y' AND N."IsActive" = 'Y'
          AND CURRENT_TIMESTAMP BETWEEN ("StartDate") AND ("EndDate")
          Order by "EndDate"-CURRENT_TIMESTAMP  asc;
OPEN Output_MaintainenceData FOR 
        SELECT 
            "MaintenanceId",
            to_char("Content") as "Content"
         FROM "Maintenance" N
        WHERE (N."IsDelete" IS NULL OR N."IsDelete" = 'N')  AND N."IsActive" = 'Y'
          AND "FromDate" <= CURRENT_TIMESTAMP AND "ToDate" >= CURRENT_TIMESTAMP
        Order by "FromDate","ToDate" desc;
END "AllNotificationList";
/