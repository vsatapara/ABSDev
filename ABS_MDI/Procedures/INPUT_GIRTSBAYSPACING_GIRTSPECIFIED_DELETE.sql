CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_GIRTSBAYSPACING_GIRTSPECIFIED_DELETE" 
(
    GirtBaySpaceId IN NUMBER
)
AS 
BEGIN
     DELETE FROM "Input_GirtsBaySpacing_GirtSpecified"
     WHERE "GirtBaySpaceId"=GirtBaySpaceId;
END Input_GirtsBaySpacing_GirtSpecified_Delete;
/