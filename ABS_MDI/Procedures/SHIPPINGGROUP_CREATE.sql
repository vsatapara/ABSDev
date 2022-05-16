CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPINGGROUP_CREATE" 
(
    Name IN VARCHAR2,
    IsForComponents IN CHAR,
    IsActive IN CHAR,
    UserId IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
) AS 
BEGIN
    INSERT INTO "ShippingGroup" 
    (
        "Name", 
        "IsForComponents", 
        "IsActive", 
        "CreatedBy", 
        "CreatedDate",
        "IpAddress"
    ) 
    VALUES 
    (
        Name, 
        IsForComponents, 
        IsActive, 
        UserId,
        CURRENT_TIMESTAMP,
        IpAddress
    )
    RETURNING "ShippingGroupId" into OutputId;
    
END SHIPPINGGROUP_CREATE;
/