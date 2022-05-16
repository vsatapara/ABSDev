CREATE OR REPLACE PROCEDURE abs_mdi."INCLUSIONEXCLUSION_CREATE" 
(
    IsActive IN CHAR,    
    IsForBuildings IN CHAR,
    IsForComponents IN CHAR,    
    Name IN VARCHAR2,
    CompanyId IN  NUMBER,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
    INSERT INTO "ShippingZoneGroup" 
    (
        "IsActive",
        "IsForBuildings",
        "IsForComponents",
        "Name",    
        "CompanyId",
        "CreatedBy",
        "CreatedDate",
        "IpAddress",
        "IsDelete"
    ) 
    VALUES 
    (
        IsActive,
        IsForBuildings,
        IsForComponents,
        Name,    
        CompanyId,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress,
        'N'
    )
    RETURNING "InclusionExclusionId" into OutputId;
END InclusionExclusion_Create;
/