CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_DRAWING_TYPE_SELECT" 
(
    Project_Drw_Data  OUT  SYS_REFCURSOR    
) AS
BEGIN  
   OPEN Project_Drw_Data FOR SELECT    
        "DrawingTypeId",
        "Name",
        "Purpose",
        "Seal",
        "Mailed"
    FROM
        "DrawingType"   
    where "IsDelete" = 'N';
END PROJECT_DRAWING_TYPE_SELECT;
/