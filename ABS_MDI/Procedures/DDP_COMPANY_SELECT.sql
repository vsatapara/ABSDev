CREATE OR REPLACE PROCEDURE abs_mdi."DDP_COMPANY_SELECT" 
/*   Created By    Mayuresh Jagtap
      Created Date   25-4-2021
      Description   This stored Procedure used in the DDP and  used select the company information    in DDP_COMPANY table  */
(
 Output_Data OUT SYS_REFCURSOR
)AS
BEGIN
 OPEN Output_Data FOR 
    SELECT
        "COMPANYID",
        "COMPANYPREFIX",
        "COMPANYNAME"
    FROM
        "DDP_COMPANY"
    WHERE "ISDELETE" = 'N';
END DDP_COMPANY_SELECT;
/