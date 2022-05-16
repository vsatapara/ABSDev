CREATE OR REPLACE PROCEDURE abs_mdi."PRICINGSEGMENTVALUES_EXIST" 
(
    PricingSegmentId IN NUMBER,
    PricingSegmentValueId IN NUMBER,
    Description IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
IF PricingSegmentValueId = 0 then
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "PricingSegmentValues" WHERE LOWER("Description") = LOWER(Description) and "PricingSegmentId"=PricingSegmentId;
      
ELSE
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "PricingSegmentValues" WHERE LOWER("Description") = LOWER(Description) and "PricingSegmentId"=PricingSegmentId and "PricingSegmentValueId" != PricingSegmentValueId;
END IF;
END PRICINGSEGMENTVALUES_EXIST;
/