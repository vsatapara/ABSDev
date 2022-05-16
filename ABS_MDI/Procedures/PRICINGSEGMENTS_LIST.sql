CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSEGMENTS_LIST" 
(
    CompanyId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
OPEN Output_Data FOR
    SELECT
		"PricingSegmentId",
        "Description", 
		"SortOrder", 
		"IsActive", 
		"IsDefault", 
		"IsForComponents", 
		"CreatedBy", 
		"CreatedDate",
		"ModifiedBy",
		"ModifiedDate"
	FROM "PricingSegments" where "CompanyId"=CompanyId;
END PRICINGSEGMENTS_LIST;
/