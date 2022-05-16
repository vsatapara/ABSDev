CREATE OR REPLACE PROCEDURE abs_mdi."INCLUSIONEXCLUSION_SELECT" 
(
    InclusionExclusionId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
 OPEN Output_Data FOR 
      SELECT 
        "InclusionExclusionId",
        "Name",
        "IsActive",
        "IsForBuildings",
        "IsForComponents"
      FROM "ShippingZoneGroup" 
       WHERE "InclusionExclusionId" = InclusionExclusionId;
END InclusionExclusion_Select;
/