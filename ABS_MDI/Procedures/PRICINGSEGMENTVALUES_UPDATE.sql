CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSEGMENTVALUES_UPDATE" 
(
	PricingSegmentValueId IN NUMBER,
    PricingSegmentId  IN NUMBER,   
	Description  IN NVARCHAR2, 
	SortOrder  IN NUMBER, 
	IsActive  IN CHAR, 
	Multiplier  IN FLOAT, 
	ConditionalMinimum  IN FLOAT,
	ConditionalMaximum  IN FLOAT,
	BasedOn  IN NUMBER,
	ModifiedBy  IN NUMBER,
    IpAddress IN VARCHAR2
)
AS
BEGIN
     UPDATE "PricingSegmentValues" SET
	    "PricingSegmentValueId" = PricingSegmentValueId,
		"PricingSegmentId" = PricingSegmentId,   
		"Description" = Description, 
		"SortOrder" = SortOrder, 
		"IsActive" = IsActive, 
		"Multiplier" = Multiplier, 
		"ConditionalMinimum" = ConditionalMinimum,
		"ConditionalMaximum" = ConditionalMaximum,
		"BasedOn" = BasedOn,
		"ModifiedBy" = ModifiedBy,
		"ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
     WHERE "PricingSegmentValueId" = PricingSegmentValueId;
END PRICINGSEGMENTVALUES_UPDATE;
/