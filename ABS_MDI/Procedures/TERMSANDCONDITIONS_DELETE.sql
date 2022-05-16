CREATE OR REPLACE PROCEDURE abs_mdi."TERMSANDCONDITIONS_DELETE" 
(
    TermsAndConditionsId IN NUMBER,
    ModifiedBy IN NUMBER
)
AS 
BEGIN
  UPDATE "TermsAndCondition" SET
    "IsDelete"='Y', 
    "ModifiedBy"=ModifiedBy, 
    "ModifiedDate"=CURRENT_TIMESTAMP
  WHERE "TermsAndConditionsId"= TermsAndConditionsId;
END TermsAndConditions_Delete;
/