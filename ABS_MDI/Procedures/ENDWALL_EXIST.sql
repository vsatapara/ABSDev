CREATE OR REPLACE PROCEDURE abs_mdi."ENDWALL_EXIST" 
(
    BuildingNo IN NUMBER,
   OutputId OUT SYS_REFCURSOR
)
AS
BEGIN        
     OPEN OutputId FOR  select NVL(count("EndWallID"), 0) from "Input_Endwall" WHERE "BuildingNo" = BuildingNo AND NVL("IsDeleted", 'N') = 'N';
END ENDWALL_EXIST;
/