CREATE OR REPLACE PROCEDURE abs_mdi."IMPERSONATEUSER_COMPANYLIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN OUTPUT_DATA FOR 
      SELECT 
        "CompanyName"
      FROM "Company";
END ImpersonateUser_CompanyList;
/