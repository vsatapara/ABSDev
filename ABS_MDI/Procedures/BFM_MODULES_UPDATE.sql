CREATE OR REPLACE PROCEDURE abs_mdi."BFM_MODULES_UPDATE" 
(
    ModuleNumber IN NUMBER,
    BuildingNumber IN VARCHAR2,
    GroupNumber IN VARCHAR2,
    Width IN VARCHAR2,
    Space3 IN VARCHAR2,
    Space4 IN VARCHAR2,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
    UPDATE "BFM_Modules" SET
        "ModuleNumber"=ModuleNumber,
        "BuildingNumber"=BuildingNumber,
        "GroupNumber"=GroupNumber,
        "Width"=Width,
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
    WHERE "ModuleNumber"=ModuleNumber;
    
END BFM_MODULES_UPDATE;
/