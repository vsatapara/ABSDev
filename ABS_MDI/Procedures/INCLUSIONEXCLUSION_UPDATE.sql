CREATE OR REPLACE PROCEDURE abs_mdi."INCLUSIONEXCLUSION_UPDATE" 
(
    InclusionExclusionId IN NUMBER,
    IsActive IN CHAR,    
    IsForBuildings IN CHAR,
    IsForComponents IN CHAR,
    Name IN VARCHAR2,
    CompanyId IN  NUMBER,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
  UPDATE "ShippingZoneGroup" SET
        "IsActive" = IsActive,
        "IsForBuildings" = IsForBuildings,
        "IsForComponents" = IsForComponents,
        "Name" = Name,    
        "CompanyId" = CompanyId,
        "ModifiedBy" = ModifiedBy, 
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
  WHERE "InclusionExclusionId" = InclusionExclusionId;
END InclusionExclusion_Update;
/