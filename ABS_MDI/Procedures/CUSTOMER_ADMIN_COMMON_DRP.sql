CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMER_ADMIN_COMMON_DRP" 
(
 Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
    Select "Name", "InclusionExclusionId" As "Id", 'ShippingComponents' As "Type"      FROM "ShippingZoneGroup"  WHERE "IsForComponents"='Y' and "IsDelete"='N'
    UNION
    Select "Name", "InclusionExclusionId" As "Id", 'ShippingBuildings' As "Type"      FROM "ShippingZoneGroup"  WHERE "IsForBuildings"='Y' and "IsDelete"='N'
    UNION
    Select CAST("Description" AS varchar2(500)) As "Name", "PricingSegmentId" As "Id",'PricingComponents' As "Type" FROM "PricingSegments" where "IsForComponents"='Y' 
    Union
    Select CAST("Description" AS varchar2(500)) As "Name", "PricingSegmentId" As "Id",'PricingBuildings' As "Type" FROM "PricingSegments" where "IsForComponents"='N'; 
END CUSTOMER_ADMIN_COMMON_DRP;
/