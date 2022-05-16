CREATE OR REPLACE PROCEDURE abs_mdi."GETLINKS" (
CompanyId    IN   NUMBER,
COMPANY_Data  OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN COMPANY_Data FOR SELECT
  "CompanyId", 
  "WebLink",
  "Extra_Material_Links"
  FROM 
  "Company"
where "CompanyId" = CompanyId;
END GETLINKS;
/