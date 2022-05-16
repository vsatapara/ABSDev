CREATE OR REPLACE PROCEDURE abs_mdi."TERMSANDCONDITIONS_DEFAULT" 
(
    TermsAndConditionsId IN NUMBER
)
AS 
BEGIN
    UPDATE "TermsAndCondition" SET
        "IsDefault"='N'
    WHERE "TermsAndConditionsId" != TermsAndConditionsId;
    UPDATE "TermsAndCondition" SET
        "IsDefault"='Y'
    WHERE "TermsAndConditionsId"= TermsAndConditionsId;
END TERMSANDCONDITIONS_DEFAULT;
/