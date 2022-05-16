CREATE OR REPLACE PROCEDURE abs_mdi."GET_COLORPANEL" 
(
    OUTPUT_TABLE OUT  SYS_REFCURSOR
)
AS
BEGIN
    OPEN OUTPUT_TABLE FOR 
     SELECT
            "ColorPanelId",
            "Type",
            "Gauge",
            "GroupingID",
            "SortOrder",
            "ExteriorKSI",
            "InteriorKSI",
            "CategotyId",
            "IsRoof",
            "IsWall"
    FROM
        "ColorPanel";
        
END GET_COLORPANEL;
/