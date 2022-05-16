CREATE OR REPLACE PROCEDURE abs_mdi."INSULATIONMASTER_GET1" 
(
    OUTPUT_TABLE_NEW OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE_NEW FOR SELECT
   "Id",
   "Facing",
    CASE WHEN INSTR("Facing",' R',-1) = 0 THEN "Facing" ELSE TRIM(SUBSTR("Facing",0,INSTR("Facing",' R',-1))) END "SeparatedFacing", 
    "Thickness",
    CONCAT(CONCAT(CONCAT(CONCAT(CONCAT("Thickness",'" '),'('),'R'),"RValue"),')') "NewThickness",
    "RValue",
    "Weight",
    "ForRoof",
    "ForWall", 
    "MaxSF1",
    "MaxSF2",
    "MaxSF3",
    "MaxSF4",
    "MaxSF5",
    "MaxSF6",
    "MaxSF7",
    "BaseCost1",
    "BaseCost2",
    "Sell1",
    "Sell2",
    "Sell3",
    "Sell4",
    "Sell5",
    "Sell6",
    "Sell7",
    "GroupID",
    "IsCanada" 
FROM "InsulationMaster"
WHERE "IsDelete" != 'Y';
END;
/