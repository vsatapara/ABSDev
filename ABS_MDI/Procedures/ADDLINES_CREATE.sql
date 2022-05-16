CREATE OR REPLACE PROCEDURE abs_mdi."ADDLINES_CREATE" 
(
    BuildingInformationId IN NUMBER,
    Description IN VARCHAR2 DEFAULT NULL,
    UnitWeight IN NUMBER,
    UnitPrice IN NUMBER,
    ListOrNet IN VARCHAR2 DEFAULT NULL,
    ExpiresOn IN VARCHAR2 DEFAULT NULL,
    QuoteNumber IN VARCHAR2 DEFAULT NULL,
    QuoteYear IN VARCHAR2 DEFAULT NULL,
    EstInitials IN VARCHAR2 DEFAULT NULL,
    Guid IN RAW,
    Quantity IN NUMBER,
    Internal IN NUMBER,
    IncludeFreight IN VARCHAR2 DEFAULT NULL,
    DontShowPriceWeight IN CHAR DEFAULT 'N',
    IsSpecialized IN CHAR DEFAULT 'N',
    ScreenType IN VARCHAR2 DEFAULT NULL,
    OutputId OUT NUMBER
)
AS 
BEGIN
     INSERT INTO "Input_AddLines"
     (
        "BuildingInformationId",
        "Description",
        "UnitWeight",
        "UnitPrice",
        "ListOrNet",
        "ExpiresOn",
        "QuoteNumber",
        "QuoteYear",
        "EstInitials",
        "Guid",
        "Quantity",
        "Internal",
        "IncludeFreight",
        "DontShowPriceWeight",
        "IsSpecialized",
        "ScreenType"
     )
     VALUES
     (
        BuildingInformationId,
        Description,
        UnitWeight,
        UnitPrice,
        ListOrNet,
        ExpiresOn,
        QuoteNumber,
        QuoteYear,
        EstInitials,
        Guid,
        Quantity,
        Internal,
        IncludeFreight,
        DontShowPriceWeight,
        IsSpecialized,
        ScreenType
     )
     RETURNING "AddLinesId" into OutputId;
END AddLines_Create;
/