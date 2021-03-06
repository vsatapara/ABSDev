CREATE OR REPLACE PROCEDURE abs_mdi."CHILDCOMPANY_CREATE" 
(
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
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
     INSERT INTO "Company"
     (
        "CompanyName",
        "AdministratorEmail",
        "IsActive",
        "ShippingPlantGroupFromParentId",
        "ComponentsShippingGroupId",
        "PricingSegmentFromParentId",
        "ComponentsPricingSegmentId",
        "ShippingZoneGroupFromParentId",
        "ComponentsIncExcGeoRegionGroupId",
        "PermissionGroupFromParentId",
        "IsNotStockedMessageForComponents",
        "IsNotAvailableMessageForComponents",
        "BuildingPhone",
        "ComponentPhone",
        "BuildingPriceMultiplier",
        "ComponentPriceMultiplier",
        "IsAllowedChildCompanies",
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
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
     )
     VALUES
     (
        CompanyName,
        AdministratorEmail,
        IsActive,
        BuildingShippingGroupId,
        ComponentsShippingGroupId,
        BuildingPricingSegmentId,
        ComponentsPricingSegmentId,
        BuildingIncExcGeoRegionGroupId,
        ComponentsIncExcGeoRegionGroupId,
        PermissionGroupFromParentId,
        IsNotStockedMessageForComponents,
        IsNotAvailableMessageForComponents,
        BuildingPhone,
        ComponentPhone,
        BuildingPriceMultiplier,
        ComponentPriceMultiplier,
        IsAllowedChildCompanies,
        IsBasedInUsa,
        IsNciBrand,
        IsQuickQuoteAvailable,
        MailServerHost,
        MailServerPort,
        MailServerIsAuthenticationRequired,
        MailServerUserName,
        MailServerPassword,
        ReplyToAddress,
        ExpressDeliveryPrice,
        WetStampFee,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     )
     RETURNING "CompanyId" into OutputId;
END ChildCompany_Create;
/