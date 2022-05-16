CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSUMMARY_CREATE" 
(
    Name IN VARCHAR2,
    CampaignId IN NUMBER,
    ShippingtocountryId IN NUMBER,
    CultureId IN NUMBER,
    IsForSignatureorders IN CHAR,
    IsForComponents IN CHAR,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    CreatedBy IN NUMBER,
    CompanyId IN NUMBER,
    IsLoadFromComponent IN CHAR,
    LoadContent IN NCLOB,
    OutputId OUT NUMBER
)
AS 
BEGIN
     INSERT INTO "PricingSummaries"
     (
        "Name",
        "CampaignId",
        "ShippingToCountryId",
        "CultureId",
        "IsForSignatureOrders",
        "IsForComponents",
        "IsLoadFromComponent",
        "LoadContent" ,
        "IpAddress",
        "CreatedBy",
        "CreatedDate",
        "CompanyId"
     )
     VALUES
     (
        Name,
        CampaignId,
        ShippingtocountryId,
        CultureId,
        IsForSignatureorders,
        IsForComponents,
        IsLoadFromComponent,
        LoadContent,
        IpAddress,
        CreatedBy,
        CURRENT_TIMESTAMP,
        CompanyId
     )
     RETURNING "PricingSummaryId" into OutputId;
END PRICINGSUMMARY_CREATE;
/