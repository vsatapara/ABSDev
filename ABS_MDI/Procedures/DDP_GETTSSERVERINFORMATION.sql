CREATE OR REPLACE PROCEDURE abs_mdi."DDP_GETTSSERVERINFORMATION" 
(
Output_Data OUT SYS_REFCURSOR
)AS 
BEGIN
 OPEN Output_Data FOR
 Select  
 serverid,
 servername,
 prettyname,
 path 
 from ddp_tsservers
   WHERE
      ISDELETE = 'N';
END DDP_GETTSSERVERINFORMATION;
/