CREATE OR REPLACE PROCEDURE abs_mdi."COMPANYIDBYCOMPANYCODE_SELECT" (
CompanyCode    IN   VARCHAR2,
COMPANY_Data  OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN COMPANY_Data FOR SELECT
  "CompanyId" 
  FROM 
  "Company"
where "CompanyCode" = CompanyCode;
END CompanyIdByCompanyCode_Select;
/