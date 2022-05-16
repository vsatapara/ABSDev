CREATE OR REPLACE PROCEDURE abs_mdi."TERMSANDCONDITIONS_CREATE" 
(
    CompanyId IN NUMBER,
    Content IN NCLOB,
    IsForSignatureOrders IN CHAR,
    Name IN VARCHAR2,
    ShippingToCountryId IN NUMBER,
    CultureId IN NUMBER,
    CampaignId IN NUMBER,
    IsDefault IN CHAR,
    IsForComponents IN CHAR,
    IsForBuildings IN CHAR,
    CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2,
    OutputId OUT NUMBER
)
AS 
BEGIN
    INSERT INTO "TermsAndCondition" 
    (     
        "CompanyId",
        "Content",
        "IsForSignatureOrders",
        "Name",
        "ShippingToCountryId",
        "CultureId",
        "CampaignId",
        "IsDefault",
        "IsForComponents",
        "IsForBuildings",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
    ) 
    VALUES 
    (
        CompanyId,
        Content,
        IsForSignatureOrders,
        Name,
        ShippingToCountryId,
        CultureId,
        CampaignId,
        IsDefault,
        IsForComponents,
        IsForBuildings,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
    )
    RETURNING "TermsAndConditionsId" into OutputId;
    
END TermsAndConditions_Create;
/