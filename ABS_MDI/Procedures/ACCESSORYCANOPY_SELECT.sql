CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORYCANOPY_SELECT" 
(
    --AccessoriesCanopyId IN NUMBER,
    Id IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
      SELECT
        *
        
      FROM "Accessories_Canopy"
      WHERE "AccessoriesCanopyId"=Id;
END ACCESSORYCANOPY_SELECT;
/