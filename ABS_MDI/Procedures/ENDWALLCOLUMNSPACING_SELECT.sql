CREATE OR REPLACE PROCEDURE abs_mdi."ENDWALLCOLUMNSPACING_SELECT" 
(
    ProjectId IN NUMBER,
    BuildingNo IN NUMBER,
    OutEndWall_Data OUT SYS_REFCURSOR,
    OutEndWall_ColumnSpacing_Data OUT SYS_REFCURSOR,
    OutEndWall_Recesses_Data OUT SYS_REFCURSOR,
    OutEndWall_ColumnSpacingOptions_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  IF BuildingNo > 0 THEN
    OPEN OutEndWall_Data FOR 
    SELECT 
         C1."ProjectId",C1."BuildingNo",C1."EndWallID",C1."FrameType",C1."ElevationType",C1."EndWallNo",C1."ColumnSpacingType",C1."InsulationTrim",C1."NonStandardSetback",C1."DesignedSetback",C1."SpecifiedSetback",C1."BayCount"
    FROM "Input_Endwall" C1
    WHERE C1."ProjectId"=ProjectId and C1."BuildingNo"=BuildingNo  Order by C1."EndWallNo"; 
  else
   OPEN OutEndWall_Data FOR 
    SELECT 
         C1."ProjectId",C1."BuildingNo",C1."EndWallID",C1."FrameType",C1."ElevationType",C1."EndWallNo",C1."ColumnSpacingType",C1."InsulationTrim",C1."NonStandardSetback",C1."DesignedSetback",C1."SpecifiedSetback",C1."BayCount"
    FROM "Input_Endwall" C1
    WHERE C1."ProjectId"=ProjectId  Order by C1."EndWallNo"; 
    END IF;
  IF BuildingNo > 0 THEN
    OPEN OutEndWall_ColumnSpacing_Data FOR 
    SELECT
        C1."ProjectId",C1."BuildingNo",C1."EndWallNo",C1."EndWallID",C2."CSType", C2."BayNo",C2."BaySpacing",C2."CSID"
        --(CASE WHEN C1."EndWallNo" = 1 THEN C2."CSType" END) as EW1CSType,(CASE WHEN C1."EndWallNo" = 1 THEN C2."BayNo" END) as EW1BayNo,(CASE WHEN C1."EndWallNo" = 1 THEN C2."BaySpacing" END) as EW1BaySpacing,
       -- (CASE WHEN C1."EndWallNo" = 2 THEN C2."CSType" END) as EW2CSType,(CASE WHEN C1."EndWallNo" = 2 THEN C2."BayNo" END) as EW2BayNo,(CASE WHEN C1."EndWallNo" = 2 THEN C2."BaySpacing" END) as EW2BaySpacing
    FROM  "Input_Endwalls_ColumnSpacing" C2
    Join "Input_Endwall" C1 on C1."EndWallID" = C2."EndWallID"
    WHERE C1."ProjectId"=ProjectId and C1."BuildingNo"=BuildingNo  Order by C1."EndWallNo";
    else
     OPEN OutEndWall_ColumnSpacing_Data FOR 
    SELECT
        C1."ProjectId",C1."BuildingNo",C1."EndWallNo",C1."EndWallID",C2."CSType", C2."BayNo",C2."BaySpacing",C2."CSID"
        --(CASE WHEN C1."EndWallNo" = 1 THEN C2."CSType" END) as EW1CSType,(CASE WHEN C1."EndWallNo" = 1 THEN C2."BayNo" END) as EW1BayNo,(CASE WHEN C1."EndWallNo" = 1 THEN C2."BaySpacing" END) as EW1BaySpacing,
       -- (CASE WHEN C1."EndWallNo" = 2 THEN C2."CSType" END) as EW2CSType,(CASE WHEN C1."EndWallNo" = 2 THEN C2."BayNo" END) as EW2BayNo,(CASE WHEN C1."EndWallNo" = 2 THEN C2."BaySpacing" END) as EW2BaySpacing
    FROM  "Input_Endwalls_ColumnSpacing" C2
    Join "Input_Endwall" C1 on C1."EndWallID" = C2."EndWallID"
    WHERE C1."ProjectId"=ProjectId Order by C1."EndWallNo";
    END IF;
  
  IF BuildingNo > 0 THEN
    OPEN OutEndWall_Recesses_Data FOR 
    SELECT C1."ProjectId",C1."BuildingNo",C1."EndWallNo",C1."EndWallID",C2."EWRType", C2."RecessNo",C2."Recesses",C2."EWRID"
        --(CASE WHEN C1."EndWallNo" = 1 THEN C2."EWRType" END) as EW1EWRType,(CASE WHEN C1."EndWallNo" = 1 THEN C2."RecessNo" END) as EW1RecessNo,(CASE WHEN C1."EndWallNo" = 1 THEN C2."Recesses" END) as EW1Recesses,
       -- (CASE WHEN C1."EndWallNo" = 2 THEN C2."EWRType" END) as EW2EWRType,(CASE WHEN C1."EndWallNo" = 2 THEN C2."RecessNo" END) as EW2RecessNo,(CASE WHEN C1."EndWallNo" = 2 THEN C2."Recesses" END) as EW2Recesses
    
     FROM "Input_Endwalls_Recesses" C2
    Join "Input_Endwall" C1 on C1."EndWallID" = C2."EndWallID"
    WHERE C1."ProjectId"=ProjectId and C1."BuildingNo"=BuildingNo  Order by C1."EndWallNo";
 else
    OPEN OutEndWall_Recesses_Data FOR 
    SELECT C1."ProjectId",C1."BuildingNo",C1."EndWallNo",C1."EndWallID",C2."EWRType", C2."RecessNo",C2."Recesses",C2."EWRID"
        --(CASE WHEN C1."EndWallNo" = 1 THEN C2."EWRType" END) as EW1EWRType,(CASE WHEN C1."EndWallNo" = 1 THEN C2."RecessNo" END) as EW1RecessNo,(CASE WHEN C1."EndWallNo" = 1 THEN C2."Recesses" END) as EW1Recesses,
       -- (CASE WHEN C1."EndWallNo" = 2 THEN C2."EWRType" END) as EW2EWRType,(CASE WHEN C1."EndWallNo" = 2 THEN C2."RecessNo" END) as EW2RecessNo,(CASE WHEN C1."EndWallNo" = 2 THEN C2."Recesses" END) as EW2Recesses
    
     FROM "Input_Endwalls_Recesses" C2
    Join "Input_Endwall" C1 on C1."EndWallID" = C2."EndWallID"
    WHERE C1."ProjectId"=ProjectId  Order by C1."EndWallNo";
    END IF;
    OPEN OutEndWall_ColumnSpacingOptions_Data FOR
    SELECT * From "OpenAreas";
END ENDWALLCOLUMNSPACING_SELECT;
/