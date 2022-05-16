CREATE OR REPLACE PROCEDURE abs_mdi."COMPANYORDERDOCUMENTATIONSETTING_GETDATABYCUSTOMERID" 
/*   Created By Mayuresh Jagtap 
      Created Date  18 -3-2021
      Description   This stored Procedure used to get document setting by customer Id from CompanyOrderDocumentationSetting  */
(
 customerId IN VARCHAR2, 
 Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
 SELECT 
 cods."IsFinalDrawing",
 cods."IsPermitDrawing",
 cods."IsSalesChangeOrder",
 cods."IsCalculationFiles",
 cods."IsBOMFiles",cods."IsApprovalDrawing"
  from "CompanyOrderDocumentationSetting" cods 
  inner join "Customer" c  on c."CompanyId"=cods."CompanyId" 
  where  c."CustomerNo"=customerId;
END COMPANYORDERDOCUMENTATIONSETTING_GETDATABYCUSTOMERID;
/