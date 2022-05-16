CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_MEZZANINEPROJECTDATA_SELECT" 
(
  ProjectId IN NUMBER,
  Project_Data  OUT  SYS_REFCURSOR
) AS 
BEGIN
    OPEN Project_Data FOR SELECT
     "DesignCodeName"
 FROM
    "Project" 
    WHERE
    "ProjectId" = ProjectId;
END ACCESSORIES_MEZZANINEPROJECTDATA_SELECT;
/