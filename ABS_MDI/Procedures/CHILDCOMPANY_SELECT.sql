CREATE OR REPLACE PROCEDURE abs_mdi."CHILDCOMPANY_SELECT" 
(
    CompanyId IN NUMBER,
    Output_Model OUT SYS_REFCURSOR,
    Output_List OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Model FOR 
      SELECT 
        "CompanyId",
        "CompanyName",
        "AdministratorEmail",
        "IsActive",
        "ShippingPlantGroupFromParentId" AS "BuildingShippingGroupId",
        "ComponentsShippingGroupId",
        "PricingSegmentFromParentId" AS "BuildingPricingSegmentId",
        "ComponentsPricingSegmentId",
        "ShippingZoneGroupFromParentId" AS "BuildingIncExcGeoRegionGroupId",
        "ComponentsIncExcGeoRegionGroupId",
        "PermissionGroupFromParentId",
        "IsNotStockedMessageForComponents",
        "IsNotAvailableMessageForComponents",
        "BuildingPhone",
        "ComponentPhone",
        "BuildingPriceMultiplier",
        "ComponentPriceMultiplier",
        "IsBasedInUsa",
        "IsNciBrand",
        "IsQuickQuoteAvailable",
        "MailServerHost",
        "MailServerPort",
        "MailServerIsAuthenticationRequired",
        "MailServerUserName",
        "MailServerPassword",
        "ReplyToAddress",
        "ExpressDeliveryPrice",
        "WetStampFee",
        "IsAllowedChildCompanies" 
      FROM "Company"
      WHERE "CompanyId"=CompanyId AND "IsDelete" != 'Y';
      
    OPEN Output_List FOR 
    SELECT
        "DocumentPricingId",
        "CompanyId",
        "DocumentTypeId",
        "NumberOfSetsFreeSealed",
        "NumberOfSetsFreeUnSealed",
        "PerSetFeeSealed",
        "PerSetFeeUnSealed"
    FROM "DocumentPricing"
    WHERE "CompanyId"=CompanyId;
END ChildCompany_Select;
/