CREATE OR REPLACE PROCEDURE abs_mdi."MULTI_DROPDOWN_LIST" 
(
 PageName IN VARCHAR2,
 Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
  IF PageName = 'Company' THEN
    OPEN Output_Data FOR
  Select  "Name","ShippingGroupId" As "Id", 'ShippingGroupComponent' AS "Type" FROM "ShippingGroup" WHERE "IsForComponents"='N' AND "IsDelete"='N' AND "IsActive" = 'Y'
    UNION
    Select  "Name","ShippingGroupId"  As "Id",'ShippingGroupBuilding' AS "Type" FROM "ShippingGroup" WHERE "IsForComponents"='Y' AND "IsDelete"='N' AND "IsActive" = 'Y'
    UNION
    Select CAST("Description" AS varchar2(500)) As "Name", "PricingSegmentId" As "Id",'PricingComponents' As "Type" FROM "PricingSegments" where "IsForComponents"='Y'  AND "IsActive" = 'Y'
    Union
    Select CAST("Description" AS varchar2(500)) As "Name", "PricingSegmentId" As "Id",'PricingBuildings' As "Type" FROM "PricingSegments" where "IsForComponents"='N' AND "IsActive" = 'Y';
  END IF;
  IF PageName = 'CustomerAdmin' THEN
   OPEN Output_Data FOR
    Select CAST("Description" AS varchar2(500)) As "Name", "PricingSegmentId" As "Id",'PricingComponents' As "Type" FROM "PricingSegments" where "IsForComponents"='Y' AND "IsActive" = 'Y'
    Union
    Select CAST("Description" AS varchar2(500)) As "Name", "PricingSegmentId" As "Id",'PricingBuildings' As "Type" FROM "PricingSegments" where "IsForComponents"='N' AND "IsActive" = 'Y';
    END IF;
END MULTI_DROPDOWN_LIST;
/