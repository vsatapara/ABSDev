CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_VENTS_SELECT" 
(
VentsId IN Number,
Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
OPEN Output_Data FOR 
SELECT
    "VentsId",
    "BuildingId",
    "ProjectId",
    "Quantity",
    "RoofVent",
    "Elevation",
    "BayNumber",
    "Color",
    "Size",
    "Operator",
    "OperatorWithCable",
    "Surface",
    "ExtensionPackage",
    "TrimCollar",
    "DistFromLeftCorner",
    "DistFromLeftCol",
    "Damper",
    "CreatedBy",
    "CreatedDate",
    "ModifiedBy",
    "ModifiedDate",
    "IpAddress",
    "IsDelete",
    "DistFromLeftWall"
FROM
    "Accessories_Vents"
WHERE 
    "VentsId"=VentsId;
    END ACCESSORIES_VENTS_SELECT;
/