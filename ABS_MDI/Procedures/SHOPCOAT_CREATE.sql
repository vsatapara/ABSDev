CREATE OR REPLACE PROCEDURE abs_mdi."SHOPCOAT_CREATE" 
(
    BuildingInformationId IN NUMBER,
    GalvanizedSecondary IN CHAR DEFAULT 'N',
    SealWelds IN CHAR DEFAULT 'N',
    HotDippedPrimary IN CHAR DEFAULT 'N',
    HotDippedPrice IN NUMBER,
    HotDippedWeight IN NUMBER,
    SealWeldsPrice IN NUMBER,
    SealWeldsWeight IN NUMBER,
    QuoteNumber IN VARCHAR2 DEFAULT NULL,
    QuoteYear IN VARCHAR2 DEFAULT NULL,
    EstimatorInitials IN VARCHAR2 DEFAULT NULL,
    ExpiresOn IN VARCHAR2 DEFAULT NULL,
    BoltFinish IN VARCHAR2 DEFAULT NULL,
    UserId IN NUMBER,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    ShopCoatDrpId IN NUMBER,
    OutputId OUT NUMBER
)
AS 
BEGIN
     INSERT INTO "Input_ShopCoat"
     (
        "BuildingInformationId",
        "GalvanizedSecondary",
        "SealWelds",
        "HotDippedPrimary",
        "HotDippedPrice",
        "HotDippedWeight",
        "SealWeldsPrice",
        "SealWeldsWeight",
        "QuoteNumber",
        "QuoteYear",
        "EstimatorInitials",
        "ExpiresOn",
        "BoltFinish",
        "CreatedBy",
        "CreatedDate",
        "IsDelete",
        "IpAddress",
        "ShopCoatDrpId"
     )
     VALUES
     (
        BuildingInformationId,
        GalvanizedSecondary,
        SealWelds,
        HotDippedPrimary,
        HotDippedPrice,
        HotDippedWeight,
        SealWeldsPrice,
        SealWeldsWeight,
        QuoteNumber,
        QuoteYear,
        EstimatorInitials,
        ExpiresOn,
        BoltFinish,
        UserId,
        CURRENT_TIMESTAMP,
        'N',
        IpAddress,
        case when ShopCoatDrpId=0 then null else ShopCoatDrpId end
     )
     RETURNING "ShopCoatId" into OutputId;
END ShopCoat_Create;
/