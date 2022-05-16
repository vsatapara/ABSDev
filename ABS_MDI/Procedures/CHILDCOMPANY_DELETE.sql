CREATE OR REPLACE PROCEDURE abs_mdi."CHILDCOMPANY_DELETE" 
(
   CompanyId IN NUMBER
)
AS 
BEGIN
    UPDATE "Company"
	SET "IsDelete" = 'Y'
	WHERE "CompanyId" = CompanyId;
END ChildCompany_Delete;
/