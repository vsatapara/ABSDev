CREATE OR REPLACE PROCEDURE abs_mdi."SHOPCOAT_RESET" 
(
    ShopCoatId IN NUMBER,
    UserId IN NUMBER
)
AS 
BEGIN
--Update ShopCoat
    UPDATE "Input_ShopCoat"
    SET
        "GalvanizedSecondary"=null,
        "SealWelds"=null,
        "HotDippedPrimary"=null,
        "HotDippedPrice"=0,
        "HotDippedWeight"=0,
        "SealWeldsPrice"=0,
        "SealWeldsWeight"=0,
        "QuoteNumber"=null,
        "QuoteYear"=null,
        "EstimatorInitials"=null,
        "ExpiresOn"=null,
        "BoltFinish"=null,
        "ShopCoatDrpId"=null,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP
    WHERE "ShopCoatId" = ShopCoatId;
--Delete NetAddLineDetails
    DELETE FROM "Input_NetAddLineDetails" 
    WHERE "Guid"= (SELECT "Guid" FROM "Input_AddLines" WHERE "BuildingInformationId"= (SELECT "BuildingInformationId" FROM "Input_ShopCoat" WHERE "ShopCoatId"=ShopCoatId) 
    and "ScreenType"='ShopCoat');
--Delete AddLines
    DELETE FROM "Input_AddLines" 
    WHERE "BuildingInformationId"= (SELECT "BuildingInformationId" FROM "Input_ShopCoat" WHERE "ShopCoatId"=ShopCoatId) 
    and "ScreenType"='ShopCoat';
END ShopCoat_Reset;
/