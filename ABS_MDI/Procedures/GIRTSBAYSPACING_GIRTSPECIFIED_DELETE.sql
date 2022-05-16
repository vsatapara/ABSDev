CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSBAYSPACING_GIRTSPECIFIED_DELETE" 
(
    GirtBaySpaceId IN NUMBER
)
AS 
BEGIN
     DELETE FROM "Input_GirtsBaySpacing_GirtSpecified"
     WHERE "GirtBaySpaceId"=GirtBaySpaceId;
END GirtsBaySpacing_GirtSpecified_Delete;
/