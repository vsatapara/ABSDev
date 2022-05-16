CREATE OR REPLACE PROCEDURE abs_mdi."BFM_GROUPS_CREATE" 
(
    BuildingNumber IN NUMBER,
    ColType1 IN NUMBER,
    ColType2 IN VARCHAR2,
    WebDepth1 IN DECIMAL,
    WebDepth2 IN DECIMAL,
    RafterDepth1 IN DECIMAL,
    RafterDepth2 IN DECIMAL,
    Clearspan IN CHAR,
    Unsupported1 IN CHAR,
    Unsupported2 IN CHAR,
    UnsupportedElevation1 IN DECIMAL,
    UnsupportedElevation2 IN DECIMAL,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
     INSERT INTO "BFM_Groups"
     (
        "BuildingNumber",
        "ColType1",
        "ColType2",
        "WebDepth1",
        "WebDepth2",
        "RafterDepth1",
        "RafterDepth2",
        "Clearspan",
        "IsElevation1",
        "IsElevation2",
        "Elevation1",
        "Elevation2",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
     )
     VALUES
     (
        BuildingNumber,
        ColType1,
        ColType2,
        WebDepth1,
        WebDepth2,
        RafterDepth1,
        RafterDepth2,
        Clearspan,
        Unsupported1,
        Unsupported2,
        UnsupportedElevation1,
        UnsupportedElevation2,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     )
     RETURNING "GroupNumber" into OutputId;
     
END BFM_GROUPS_CREATE;
/