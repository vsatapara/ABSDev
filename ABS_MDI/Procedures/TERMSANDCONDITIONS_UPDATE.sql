CREATE OR REPLACE PROCEDURE abs_mdi."TERMSANDCONDITIONS_UPDATE" 
(
    TermsAndConditionsId IN NUMBER,
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
    ModifiedBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS 
BEGIN
  UPDATE "TermsAndCondition" SET      
        "CompanyId" = CompanyId,
        "Content" = Content,
        "IsForSignatureOrders" = IsForSignatureOrders,
        "Name" = Name,
        "ShippingToCountryId" = ShippingToCountryId,
        "CultureId" = CultureId,
        "CampaignId" = CampaignId,
        "IsDefault" = IsDefault,
        "IsForComponents" = IsForComponents,
        "IsForBuildings" = IsForBuildings,
        "ModifiedBy" = ModifiedBy, 
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
  WHERE "TermsAndConditionsId"=TermsAndConditionsId;
END TermsAndConditions_Update;
/