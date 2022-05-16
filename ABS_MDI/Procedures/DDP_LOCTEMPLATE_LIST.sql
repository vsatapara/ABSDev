CREATE OR REPLACE PROCEDURE abs_mdi."DDP_LOCTEMPLATE_LIST" (
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
      ISDELETE = 'N' order by LOCTEMPLATESKEYWARD;
END DDP_LOCTEMPLATE_LIST;
/