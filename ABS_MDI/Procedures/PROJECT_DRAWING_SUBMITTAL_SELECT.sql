CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_DRAWING_SUBMITTAL_SELECT" 
(
    ProjectId  IN  NUMBER,
    Project_Drw_Submittal_Data  OUT  SYS_REFCURSOR    
) AS
BEGIN  
   OPEN Project_Drw_Submittal_Data FOR SELECT    
        "DrawingSubmittaleId",
        "Description",
        "Quantity",
        "Price"
    FROM
        "Drawing_SubmittalPackage"   
    where "ProjectId" = ProjectId and "IsDelete" = 'N';
END PROJECT_DRAWING_Submittal_SELECT;
/