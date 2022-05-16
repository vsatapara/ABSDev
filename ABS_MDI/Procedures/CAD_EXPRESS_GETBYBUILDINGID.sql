CREATE OR REPLACE PROCEDURE abs_mdi."CAD_EXPRESS_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "Id",
    "BuildingNumber",
    "Drawing",
    "PaperSize",
    "Scale",
    "Manufacturer",
    "FramelineXSection",
    "DrawingName",
    "PF_Elevation",
    "PF_BayNumber",
    "OptionsCombineBldg"
FROM
    "CAD_Express"
WHERE
                "BuildingNumber" in( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                        )
             AND ("IsDelete" IS NULL OR "IsDelete" != 'Y');
END;
/