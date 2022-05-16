CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSBAYSPACING_WALL_DELETE" 
(
    GirtSpacingId IN NUMBER
)
AS 
BEGIN
     DELETE FROM "Input_GirtsBaySpacing_Wall"
     WHERE "GirtSpacingId"=GirtSpacingId;
END GirtsBaySpacing_Wall_Delete;
/