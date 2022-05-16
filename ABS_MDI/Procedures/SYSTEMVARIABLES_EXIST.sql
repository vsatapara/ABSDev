CREATE OR REPLACE PROCEDURE abs_mdi."SYSTEMVARIABLES_EXIST" (
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
       SELECT 
        max("SystemVariableId")        
      FROM "SystemVariable";
END SYSTEMVARIABLES_EXIST;
/