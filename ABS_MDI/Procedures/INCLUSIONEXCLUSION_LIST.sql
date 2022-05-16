CREATE OR REPLACE PROCEDURE abs_mdi."INCLUSIONEXCLUSION_LIST" 
(
    CompanyId IN Number,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
      SELECT 
        "InclusionExclusionId",
        "IsActive",
        "IsForComponents",
        "IsForBuildings",
        "Name"
      FROM "ShippingZoneGroup" where "CompanyId" = CompanyId and ( "IsDelete"='N' or "IsDelete" is null);
END InclusionExclusion_List;
/