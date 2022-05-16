CREATE OR REPLACE PROCEDURE abs_mdi."INSULATION_ACCESSORIES_UPDATE" 
(
    InsulationAccessoriesId IN NUMBER,
    BuildingNumber IN NUMBER  DEFAULT NULL,
    ItemNumber IN NUMBER  DEFAULT NULL,
    Quantity IN NUMBER  DEFAULT NULL,
    Description IN VARCHAR2  DEFAULT NULL,
    Facing IN VARCHAR2  DEFAULT NULL,
    Width IN NUMBER  DEFAULT NULL,
    Weight IN NUMBER  DEFAULT NULL,
    Price IN NUMBER  DEFAULT NULL,
    IsPriced IN NUMBER  DEFAULT NULL,
    ErrorCode IN NUMBER  DEFAULT NULL,
    InsulationType IN VARCHAR2  DEFAULT NULL,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    ModifiedBy IN VARCHAR2
)
AS 
BEGIN
    UPDATE "InsulationAccessories"
    SET
        "BuildingNumber"=BuildingNumber,
        "ItemNumber"=ItemNumber,
        "Quantity"=Quantity,
        "Description"=Description,
        "Facing"=Facing,
        "Width"=Width,
        "Weight"=Weight,
        "Price"=Price,
        "IsPriced"=IsPriced,
        "ErrorCode"=ErrorCode,
        "InsulationType"=InsulationType,
        "IpAddress" = IpAddress,
        "ModifiedBy" = ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP
    WHERE "InsulationAccessoriesId"=InsulationAccessoriesId;
END INSULATION_ACCESSORIES_UPDATE;
/