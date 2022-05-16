CREATE OR REPLACE PROCEDURE abs_mdi."CHILDCOMPANY_COMMON_DRP" 
(
 Output_Data OUT SYS_REFCURSOR
) AS 
BEGIN
 OPEN Output_Data FOR 
    Select  "Name","ShippingGroupId" As "Id", 'ShippingGroupComponent' AS "Type"  FROM "ShippingGroup" WHERE "IsForComponents"='Y' AND "IsDelete"='N'
    UNION
    Select  "Name","ShippingGroupId"  As "Id",'ShippingGroupBuilding' AS "Type"    FROM "ShippingGroup" WHERE "IsForComponents"='N' AND "IsDelete"='N'
    UNION
    Select "Name", "InclusionExclusionId" As "Id", 'ShippingComponents' As "Type"      FROM "ShippingZoneGroup"  WHERE "IsForComponents"='Y' and "IsDelete"='N'
    UNION
    Select "Name", "InclusionExclusionId" As "Id", 'ShippingBuildings' As "Type"      FROM "ShippingZoneGroup"  WHERE "IsForBuildings"='Y' and "IsDelete"='N'
    UNION
    Select CAST("Description" AS varchar2(500)) As "Name", "PricingSegmentId" As "Id",'PricingComponents' As "Type" FROM "PricingSegments" where "IsForComponents"='Y' 
    Union
    Select CAST("Description" AS varchar2(500)) As "Name", "PricingSegmentId" As "Id",'PricingBuildings' As "Type" FROM "PricingSegments" where "IsForComponents"='N'; 
    
END CHILDCOMPANY_COMMON_DRP;
/