CREATE OR REPLACE PROCEDURE abs_mdi."OERECTIONDATA_SELECT" 
(
    ProjectId IN NUMBER,
    O_ErectionData OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN O_ErectionData FOR SELECT
    "ErectionDataId",
    "Process",
    "ProcessId",
    "Quantity",
    "Unit",
    "Rate",
    "ManHours",
    "LaborDivision",
    "ProjectNumber",
    "ProjectId"
FROM
    "EDSPrice_O_ErectionData"
    WHERE "ProjectId" = ProjectId
     AND ("IsDeleted" IS NULL  OR "IsDeleted" != 'Y');
END OErectionData_Select;
/