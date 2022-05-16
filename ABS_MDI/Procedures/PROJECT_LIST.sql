CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
  
     SELECT 
        pt."ProjectId",
        pt."ProjectName",
        tt."Id" As ProjectStatusId,
        tt."ItemText" As  ProjectStatusName,
        pt."PriceStatus"
      FROM "Project" pt
      join "TableOfTables" tt  on pt."ProjectStatusId" = tt."Id" where "IsDelete"='N';
      
END PROJECT_LIST;
/