CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPLANTCOUNTRIESTOSHIP_UPDATE" 
(
     CountriesToShipId IN NUMBER,
    ShippingPlantId IN NUMBER,
    CountryId IN NUMBER,
    UserId IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
    UPDATE "ShipPlantCountriesToShip" SET
        "ShippingPlantId"=ShippingPlantId,
        "CountryId"=CountryId,
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
    WHERE "CountriesToShipId"=CountriesToShipId;
END SHIPPLANTCOUNTRIESTOSHIP_UPDATE;
/