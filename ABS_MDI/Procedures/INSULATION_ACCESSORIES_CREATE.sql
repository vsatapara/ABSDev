CREATE OR REPLACE PROCEDURE abs_mdi."INSULATION_ACCESSORIES_CREATE" 
(
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
    CreatedBy IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
    INSERT INTO "InsulationAccessories" 
    (
        "BuildingNumber",
        "ItemNumber",
        "Quantity",
        "Description",
        "Facing",
        "Width",
        "Weight",
        "Price",
        "IsPriced",
        "ErrorCode",
        "InsulationType",
        "CreatedBy",
        "CreatedDate",
        "IpAddress",
        "IsDelete"
    )
    VALUES
    (
        BuildingNumber,
        ItemNumber,
        Quantity,
        Description,
        Facing,
        Width,
        Weight,
        Price,
        IsPriced,
        ErrorCode,
        InsulationType,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress,
        'N'
    )
    RETURNING "InsulationAccessoriesId" into OutputId;
END INSULATION_ACCESSORIES_CREATE;
/