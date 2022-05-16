CREATE OR REPLACE PROCEDURE abs_mdi."SHOPCOAT_UPDATE" 
(
    ShopCoatId IN NUMBER,
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
    ShopCoatDrpId IN NUMBER
)
AS 
BEGIN
    UPDATE "Input_ShopCoat"
    SET
        "BuildingInformationId"=BuildingInformationId,
        "GalvanizedSecondary"=GalvanizedSecondary,
        "SealWelds"=SealWelds,
        "HotDippedPrimary"=HotDippedPrimary,
        "HotDippedPrice"=HotDippedPrice,
        "HotDippedWeight"=HotDippedWeight,
        "SealWeldsPrice"=SealWeldsPrice,
        "SealWeldsWeight"=SealWeldsWeight,
        "QuoteNumber"=QuoteNumber,
        "QuoteYear"=QuoteYear,
        "EstimatorInitials"=EstimatorInitials,
        "ExpiresOn"=ExpiresOn,
        "BoltFinish"=BoltFinish,
        "ModifiedBy"=UserId,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress,
        "ShopCoatDrpId"=case when ShopCoatDrpId=0 then null else ShopCoatDrpId end
    WHERE "ShopCoatId" = ShopCoatId;
END ShopCoat_Update;
/