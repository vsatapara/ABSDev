CREATE OR REPLACE PROCEDURE abs_mdi."MENUADMIN_SHOW" 
(
    CompanyId IN NUMBER,
    MenuAdminId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
 OPEN Output_Data FOR
SELECT
    "MenuAdminId",
    "Name",
    "ParentId",
    "CompanyId",
    "SortOrder"
FROM
    "MenuAdmin" M 
   WHERE M."CompanyId" = CompanyId and M."IsDelete" = 'N';
END MenuAdmin_Show;
/