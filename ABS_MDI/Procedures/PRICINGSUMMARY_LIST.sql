CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSUMMARY_LIST" 
(
    CompanyId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN Output_Data FOR 
        SELECT 
            "PricingSummaryId",
            "Name",
            T."ItemText" as "Campaign",
            T1."ItemText" as "Culture",
            T2."ItemText" as "ShippingToCountry",
            "IsForSignatureOrders",
            "IsForComponents",
            "IsDefault"
        FROM "PricingSummaries" PS
        LEFT OUTER JOIN "TableOfTables" T ON PS."CampaignId" = T."Id"
        LEFT OUTER JOIN "TableOfTables" T1 ON PS."CultureId" = T1."Id"
        LEFT OUTER JOIN "TableOfTables" T2 ON PS."ShippingToCountryId" = T2."Id"
       where PS."CompanyId" = CompanyId and ("IsDelete" = 'N' or "IsDelete" is null);
END PRICINGSUMMARY_LIST;
/