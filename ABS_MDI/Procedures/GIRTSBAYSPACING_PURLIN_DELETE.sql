CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSBAYSPACING_PURLIN_DELETE" 
(
    GirtSpacingId IN NUMBER
)
AS 
BEGIN
     DELETE FROM "Input_GirtsBaySpacing_Purlin"
     WHERE "GirtSpacingId"=GirtSpacingId;
END GirtsBaySpacing_Purlin_Delete;
/