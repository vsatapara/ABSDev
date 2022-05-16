CREATE OR REPLACE PROCEDURE abs_mdi."ADDRESS_CREATE" (
ProjectId IN NUMBER,
Address1 IN VARCHAR2,
Address2 IN VARCHAR2,
Country IN VARCHAR2,
State IN VARCHAR2,
County IN VARCHAR2,
City IN VARCHAR2,
Zipcode IN VARCHAR2,
Longitude IN VARCHAR2,
Latitude IN VARCHAR2,
CreatedBy IN VARCHAR2,
IpAddress IN VARCHAR2,
Addresstype IN VARCHAR2,
OutputId OUT NUMBER) AS
BEGIN 
INSERT INTO "I_Address" (
    "ProjectId",
    "Address1",
    "Address2",
    "Country",
    "State",
    "County",
    "City",
    "ZipCode",
    "Longitude",
    "Latitude",
    "CreatedBy",
    "CreatedDate",
    "IsDelete",
    "IpAddress",
    "AddressType"
) VALUES (
    ProjectId,
    Address1,
    Address2,
    Country,
    State,
    County,
    City,
    Zipcode,
    Longitude,
    Latitude,
    CreatedBy,
    CURRENT_TIMESTAMP,
    'N',
    IpAddress,
    Addresstype
) RETURNING "AddressId" INTO OutputId;
END Address_Create;
/