CREATE OR REPLACE PROCEDURE abs_mdi."INCLUSIONEXCLUSION_EXIST" 
(
    InclusionExclusionId IN NUMBER,
    Name IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
IF InclusionExclusionId = 0 then
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "ShippingZoneGroup" WHERE LOWER("Name") = LOWER(Name) and ("IsDelete"='N' or "IsDelete" is null);
      
ELSE
 OPEN Output_Data FOR 
      SELECT 
       count(*)
      FROM "ShippingZoneGroup" WHERE LOWER("Name") = LOWER(Name) and "InclusionExclusionId" != InclusionExclusionId and ("IsDelete"='N' or "IsDelete" is null);
END IF;
END INCLUSIONEXCLUSION_EXIST;
/