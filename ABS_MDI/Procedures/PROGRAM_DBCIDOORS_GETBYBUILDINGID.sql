CREATE OR REPLACE PROCEDURE abs_mdi."PROGRAM_DBCIDOORS_GETBYBUILDINGID" 
(
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "Series",
    "Size",
    "MaxWindBNormal",
    "MaxWindCNormal",
    "MaxWindBHigh",
    "MaxWindCHigh",
    "Weight",
    "Price"
FROM
    "M_EDSPrice_Program_DBCIDoors";
--WHERE "IsDeleted" != 'Y';
END;
/