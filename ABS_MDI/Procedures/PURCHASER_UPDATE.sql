CREATE OR REPLACE PROCEDURE abs_mdi."PURCHASER_UPDATE" (
PurchaserId IN NUMBER,
ProjectId IN NUMBER,
PurchaserNumber IN VARCHAR2,
PurchaserName IN VARCHAR2,
PurchaserNameCO IN VARCHAR2,
PurchaserContactName IN VARCHAR2,
EmailAddress IN VARCHAR2,
ManagerName IN VARCHAR2,
MobileNumber IN VARCHAR2,
FaxNumber IN VARCHAR2,
DayPhone IN VARCHAR2,
NightPhone IN VARCHAR2,
UserId IN  VARCHAR2,
IpAddress IN  VARCHAR2,
PhyAddressId IN NUMBER,
PhyAddress1 IN VARCHAR2,
PhyAddress2 IN VARCHAR2,
PhyCountry IN VARCHAR2,
PhyState IN VARCHAR2,
PhyCounty IN VARCHAR2,
PhyCity IN VARCHAR2,
PhyZipcode IN VARCHAR2,
PhyLongitude IN VARCHAR2,
PhyLatitude IN VARCHAR2,
MailAddressId IN NUMBER,
MailAddress1 IN VARCHAR2,
MailAddress2 IN VARCHAR2,
MailCountry IN VARCHAR2,
MailState IN VARCHAR2,
MailCounty IN VARCHAR2,
MailCity IN VARCHAR2,
MailZipcode IN VARCHAR2,
MailLongitude IN VARCHAR2,
MailLatitude IN VARCHAR2
) AS
BEGIN
UPDATE "Purchaser" SET
    "ProjectId" = ProjectId,
    "BuyerNumber" = PurchaserNumber,
    "BuyerName" = PurchaserName,
    "BuyerCareOf" = PurchaserNameCO,
    "BuyerContactName" = PurchaserContactName,
    "BuyerEmail1" = EmailAddress,
    "ManagerName" = ManagerName,
    "BuyerMobileNumber" = MobileNumber,
    "BuyerFaxNumber" = FaxNumber,
    "BuyerDayPhone" = DayPhone,
    "BuyerNightPhone" = NightPhone,
    "ModifiedBy" = 0,
    "ModifiedDate" = CURRENT_TIMESTAMP,
    "IpAddress" = IpAddress
  WHERE "PurchaserId" = PurchaserId;
DECLARE
BEGIN
Address_Update(AddressId => PhyAddressId, ProjectId => ProjectId, Address1 => PhyAddress1, Address2 => PhyAddress2,
               Country => PhyCountry, State => PhyState, County => PhyCounty, City => PhyCity, ZipCode => PhyZipcode,
               Longitude => PhyLongitude, Latitude => PhyLatitude, ModifiedBy => UserId, IpAddress => IpAddress);
END;
DECLARE
BEGIN
Address_Update(AddressId => MailAddressId, ProjectId => ProjectId, Address1 => MailAddress1, Address2 => MailAddress2,
               Country => MailCountry, State => MailState, County => MailCounty, City => MailCity, ZipCode => MailZipcode,
               Longitude => MailLongitude, Latitude => MailLatitude, ModifiedBy => UserId, IpAddress => IpAddress);
END;
END Purchaser_Update;
/