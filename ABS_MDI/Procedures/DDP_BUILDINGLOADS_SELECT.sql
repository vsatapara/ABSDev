CREATE OR REPLACE PROCEDURE abs_mdi."DDP_BUILDINGLOADS_SELECT" 
/* Created By Ashlesha Diwate
      Created Date   16-06-2021
      Description   This stored Procedure used to get   data  from  DDP_Buildingloads table  */
(
    V_JobNumber IN NVARCHAR2,
    V_DDPSERVERID IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR
 SELECT
        "BV".*
    FROM
        "DDP_BUILDINGLOADS" BV
    INNER JOIN 
        "DDP_EDSDB_BUILDING_VERSION" EDV
    ON 
        "BV"."EDSDBBLDGVERID" =  "EDV"."EDSDBBLDGVERID"
    WHERE "BV"."ISDELETE" = 'N'
    AND LOWER("EDV"."JOBNUMBER") = LOWER(V_JobNumber) AND "EDV".ddpsserverid  = V_DDPSERVERID AND ("BV".LOADAPPLICATIONCATEGORY='LongStrut' OR "BV".LOADAPPLICATIONCATEGORY='TranStrut');
END DDP_BUILDINGLOADS_SELECT;
/