CREATE OR REPLACE PROCEDURE abs_mdi."INSULATIONMASTER_GET" 
(
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "Id",
    "Facing",
    "Thickness",
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
FROM
    "InsulationMaster"
     WHERE "IsDelete" != 'Y';
END;
/