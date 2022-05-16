CREATE OR REPLACE PROCEDURE abs_mdi."INSULATION_ACCESSORIES_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "InsulationAccessoriesId",
    "BuildingNumber",
    "ItemNumber",
    "Quantity",
    "Description",
    "Facing",
    "Width",
    "Weight",
    "Price",
    "IsPriced",
    "ErrorCode",
    "InsulationType"
FROM
    "InsulationAccessories"
     WHERE
                "BuildingNumber" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                )
                AND ("IsDelete" IS NULL  OR "IsDelete" != 'Y');
END;
/