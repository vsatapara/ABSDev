CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSEGMENTS_SELECT" 
(
    PricingSegmentId IN NUMBER,
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
		"IsForComponents"
	FROM "PricingSegments"
    WHERE "PricingSegmentId" = PricingSegmentId;
    
END PRICINGSEGMENTS_SELECT;
/