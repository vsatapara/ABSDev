CREATE OR REPLACE PROCEDURE abs_mdi."DDP_EDSDB_SETTINGS_SELECT" 
/*   Created By    Mayuresh Jagtap
      Created Date   3-5-2021
      Description   This stored Procedure used in the DDP and used for get data from DDP_EDSDB_SETTINGS table  */
(
UserId IN NVARCHAR2,
JobNumber IN NVARCHAR2,
Output_Data OUT SYS_REFCURSOR
)AS 
BEGIN
    OPEN Output_Data FOR 
        SELECT
            "SETTINGID",
            "MBG_BRAND"
        FROM
            "DDP_EDSDB_SETTINGS"
        WHERE 
            "ISDELETE" = 'N'
        AND "USERID" = UserId
        AND "JOBNUMBER" = JobNumber;
END DDP_EDSDB_SETTINGS_SELECT;
/