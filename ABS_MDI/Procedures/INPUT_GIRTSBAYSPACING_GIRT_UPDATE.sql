CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_GIRTSBAYSPACING_GIRT_UPDATE" 
(
    GirtBaySpaceId IN NUMBER,
    GirtSpacingId IN NUMBER,
    SW1Type IN VARCHAR2 DEFAULT NULL,
    SW2Type IN VARCHAR2 DEFAULT NULL,
    EW1Type IN VARCHAR2 DEFAULT NULL,
    EW2Type IN VARCHAR2 DEFAULT NULL
)
AS 
BEGIN
     UPDATE "Input_GirtsBaySpacing_Girt"
     SET
        "GirtSpacingId"=GirtSpacingId,
        "SW1Type"=SW1Type,
        "SW2Type"=SW2Type,
        "EW1Type"=EW1Type,
        "EW2Type"=EW2Type
     WHERE "GirtBaySpaceId"=GirtBaySpaceId;
END Input_GirtsBaySpacing_Girt_Update;
/