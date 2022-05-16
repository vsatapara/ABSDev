CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSUMMARY_UPDATE" 
(
    PricingSummaryId IN NUMBER,
    Name IN VARCHAR2,
    CampaignId IN NUMBER,
    ShippingtocountryId IN NUMBER,
    CultureId IN NUMBER,
    IsForSignatureorders IN CHAR,
    IsForComponents IN CHAR,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    ModifiedBy IN NUMBER,
    CompanyId IN NUMBER,
    IsLoadFromComponent IN CHAR,
    LoadContent IN NCLOB
)
AS 
BEGIN
     UPDATE "PricingSummaries" SET
        "Name"=Name,
        "CampaignId" = CampaignId,
        "ShippingToCountryId" = ShippingtocountryId,
        "CultureId" = CultureId,
        "IsForSignatureOrders" = IsForSignatureorders,
        "IsForComponents" = IsForComponents,
        "IpAddress" = IpAddress,
        "ModifiedBy"= ModifiedBy,
        "ModifiedDate"= CURRENT_TIMESTAMP,
        "CompanyId" = CompanyId,
        "IsLoadFromComponent" = IsLoadFromComponent,
        "LoadContent" = LoadContent
    WHERE "PricingSummaryId"=PricingSummaryId;
END PRICINGSUMMARY_UPDATE;
/