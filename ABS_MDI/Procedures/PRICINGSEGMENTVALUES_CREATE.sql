CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSEGMENTVALUES_CREATE" 
(
    PricingSegmentId  IN NUMBER,   
	Description  IN NVARCHAR2, 
	SortOrder  IN NUMBER, 
	IsActive  IN CHAR, 
	Multiplier  IN FLOAT, 
	ConditionalMinimum  IN FLOAT,
	ConditionalMaximum  IN FLOAT,
	BasedOn  IN NUMBER,
	CreatedBy  IN NUMBER,
    IpAddress IN VARCHAR2
)
AS
BEGIN
     INSERT INTO "PricingSegmentValues"
     (
		"PricingSegmentId",   
		"Description", 
		"SortOrder", 
		"IsActive", 
		"Multiplier", 
		"ConditionalMinimum",
		"ConditionalMaximum",
		"BasedOn",
		"CreatedBy",
		"CreatedDate",
        "IpAddress"
     )
     VALUES
     (
		PricingSegmentId,   
		Description, 
		SortOrder, 
		IsActive, 
		Multiplier, 
		ConditionalMinimum,
		ConditionalMaximum,
		BasedOn,
		CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     );
END PRICINGSEGMENTVALUES_CREATE;
/