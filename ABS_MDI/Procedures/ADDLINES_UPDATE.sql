CREATE OR REPLACE PROCEDURE abs_mdi."ADDLINES_UPDATE" 
(
    AddLinesId IN NUMBER,
    BuildingInformationId IN NUMBER,
    Description IN VARCHAR2 DEFAULT NULL,
    UnitWeight IN NUMBER,
    UnitPrice IN NUMBER,
    ListOrNet IN VARCHAR2 DEFAULT NULL,
    ExpiresOn IN VARCHAR2 DEFAULT NULL,
    QuoteNumber IN VARCHAR2 DEFAULT NULL,
    QuoteYear IN VARCHAR2 DEFAULT NULL,
    EstInitials IN VARCHAR2 DEFAULT NULL,
    Guid IN RAW DEFAULT NULL,
    Quantity IN NUMBER,
    Internal IN NUMBER,
    IncludeFreight IN VARCHAR2 DEFAULT NULL,
    DontShowPriceWeight IN CHAR DEFAULT 'N',
    IsSpecialized IN CHAR DEFAULT 'N',
    ScreenType IN VARCHAR2 DEFAULT NULL
)
AS 
BEGIN
    UPDATE "Input_AddLines"
    SET
        "BuildingInformationId"=BuildingInformationId,
        "Description"=Description,
        "UnitWeight"=UnitWeight,
        "UnitPrice"=UnitPrice,
        "ListOrNet"=ListOrNet,
        "ExpiresOn"=ExpiresOn,
        "QuoteNumber"=QuoteNumber,
        "QuoteYear"=QuoteYear,
        "EstInitials"=EstInitials,
        "Guid"=Guid,
        "Quantity"=Quantity,
        "Internal"=Internal,
        "IncludeFreight"=IncludeFreight,
        "DontShowPriceWeight"=DontShowPriceWeight,
        "IsSpecialized"=IsSpecialized,
        "ScreenType"=ScreenType
    WHERE "AddLinesId" = AddLinesId;
END AddLines_Update;
/