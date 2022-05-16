CREATE OR REPLACE PROCEDURE abs_mdi."DDP_EDSDB_BUILDING_VERSION_BYJOBNUMBER_SELECT" 
/* Created By Banix Sheth
      Created Date   15-09-2021
      Description   This stored Procedure used to get   data  from  DDP_EDSDB_BUILDING_VERSION table  */
(
    V_JobNumber IN NVARCHAR2,
    V_ServerName IN NVARCHAR2, 
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR
 SELECT
        "EDV".*
    FROM
        "DDP_EDSDB_BUILDING_VERSION" EDV
     INNER JOIN 
        "DDP_TSSERVERS" TS
    ON 
        "TS"."SERVERID" =  "EDV"."DDPSSERVERID"
    WHERE "EDV"."ISDELETE" = 'N'
    AND "TS"."ISDELETE" = 'N'
    AND LOWER("TS"."SERVERNAME") = LOWER(V_ServerName)
    AND LOWER("EDV"."JOBNUMBER") = LOWER(V_JobNumber);
    --AND "TS"."SERVERNAME" = V_ServerName
    --AND "EDV"."JOBNUMBER" = V_JobNumber;
    
 
END DDP_EDSDB_BUILDING_VERSION_BYJOBNUMBER_SELECT;
/