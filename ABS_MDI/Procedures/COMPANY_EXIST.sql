CREATE OR REPLACE PROCEDURE abs_mdi."COMPANY_EXIST" (
    CompanyId IN NUMBER,
    CompanyName IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
IF CompanyId = 0 then
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "Company" WHERE LOWER("CompanyName") = LOWER(CompanyName) AND "IsDelete" != 'Y';
ELSE
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "Company" WHERE LOWER("CompanyName") = LOWER(CompanyName) and "CompanyId" != CompanyId AND "IsDelete" != 'Y';
END IF;
END COMPANY_EXIST;
/