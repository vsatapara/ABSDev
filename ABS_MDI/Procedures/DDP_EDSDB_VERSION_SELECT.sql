CREATE OR REPLACE PROCEDURE abs_mdi."DDP_EDSDB_VERSION_SELECT" 
/*   Created By    Mayuresh Jagtap
      Created Date   3-5-2021
      Description   This stored Procedure used in the DDP and used for get data from DDP_EDSDB_VERSION table  */
(
    UserId IN NVARCHAR2,
    JobFolderNumber IN NVARCHAR2,
    Output_Data OUT SYS_REFCURSOR
) AS 
BEGIN
 OPEN Output_Data FOR 
    SELECT
        "EV"."EDSDB_VERSION"
    FROM
        "DDP_EDSDB_VERSION" EV
    INNER JOIN 
        "DDP_EDSDB_BUILDING_VERSION" EDV
    ON 
        "EV"."EDSDBBLDGVERID" =  "EDV"."EDSDBBLDGVERID"
    WHERE "EV"."ISDELETE" = 'N'
    AND LOWER("EDV"."JOBNUMBER") = LOWER(JobFolderNumber);
    --AND "USERID" = UserId
END DDP_EDSDB_VERSION_SELECT;
/