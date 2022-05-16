CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSUMMARY_SELECT" 
(
    PricingSummaryId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN Output_Data FOR 
        SELECT 
            "PricingSummaryId",
            "Name",
            "CampaignId",
            "ShippingToCountryId",
            "CultureId",
            "IsForSignatureOrders",
            "IsForComponents",
            "IsLoadFromComponent",
            "LoadContent",
            "CreatedBy",
            "ModifiedBy"
        FROM "PricingSummaries"
        WHERE "PricingSummaryId" = PricingSummaryId;
END PRICINGSUMMARY_SELECT;
/