CREATE OR REPLACE PROCEDURE abs_mdi."ADDRESS_UPDATE" (
AddressId IN NUMBER,
ProjectId IN NUMBER,
Address1 IN VARCHAR2,
Address2 IN VARCHAR2,
Country IN VARCHAR2,
State IN VARCHAR2,
County IN VARCHAR2,
City IN VARCHAR2,
ZipCode IN VARCHAR2,
Longitude IN VARCHAR2,
Latitude IN VARCHAR2,
ModifiedBy IN VARCHAR2,
IpAddress IN VARCHAR2
)
AS
BEGIN 
UPDATE "I_Address" SET
    "ProjectId" = ProjectId,
    "Address1" = Address1,
    "Address2" = Address2,
    "Country" = Country,
    "State" = State,
    "County" = County,
    "City" = City,
    "ZipCode" = ZipCode,
    "Longitude" = Longitude,
    "Latitude" = Latitude,
    "ModifiedBy" = ModifiedBy,
    "IpAddress" = IpAddress
WHERE "AddressId" = AddressId;
END Address_Update;
/