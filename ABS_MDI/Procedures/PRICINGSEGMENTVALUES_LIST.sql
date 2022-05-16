CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSEGMENTVALUES_LIST" 
(
	PricingSegmentId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
OPEN Output_Data FOR
       SELECT
		PSV."PricingSegmentValueId",
		PSV."PricingSegmentId",   
		PSV."Description", 
		PSV."SortOrder", 
		PSV."IsActive", 
		PSV."Multiplier", 
		PSV."ConditionalMinimum",
		PSV."ConditionalMaximum",
        PSV."BasedOn",
        TOT."ItemText" as "BasedOnText"
	FROM "PricingSegmentValues" PSV
    LEFT OUTER JOIN "TableOfTables" TOT
        ON PSV."BasedOn" = TOT."Id"
	WHERE "PricingSegmentId" = PricingSegmentId;
END PRICINGSEGMENTVALUES_LIST;
/