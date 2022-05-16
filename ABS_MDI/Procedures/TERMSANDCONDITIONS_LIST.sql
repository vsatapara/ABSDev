CREATE OR REPLACE PROCEDURE abs_mdi."TERMSANDCONDITIONS_LIST" 
(
    CompanyId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
    OPEN Output_Data FOR 
      SELECT                 
        "TermsAndConditionsId",
        "IsForSignatureOrders",
        "Name",
        C1."ItemText" as "CountryName",
        C2."ItemText" as "CultureName",
        C3."ItemText" as "CampaignName",
        "IsDefault",
        "IsForComponents",
        "IsForBuildings"
      FROM "TermsAndCondition" T
      LEFT OUTER JOIN "TableOfTables" C1 ON T."ShippingToCountryId"=C1."Id" and C1."Category"='Country'
      LEFT OUTER JOIN "TableOfTables" C2 ON T."CultureId"=C2."Id" and C2."Category"='Culture'
      LEFT OUTER JOIN "TableOfTables" C3 ON T."CampaignId"=C3."Id" and C3."Category"='Campaign'
      WHERE T."CompanyId" = CompanyId and T."IsDelete" = 'N';
END TermsAndConditions_List;
/