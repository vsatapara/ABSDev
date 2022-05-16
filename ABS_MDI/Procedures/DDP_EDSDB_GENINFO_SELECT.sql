CREATE OR REPLACE PROCEDURE abs_mdi."DDP_EDSDB_GENINFO_SELECT" 
/*   Created By    Mayuresh Jagtap
      Created Date   3-5-2021
      Description   This stored Procedure used in the DDP and used for get data from DDP_EDSDB_GENINFO table  */
(
UserId IN NVARCHAR2,
JobNumber IN NVARCHAR2,
Output_Data OUT SYS_REFCURSOR
)AS 
BEGIN
 OPEN Output_Data FOR 
   SELECT
       "GENINFOID", 
        "BP_NAME",
        "BP_ADDRESS1",
        "BP_CITY",
        "BP_STATE",
        "BP_ZIP_CODE",
        "SHIP_TO_NAME",
        "SHIP_TO_CITY",
        "SHIP_TO_STATE", 
        "JOBSITE_STATE",
        "DESIGN_OFFICE_LOCATION" 
    FROM
        "DDP_EDSDB_GENINFO"
    WHERE 
        "ISDELETE" = 'N'
    AND "USERID" = UserId
    AND "JOBNUMBER" = JobNumber;
END DDP_EDSDB_GENINFO_SELECT;
/