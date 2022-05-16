CREATE OR REPLACE PROCEDURE abs_mdi."DDP_LOCTEMPLATE_SELECT" 
/*   Created By Ashlesha Diwate
      Created Date   27-4-2021
      Description   This stored Procedure used to get data  DDP_LOCTEMPLATES table  */
(
    V_CategoryId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
OPEN Output_Data FOR
    SELECT
        LOCTEMPLATEID,
        CATEGORYID,
        DESCRIPTION,
        LOCTEMPLATESKEYWARD
    FROM
        DDP_LOCTEMPLATES 
    WHERE 
        CATEGORYID = V_CategoryId 
    AND ISDELETE = 'N';
END DDP_LOCTEMPLATE_SELECT;
/