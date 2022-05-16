CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSEGMENTS_UPDATE" 
(
	PricingSegmentId IN NUMBER,
    CompanyId IN NUMBER,
    Description IN NVARCHAR2, 
	SortOrder  IN NUMBER, 
	IsActive  IN CHAR, 
	IsDefault  IN CHAR, 
	IsForComponents  IN CHAR, 
	ModifiedBy  IN NUMBER,
    IpAddress IN VARCHAR2
)
AS
BEGIN
     UPDATE "PricingSegments" SET
		"Description" = Description, 
		"SortOrder" = SortOrder, 
		"IsActive" = IsActive, 
		"IsDefault" = IsDefault, 
		"IsForComponents" = IsForComponents, 
		"ModifiedBy" = ModifiedBy, 
		"ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress,
        "CompanyId" = CompanyId
     WHERE "PricingSegmentId" = PricingSegmentId;
END PRICINGSEGMENTS_UPDATE;
/