CREATE OR REPLACE PROCEDURE abs_mdi."REPORTPROJECT_STATUS" 
(
 ProjectId IN NUMBER,
 Output_Data OUT SYS_REFCURSOR
 )
AS 
BEGIN
    OPEN Output_Data FOR
    SELECT "ProjectStage" FROM "Project" Where "ProjectId"=ProjectId AND "IsDelete"='N';
    
END REPORTPROJECT_STATUS;
/