CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_ESTIMATING_UPDATE" (
 EstimatingId                    IN NUMBER,
 QuoteNumber                     IN VARCHAR2,
 QuoteYear                       IN VARCHAR2,
 CommitNumber                    IN VARCHAR2,
 CommitYear                      IN VARCHAR2,
 IsImpHasSpc                     IN VARCHAR2,
 ImpSpcPrice                     IN NUMBER,
 ImpSpcCost                      IN NUMBER,
 ImpAdjustmentPercent            IN NUMBER,
 EstimatorName                   IN VARCHAR2,
 EstThreshold                    IN NUMBER,
 EstComplexity                   IN NUMBER,
 EstSurchargePercent             IN NUMBER,
 CalcCustServHours               IN NUMBER,
 CalcEngineeringHours            IN NUMBER,
 CalcDraftingHours               IN NUMBER,
 IsIncompletePrice               IN VARCHAR2,
 FreightExpense 	             IN NUMBER,
 ProjectId                       IN NUMBER,
 IpAddress     					 IN VARCHAR2
)
AS 
BEGIN
  Update "Project_Estimating"
  SET
 "QuoteNumber"   		= QuoteNumber,
 "QuoteYear"   			= QuoteYear,
 "CommitNumber"   		= CommitNumber,
 "CommitYear"   		= CommitYear,
 "IsImpHasSpc"   		= IsImpHasSpc,
 "ImpSpcPrice"   		= ImpSpcPrice,
 "ImpSpcCost"   		= ImpSpcCost,
 "ImpAdjustmentPercent" = ImpAdjustmentPercent,
 "EstimatorName"        = EstimatorName,
 "EstThreshold"   		= EstThreshold,
 "EstComplexity"   		= EstComplexity,
 "EstSurchargePercent"  = EstSurchargePercent,
 "CalcCustServHours"    = CalcCustServHours,
 "CalcEngineeringHours" = CalcEngineeringHours,
 "CalcDraftingHours"    = CalcDraftingHours,
 "IsIncompletePrice"    = IsIncompletePrice,
 "FreightExpense"   	= FreightExpense,
 "ProjectId"   			= ProjectId,
 "ModifiedDate"         = CURRENT_TIMESTAMP,
 "IpAddress"            = IpAddress
   WHERE
        "EstimatingId" = EstimatingId;
END Project_Estimating_UPDATE;
/