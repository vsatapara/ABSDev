CREATE OR REPLACE PROCEDURE abs_mdi."CHILDCOMPANY_LIST" 
( 
Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
      SELECT 
        C."CompanyId",
        C."CompanyName",
        C."IsActive",
        C."ShippingPlantGroupFromParentId" AS "BuildingShippingGroupId",
        SG."Name" AS "BuildingShippingGroupName",        
        C."ComponentsShippingGroupId",
        SGC."Name" AS "ComponentsShippingGroupName"  
      FROM "Company" C
      LEFT JOIN "ShippingGroup" SG ON C."ShippingPlantGroupFromParentId" = SG."ShippingGroupId"
      LEFT JOIN "ShippingGroup" SGC ON C."ComponentsShippingGroupId" = SGC."ShippingGroupId"      
      LEFT JOIN "PricingSegments" PS ON C."PricingSegmentFromParentId" = PS."PricingSegmentId"
      LEFT JOIN "PricingSegments" PSC ON C."ComponentsPricingSegmentId" = PSC."PricingSegmentId"      
      WHERE C."IsDelete" != 'Y';     
END ChildCompany_List;
/