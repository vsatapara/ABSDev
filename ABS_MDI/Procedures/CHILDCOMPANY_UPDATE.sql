CREATE OR REPLACE PROCEDURE abs_mdi."CHILDCOMPANY_UPDATE" 
(
    CompanyId IN NUMBER,
    CompanyName IN VARCHAR2, 
    AdministratorEmail IN NVARCHAR2,
    IsActive IN CHAR,
    BuildingShippingGroupId IN NUMBER,
    ComponentsShippingGroupId IN NUMBER,
    BuildingPricingSegmentId IN NUMBER,
    ComponentsPricingSegmentId IN NUMBER,    
    BuildingIncExcGeoRegionGroupId IN NUMBER,
    ComponentsIncExcGeoRegionGroupId IN NUMBER,
    PermissionGroupFromParentId IN NUMBER,
    IsNotStockedMessageForComponents IN NVARCHAR2,
    IsNotAvailableMessageForComponents IN NVARCHAR2,
    BuildingPhone IN VARCHAR2,
    ComponentPhone IN NUMBER,
    BuildingPriceMultiplier  IN FLOAT,
    ComponentPriceMultiplier IN FLOAT,
    IsAllowedChildCompanies IN CHAR,
    IsBasedInUsa IN CHAR,
    IsNciBrand IN CHAR,
    IsQuickQuoteAvailable IN CHAR,
    MailServerHost IN NVARCHAR2,
    MailServerPort IN NUMBER,
    MailServerIsAuthenticationRequired IN CHAR,
    MailServerUserName IN VARCHAR2,
    MailServerPassword IN VARCHAR2,
    ReplyToAddress IN VARCHAR2,
    ExpressDeliveryPrice IN FLOAT,
    WetStampFee IN FLOAT,
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
    UPDATE "Company" SET
        "CompanyId"=CompanyId,
        "CompanyName"=CompanyName,
        "AdministratorEmail"=AdministratorEmail,
        "IsActive"=IsActive,
        "ShippingPlantGroupFromParentId"=BuildingShippingGroupId,
        "ComponentsShippingGroupId"=ComponentsShippingGroupId,
        "PricingSegmentFromParentId"=BuildingPricingSegmentId,
        "ComponentsPricingSegmentId"=ComponentsPricingSegmentId,
        "ShippingZoneGroupFromParentId"=BuildingIncExcGeoRegionGroupId,
        "ComponentsIncExcGeoRegionGroupId"=ComponentsIncExcGeoRegionGroupId,
        "PermissionGroupFromParentId"=PermissionGroupFromParentId,
        "IsNotStockedMessageForComponents"=IsNotStockedMessageForComponents,
        "IsNotAvailableMessageForComponents"=IsNotAvailableMessageForComponents,
        "BuildingPhone"=BuildingPhone,
        "ComponentPhone"=ComponentPhone,
        "BuildingPriceMultiplier"=BuildingPriceMultiplier,
        "ComponentPriceMultiplier"=ComponentPriceMultiplier,
        "IsAllowedChildCompanies"=IsAllowedChildCompanies,
        "IsBasedInUsa"=IsBasedInUsa,
        "IsNciBrand"=IsNciBrand,
        "IsQuickQuoteAvailable"=IsQuickQuoteAvailable,
        "MailServerHost"=MailServerHost,
        "MailServerPort"=MailServerPort,
        "MailServerIsAuthenticationRequired"=MailServerIsAuthenticationRequired,
        "MailServerUserName"=MailServerUserName,
        "MailServerPassword"=MailServerPassword,
        "ReplyToAddress"=ReplyToAddress,
        "ExpressDeliveryPrice"=ExpressDeliveryPrice,
        "WetStampFee"=WetStampFee,
        "ModifiedBy"=ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
    WHERE "CompanyId"=CompanyId;
    
END ChildCompany_Update;
/