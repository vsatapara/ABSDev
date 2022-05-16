CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSEGMENTVALUES_SELECT" 
(
	PricingSegmentValueId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
OPEN Output_Data FOR
    SELECT
		"PricingSegmentValueId",
		"PricingSegmentId",   
		"Description", 
		"SortOrder", 
		"IsActive", 
		"Multiplier", 
		"ConditionalMinimum",
		"ConditionalMaximum",
        "BasedOn"
	FROM "PricingSegmentValues"
	WHERE "PricingSegmentValueId" = PricingSegmentValueId;
END PRICINGSEGMENTVALUES_SELECT;
/