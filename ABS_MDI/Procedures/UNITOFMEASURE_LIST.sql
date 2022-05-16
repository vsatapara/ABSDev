CREATE OR REPLACE PROCEDURE abs_mdi."UNITOFMEASURE_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
      SELECT 
        "Name",
        "Active",
        "DisplayName",
        "MetaName"
      FROM "UnitOfMeasure";
END UnitOfMeasure_List;
/