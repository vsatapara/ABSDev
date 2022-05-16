CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSBAYSPACING_PURLIN_CREATE" 
(
    GirtSpacingId IN NUMBER,
    NominalSpacing IN NUMBER,
    OnSlope IN NUMBER,
    OutputId OUT NUMBER
)
AS 
BEGIN
     INSERT INTO "Input_GirtsBaySpacing_Purlin"
     (
        "GirtSpacingId",
        "NominalSpacing",
        "OnSlope"
     )
     VALUES
     (
        GirtSpacingId,
        NominalSpacing,
        OnSlope
     )
     RETURNING "PurlinBaySpaceId" into OutputId;
END GirtsBaySpacing_Purlin_Create;
/