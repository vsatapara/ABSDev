CREATE OR REPLACE PROCEDURE abs_mdi."XBRACEANCHOR_GETBYBUILDINGID" 
(
    BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "XBraceAnchorId" as "Id",
    "BuildingInformationId" as "BuildingNumber",
    "Elevation",
    "BayNumber",
    "DistFromLeftCornerLeft",
    "DistFromLeftColumnLeft" as "DistFromLeftColLeft",
    "DistFromLeftCornerRight",
    "DistFromLeftColumnRight" as "DistFromLeftColRight",
    "LeftSteelLine"
    
FROM
    "Bracing_XBraceAnchor"
     WHERE
                "BuildingInformationId" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                ); --AND "IsDelete" != 'Y';
END;
/