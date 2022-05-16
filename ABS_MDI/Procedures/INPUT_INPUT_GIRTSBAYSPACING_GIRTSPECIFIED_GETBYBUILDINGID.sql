CREATE OR REPLACE PROCEDURE abs_mdi."INPUT_INPUT_GIRTSBAYSPACING_GIRTSPECIFIED_GETBYBUILDINGID" 
(
 BuildingId IN VARCHAR2,
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)AS 
BEGIN
OPEN OUTPUT_TABLE FOR SELECT
   "GirtSpecifiedId",
    "GirtBaySpaceId",
    "Elevation",
    "SpacingNumber",
    "Spacing",
    "Type"
FROM
    "Input_GirtsBaySpacing_GirtSpecified"
     WHERE
                "GirtBaySpaceId" in
                ( 
                        SELECT regexp_substr(BuildingId,'[^,]+', 1, level) from dual
                        connect by regexp_substr(BuildingId, '[^,]+', 1, level) is not null
                );

END INPUT_Input_GirtsBaySpacing_GirtSpecified_GETBYBUILDINGID;
/