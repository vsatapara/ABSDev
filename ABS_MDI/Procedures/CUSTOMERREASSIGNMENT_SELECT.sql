CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMERREASSIGNMENT_SELECT" 
(
    ID IN NUMBER,
    Out_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
OPEN Out_Data FOR
      SELECT 
        "ID",
        "CustomerNumber",
        "CustomerName",
        "SourceCompanyId",
        "SourceCompanyName",
        "TargetCompanyId",
        "TargetCompanyName",
        "IsMigrated"
      FROM "CustomerReassignment"
    where "ID" = ID;
END CUSTOMERREASSIGNMENT_SELECT;
/