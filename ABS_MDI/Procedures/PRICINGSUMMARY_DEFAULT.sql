CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSUMMARY_DEFAULT" 
(       
    PricingSummaryId IN NUMBER
)    
AS 
BEGIN
    UPDATE "PricingSummaries" SET
        "IsDefault"='N'
    WHERE "PricingSummaryId" != PricingSummaryId;
    UPDATE "PricingSummaries" SET
        "IsDefault"='Y'
    WHERE "PricingSummaryId"= PricingSummaryId;
    
END PRICINGSUMMARY_DEFAULT;
/