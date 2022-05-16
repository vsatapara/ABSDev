CREATE OR REPLACE PROCEDURE abs_mdi."COMPANYNOTIFICATION_SELECT" 
(
    CompanyNotificationId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
        SELECT 
            "CompanyNotificationId",
            "CompanyNotificationName",
            "IsActive",
            "Content",
            to_char("StartDate",'MM/DD/YYYY HH24:MI:SS') "STARTDATE",
            to_char("EndDate",'MM/DD/YYYY HH24:MI:SS') "ENDDATE",
            "CompanyId",
            "SortOrder"        
          FROM "CompanyNotification" N
          WHERE "CompanyNotificationId"=CompanyNotificationId
          AND N."IsDelete" != 'Y';
END CompanyNotification_Select;
/