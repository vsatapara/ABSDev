CREATE OR REPLACE PROCEDURE abs_mdi."SHIPPLANTCOUNTRIESTOSHIP_CREATE" 
(
    CountriesToShipId IN NUMBER,
    ShippingPlantId IN NUMBER,
    CountryId IN NUMBER,
    UserId IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
     INSERT INTO "ShipPlantCountriesToShip"
     (
     "ShippingPlantId",
     "CountryId",
     "CreatedBy",
     "CreatedDate",
     "IpAddress"
     )
     VALUES
     (
        ShippingPlantId,
        CountryId,
        UserId,
        CURRENT_TIMESTAMP,
        IpAddress
     );
END SHIPPLANTCOUNTRIESTOSHIP_CREATE;
/