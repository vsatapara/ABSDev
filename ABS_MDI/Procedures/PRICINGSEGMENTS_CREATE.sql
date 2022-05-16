CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSEGMENTS_CREATE" 
(
    CompanyId IN NUMBER,
    Description IN NVARCHAR2, 
	SortOrder  IN NUMBER, 
	IsActive  IN CHAR, 
	IsDefault  IN CHAR, 
	IsForComponents  IN CHAR, 
	CreatedBy  IN NUMBER,
	OutputId OUT NUMBER,
    IpAddress IN VARCHAR2
)
AS
BEGIN
     INSERT INTO "PricingSegments"
     (
        "CompanyId",
		"Description", 
		"SortOrder", 
		"IsActive", 
		"IsDefault", 
		"IsForComponents", 
		"CreatedBy", 
		"CreatedDate",
        "IpAddress"
     )
     VALUES
     (
        CompanyId,
		Description,
        SortOrder,
        IsActive,
        IsDefault, 
		IsForComponents,
		CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     )RETURNING "PricingSegmentId" into OutputId;
END PRICINGSEGMENTS_CREATE;
/