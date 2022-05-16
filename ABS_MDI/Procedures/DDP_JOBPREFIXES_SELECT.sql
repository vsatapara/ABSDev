CREATE OR REPLACE PROCEDURE abs_mdi."DDP_JOBPREFIXES_SELECT" 
/*   Created By Mayuresh Jagtap
      Created Date   27-4-2021
      Description   This stored Procedure used to get job prefix  from  DDP_JOBPREFIXES table  */
(
 Output_Data OUT SYS_REFCURSOR
 )AS 
BEGIN
 OPEN Output_Data FOR 
 SELECT
    "JOBPREFIXID",
    "PREFIX",
    "ISDEFAULT"
 FROM "DDP_JOBPREFIXES"
 WHERE "ISDELETE" = 'N';
END DDP_JOBPREFIXES_SELECT;
/