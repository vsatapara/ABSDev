CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_DRAWING_SELECT" 
(
    ProjectId  IN  NUMBER,
    Project_Drw_Data      OUT  SYS_REFCURSOR,
    Project_Drawing_Data  OUT  SYS_REFCURSOR    
) AS
BEGIN
   OPEN Project_DRW_Data FOR SELECT  
        "FinalAnchorRodDate",
        "ApprovalDate", 
        "PermitDate", 
        "FinalDate",
        "IsCorpEngineers",
        "IsUFCAntiTerrorism",   
        "UFCAntiTerrorismListWeight",
        "UFCAntiTerrorismListPrice",
        "Mailed",
        "Carrier",
        "Account",
        "ExpiresOn",
        (SELECT count(*) FROM "Drawing_SubmittalPackage" where "ProjectId" = ProjectId and "IsDelete" = 'N') as TotalSubmitPackage,
        PE."QuoteNumber",
        PE."QuoteYear",
        PE."EstimatorName" as EstimatorInitial,
        T."ItemText" as ProjectStatus,
        "Country"
   FROM
   "Project" P
   left outer join "TableOfTables" T on T."Id" = P."ProjectStatusId" and "Category"='ProjectStatus'
   left outer join "Project_Estimating" PE on PE."ProjectId" = P."ProjectId"
   where P."ProjectId" = ProjectId;
   OPEN Project_Drawing_Data FOR SELECT 
        "DrawingsId",
        "Quantity",
        "Type",
        "Purpose",
        "Seal",
        "Enhanced",
        "Country",
        "State",
        "InternationalSite",
        "ShipTo",
        "MinQuantity",
        "DrawingSize"
    FROM
        "Drawings"  
   where "ProjectId" = ProjectId;
    
END PROJECT_DRAWING_SELECT;
/