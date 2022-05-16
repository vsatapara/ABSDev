CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMERREASSIGNMENT_LIST" 
(
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
      FROM "CustomerReassignment";
END CUSTOMERREASSIGNMENT_LIST;
/