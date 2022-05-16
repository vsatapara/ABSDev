CREATE OR REPLACE PROCEDURE abs_mdi."BFM_FRAMELINES_LIST" 
(
Output_Data OUT SYS_REFCURSOR
) 
AS 
BEGIN
OPEN Output_Data FOR
    SELECT
        "FrameLineNumber",
        "BuildingNumber",
        "GroupNumber"
	FROM "BFM_FrameLines"; 
END BFM_FRAMELINES_LIST;
/