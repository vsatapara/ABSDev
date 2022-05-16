CREATE OR REPLACE PROCEDURE abs_mdi."MAINTENANCE_SELECT" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
        SELECT 
            "MaintenanceId",
            to_char("FromDate",'MM/DD/YYYY HH24:MI:SS') "FromDate",
            to_char("ToDate",'MM/DD/YYYY HH24:MI:SS') "ToDate",
            "IsActive",
            "Content"
         FROM "Maintenance"
         WHERE ROWNUM=1;
END Maintenance_Select;
/