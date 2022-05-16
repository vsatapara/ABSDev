CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_PURLIN_COMMOM" 
(
  BuildingId IN NUMBER,
  Output_EndWallData OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_EndWallData FOR
        SELECT
            "FrameType", 
            "EndWallNo",
            "BayCount"  
        FROM
        "Input_Endwall" 
        WHERE "BuildingNo"=BuildingId and NVL("IsDeleted", 'N') = 'N';
        
END ACCESSORIES_PURLIN_COMMOM;
/