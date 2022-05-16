CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_ESTIMATING_SELECT" 
(
    ProjectId  IN  NUMBER,
    Project_Esimating_Data  OUT  SYS_REFCURSOR    
) AS
BEGIN  
   OPEN Project_Esimating_Data FOR SELECT    
        "EstimatingId",
        "QuoteNumber",
        "QuoteYear",
        "EstimatorName",
        "IsImpHasSpc",
        "ImpSpcPrice",
        "ImpSpcCost",
        "ImpAdjustmentPercent",
        "EstComplexity",
        "EstSurchargePercent",
        "CalcCustServHours",
        "CalcDraftingHours",
        "CalcEngineeringHours",
        "IsIncompletePrice",
        "FreightExpense",
        "EstThreshold",
        "ProjectId",
        "CommitNumber",
        "CommitYear"
               
    FROM
        "Project_Estimating"   
    where "ProjectId" = ProjectId and "IsDeleted" = 'N';
END PROJECT_ESTIMATING_SELECT;
/