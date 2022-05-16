CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_VENTS_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "VentsId",
    "BuildingId",
    "ProjectId",
    "Quantity",
    "RoofVent",
    "Elevation",
    "BayNumber",
    ColorDropdown."DropDownValue" "Color",
    SizeDropdown."DropDownValue" "Size",
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
    "DistFromLeftWall",
    "RunOfVents",
    SizeDropdown."DropDownValue" "Type",
    case when OperatorDropdown."DropDownValue"='Multiple Vent' then 1 else 0 end as "MultipleOperatorKit",
    case when OperatorDropdown."DropDownValue"='Single Vent' then 1 else 0 end as "SingleOperatorKit",
    case when SurfaceDropdown."DropDownValue"='On Peak' then 1 else 0 end as "OnPeak",
    "Weight",
    "Price",
    "IsPriced",
    "ErrorCode"
FROM
    "Accessories_Vents" Vents
    LEFT JOIN "Accessories_Vents_DropdownValue" ColorDropdown ON Vents."Color" = ColorDropdown."Id"
    LEFT JOIN "Accessories_Vents_DropdownValue" SizeDropdown ON Vents."Size" = SizeDropdown."Id"
    LEFT JOIN "Accessories_Vents_DropdownValue" OperatorDropdown ON Vents."Operator" = OperatorDropdown."Id"
    LEFT JOIN "Accessories_Vents_DropdownValue" SurfaceDropdown ON Vents."Surface" = SurfaceDropdown."Id"
WHERE
                "BuildingId" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
             AND ("IsDelete" IS NULL OR "IsDelete" != 'Y');
END;
/