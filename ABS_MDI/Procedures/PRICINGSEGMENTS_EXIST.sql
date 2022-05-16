CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSEGMENTS_EXIST" (
    PricingSegmentId IN NUMBER,
    Description IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
IF PricingSegmentId = 0 then
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "PricingSegments" WHERE LOWER("Description") = LOWER(Description);
      
ELSE
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "PricingSegments" WHERE LOWER("Description") = LOWER(Description) and "PricingSegmentId" != PricingSegmentId;
END IF;
END PRICINGSEGMENTS_EXIST;
/