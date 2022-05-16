CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSBAYSPACING_GIRT_CREATE" 
(
    GirtSpacingId IN NUMBER,
    SW1Type IN VARCHAR2 DEFAULT NULL,
    SW2Type IN VARCHAR2 DEFAULT NULL,
    EW1Type IN VARCHAR2 DEFAULT NULL,
    EW2Type IN VARCHAR2 DEFAULT NULL,
    OutputId OUT NUMBER
)
AS 
BEGIN
     INSERT INTO "Input_GirtsBaySpacing_Girt"
     (
        "GirtSpacingId",
        "SW1Type",
        "SW2Type",
        "EW1Type",
        "EW2Type"
     )
     VALUES
     (
        GirtSpacingId,
        SW1Type,
        SW2Type,
        EW1Type,
        EW2Type
     )
     RETURNING "GirtBaySpaceId" into OutputId;
END GirtsBaySpacing_Girt_Create;
/