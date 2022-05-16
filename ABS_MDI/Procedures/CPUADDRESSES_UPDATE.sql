CREATE OR REPLACE PROCEDURE abs_mdi."CPUADDRESSES_UPDATE" 
(
    AddressId IN NUMBER,
    IsActive IN CHAR,
    CanUseForMailing IN CHAR,
    Address1 IN NVARCHAR2,
    Address2 IN NVARCHAR2,
    City IN NVARCHAR2,
    CountyRegion IN NVARCHAR2,
    UserId IN NUMBER,
    IpAddress IN VARCHAR2,
    Name IN NVARCHAR2
)
AS 
BEGIN
      UPDATE "CpuAddresses" SET
        "IsActive"=IsActive,
        "CanUseForMailing"=CanUseForMailing,
        "Address1"=Address1,
        "Address2"=Address2,
        "City"=City,
        "CountyRegion"=CountyRegion,        
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress,
        "Name"=Name
    WHERE "AddressId"=AddressId;
END CPUADDRESSES_UPDATE;
/