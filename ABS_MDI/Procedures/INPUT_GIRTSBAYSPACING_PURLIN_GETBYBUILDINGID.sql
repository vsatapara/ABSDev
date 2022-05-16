CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_GIRTSBAYSPACING_PURLIN_GETBYBUILDINGID" 
(
 BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)AS 
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
    "PurlinBaySpaceId",
    "GirtSpacingId",
    "NominalSpacing",
    "OnSlope"
FROM
    "Input_GirtsBaySpacing_Purlin"
     WHERE
                "GirtSpacingId" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                 );

END Input_GirtsBaySpacing_Purlin_GETBYBUILDINGID;
/