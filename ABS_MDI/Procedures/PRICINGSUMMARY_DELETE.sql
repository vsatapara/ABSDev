CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSUMMARY_DELETE" 
(
    PricingSummaryId IN NUMBER,
    UserId IN NUMBER
)
AS 
BEGIN
  UPDATE "PricingSummaries" SET
    "IsDelete"='Y', 
    "ModifiedBy"=UserId, 
    "ModifiedDate"=CURRENT_TIMESTAMP
  WHERE "PricingSummaryId"=PricingSummaryId;
END PRICINGSUMMARY_DELETE;
/