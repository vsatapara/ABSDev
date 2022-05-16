CREATE OR REPLACE PROCEDURE abs_mdi."BFM_MODULES_SELECT" 
(
    ModuleNumber IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
        SELECT 
            "ModuleNumber",
            "BuildingNumber",
            "GroupNumber",
            "Width"
         FROM "BFM_Modules"
         WHERE "ModuleNumber"=ModuleNumber;
END BFM_MODULES_SELECT;
/