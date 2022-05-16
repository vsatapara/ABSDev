CREATE OR REPLACE PROCEDURE abs_mdi."MEZZANINEOPENING_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "MezzaninesId",
    "MezzanineOpeningId" "Id",
    "BuildingNumber",
    "MezzanineNumber",
    "OpeningNumber",
    "OpenDistFromSw",
    "OpenDistFromFrameline",
    "OpenWidthAlongEw",
    "OpenLengthAlongSw",
    "ProjectId"
FROM
    "EDSPrice_IO_MezzanineOpening"
    Where  "BuildingNumber" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        ) AND ("IsDelete" IS NULL OR "IsDelete" != 'Y');
END;
/