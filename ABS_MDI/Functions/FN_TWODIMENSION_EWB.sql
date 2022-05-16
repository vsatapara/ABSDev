CREATE OR REPLACE FUNCTION abs_mdi."FN_TWODIMENSION_EWB" 
(
    BuildingInformationId number
)
RETURN NUMBER
IS 
BayEWB NUMBER;
BEGIN
    SELECT "BayCount" into BayEWB
     FROM "Input_Endwall"
     WHERE "BuildingNo" = BuildingInformationId AND "EndWallNo"=1;

    return BayEWB;
END FN_TWODIMENSION_EWB;
/