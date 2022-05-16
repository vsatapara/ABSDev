CREATE OR REPLACE PROCEDURE abs_mdi."SHIPBYCOMPONENT_LIST" 
(
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
      SELECT 
        "ShipById",
        "Name",
        "IsActive",
        "Default",
        "DisplayOrder",
        "MetaName"
      FROM "ShipByComponents" ;
END ShipByComponent_List;
/