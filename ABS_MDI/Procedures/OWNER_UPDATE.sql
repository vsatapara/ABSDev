CREATE OR REPLACE PROCEDURE abs_mdi."OWNER_UPDATE" (
OwnerId IN NUMBER,
ProjectId IN NUMBER,
BuildingOwner IN VARCHAR2,
BusinessName IN VARCHAR2,
BusinessContact IN VARCHAR2,
PhoneNumber IN VARCHAR2,
EndUseOfBuilding IN VARCHAR2,
AddressId IN NUMBER,
Address1 IN VARCHAR2,
Address2 IN VARCHAR2,
Country IN VARCHAR2,
State IN VARCHAR2,
County IN VARCHAR2,
City IN VARCHAR2,
Zipcode IN VARCHAR2,
Longitude IN VARCHAR2,
Latitude IN VARCHAR2,
UserId IN VARCHAR2,
IpAddress IN VARCHAR2,
 CopyFlag IN CHAR DEFAULT 'N') AS
BEGIN
UPDATE "EDSPrice_I_Owner" SET
    "ProjectId" = ProjectId,
    "BuildingOwner" = BuildingOwner,
    "BusinessName" = BusinessName,
    "Attention" = BusinessContact,
    "EndUseOfBuilding" = EndUseOfBuilding,
    "PhoneNumber" = PhoneNumber,
    "ModifiedBy" = UserId,
    "IpAddress" = IpAddress,
    "CopyFlag" = CopyFlag
 WHERE "OwnerId" = OwnerId;
DECLARE
BEGIN
Address_Update(AddressId => AddressId, ProjectId => ProjectId, Address1 => Address1, Address2 => Address2,
               Country => Country, State => State, County  => County, City  => City, ZipCode => Zipcode,
               Longitude => Longitude, Latitude => Latitude, ModifiedBy => UserId, IpAddress => IpAddress);
END;
END Owner_Update;
/