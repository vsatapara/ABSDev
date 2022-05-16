CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_WALLLTP_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
   SELECT
    "WallLTPId",
    "BuildingInformationId",
    "Quantity",
    "Elevation",
    "Type",
    "Size",
    "DistFromLeftCorner",
    "DistFromLeftCol",
    "PatternPerBay",
    "EaveCondition",
    "Continuous",
    "TopElevation",
    "LTPSize",
    "AccessoryConflictOverride",
    "InsulationTrim",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDelete",
    "Length",
    "PartitionNumber",
    "ProjectId",
    "Insulated",
    "TrimFlashing",
    "UL90",
    "IsPriced",
    "ErrorCode",
    "QuantityA",
    "QuantityB",
    "QuantityC",
    "QuantityD",
    "Location",
    "Weight",
    "Price"
FROM
    "Accesories_WallLTP" 
    --JOIN "Accesories_WallLTP_Size" ws ON aw."LTPSize" = ws."Value"
                          -- JOIN "Accesories_WallLTP_Common" wc ON ws."Id" = wc."SizeId"
                          -- JOIN "M_PanelType" MPanel ON wc."TypeId" = MPanel."Id"
                         WHERE --MPanel."Type"=aw."Type"AND 
                         "BuildingInformationId" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
             AND "IsDelete" != 'Y';           
END ACCESSORIES_WallLTP_GETBYBUILDINGID;
/