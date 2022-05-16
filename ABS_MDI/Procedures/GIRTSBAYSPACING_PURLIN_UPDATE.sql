CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSBAYSPACING_PURLIN_UPDATE" 
(
    PurlinBaySpaceId IN NUMBER,
    GirtSpacingId IN NUMBER,
    NominalSpacing IN NUMBER,
    OnSlope IN NUMBER
)
AS 
BEGIN
     UPDATE "Input_GirtsBaySpacing_Purlin"
     SET
        "GirtSpacingId"=GirtSpacingId,
        "NominalSpacing"=NominalSpacing,
        "OnSlope"=OnSlope
     WHERE "PurlinBaySpaceId"=PurlinBaySpaceId;
END GirtsBaySpacing_Purlin_Update;
/