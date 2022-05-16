CREATE OR REPLACE PROCEDURE abs_mdi."BFM_GROUPS_UPDATE" 
(
    GroupNumber IN NUMBER,
    BuildingNumber IN NUMBER,
    ColType1 IN VARCHAR2,
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
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
    UPDATE "BFM_Groups" SET
        "GroupNumber"=GroupNumber,
        "BuildingNumber"=BuildingNumber,
        "ColType1"=ColType1,
        "ColType2"=ColType2,
        "WebDepth1"=WebDepth1,
        "WebDepth2"=WebDepth2,
        "RafterDepth1"=RafterDepth1,
        "RafterDepth2"=RafterDepth2,
        "Clearspan"=Clearspan,
        "IsElevation1"=Unsupported1,
        "IsElevation2"=Unsupported2,
        "Elevation1"=UnsupportedElevation1,
        "Elevation2"=UnsupportedElevation2,
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
    WHERE "GroupNumber"=GroupNumber;
    
END BFM_GROUPS_UPDATE;
/