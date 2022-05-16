CREATE OR REPLACE PROCEDURE abs_mdi."DDP_GETTSSERVERID_SELECT" 
/*   Created By    Mayuresh Jagtap
      Created Date   24-08-2021
      Description   This stored Procedure used in the DDP and used for get TS SERVER ID from server name  */
(
	TSServername IN NVARCHAR2,
    Output_Data OUT SYS_REFCURSOR
) AS 
BEGIN
 OPEN Output_Data FOR 
	 SELECT 	
     "SERVERID"
	 FROM 		
     "NXTABS"."DDP_TSSERVERS"
	 WHERE 		
     "SERVERNAME" = TSServername
	 AND 		"ISDELETE" = 'N';
END DDP_GETTSSERVERID_SELECT;
/