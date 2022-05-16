CREATE OR REPLACE PROCEDURE abs_mdi."MISCADDLINESESTIMATING_SELECT" 
(
    ProjectId IN NUMBER,
    Estimating_Data OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN Estimating_Data FOR SELECT
    "QuoteNumber",
    "QuoteYear",
    "EstimatorName"
FROM
    "Project_Estimating"
     WHERE         
            "ProjectId" = ProjectId
        AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
END MiscAddLinesEstimating_Select;
/