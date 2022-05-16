CREATE OR REPLACE PROCEDURE abs_mdi."TERMSANDCONDITIONS_SELECT" 
(
    TermsAndConditionsId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
      SELECT 
        "TermsAndConditionsId",
        "CompanyId",
        "Content",
        "IsForSignatureOrders",
        "Name",
        "ShippingToCountryId",
        "CultureId",
        "CampaignId",
        "IsDefault",
        "IsForComponents",
        "IsForBuildings"
      FROM "TermsAndCondition"
       WHERE "TermsAndConditionsId" = TermsAndConditionsId;
END TermsAndConditions_Select;
/