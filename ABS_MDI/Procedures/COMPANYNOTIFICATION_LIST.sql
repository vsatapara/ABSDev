CREATE OR REPLACE PROCEDURE abs_mdi."COMPANYNOTIFICATION_LIST" 
(
CompanyId IN NUMBER,
Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN Output_Data FOR 
      SELECT 
        "CompanyNotificationId",
        "IsActive",
        "Content",
        to_char("StartDate",'MM/DD/YYYY HH24:MI:SS') "StartDate",
        to_char("EndDate",'MM/DD/YYYY HH24:MI:SS') "EndDate",        
        "CompanyId",
        "SortOrder",
        "CompanyNotificationName"
      FROM "CompanyNotification" N
	WHERE N."CompanyId" =CompanyId and (N."IsDelete" IS NULL OR N."IsDelete" = 'N');
END CompanyNotification_List;
/