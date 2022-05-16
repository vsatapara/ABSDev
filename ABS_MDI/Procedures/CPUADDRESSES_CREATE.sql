CREATE OR REPLACE PROCEDURE abs_mdi."CPUADDRESSES_CREATE" 
(
    --AddressId IN NUMBER,
    IsActive IN CHAR,
    CanUseForMailing IN CHAR,
    Address1 IN NVARCHAR2,
    Address2 IN NVARCHAR2,
    City IN NVARCHAR2,
    CountyRegion IN NVARCHAR2,
    UserId IN NUMBER,
    IpAddress IN VARCHAR2,
    Name IN NVARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
   INSERT INTO "CpuAddresses"
    (
    "IsActive",
    "CanUseForMailing",
    "Address1",
    "Address2",
    "City",
    "CountyRegion",
    "CreatedBy",
    "CreatedDate",
    "IsDelete",
    "IpAddress",
    "Name"
     )
     VALUES
     (
        IsActive,
        CanUseForMailing,
        Address1,
        Address2,
        City,
        CountyRegion,
        UserId,
        CURRENT_TIMESTAMP,
        'N',
        IpAddress,
        Name
     )
     RETURNING "AddressId" into OutputId;
     
END CPUADDRESSES_CREATE;
/