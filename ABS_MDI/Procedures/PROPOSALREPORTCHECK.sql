CREATE OR REPLACE PROCEDURE abs_mdi."PROPOSALREPORTCHECK" 
(
 ProjectId IN NUMBER,
 Output_Proposal_Data OUT SYS_REFCURSOR
 )
AS 
BEGIN
    OPEN Output_Proposal_Data FOR
    SELECT 
         (SELECT Count(1) FROM "BuildingInformation" WHERE "ProjectId"=ProjectId AND ("IsDelete"='N'OR "IsDelete" IS NULL)) "TotalBuilding",
         (SELECT Count(1) FROM "BuildingInformation" WHERE "ProjectId"=ProjectId AND ("IsDelete"='N'OR "IsDelete" IS NULL) AND "IsComplete"='Y') "CompleteBuilding"
     FROM DUAL;
END ProposalReportCheck;
/