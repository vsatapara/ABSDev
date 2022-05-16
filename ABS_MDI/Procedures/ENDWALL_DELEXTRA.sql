CREATE OR REPLACE PROCEDURE abs_mdi."ENDWALL_DELEXTRA" 
(
    BuildingNo IN NUMBER,
    EndwallId IN NUMBER,
    EndwallNo IN NUMBER,
   OutputId OUT SYS_REFCURSOR
)
AS
BEGIN        
     OPEN OutputId FOR SELECT Count("BuildingNo") FROM "Input_Endwall" where "IsDeleted"='N' AND "BuildingNo" = BuildingNo
                AND "EndWallID" != EndwallId AND "EndWallNo" = EndwallNo group by "BuildingNo" having count("BuildingNo") > 2;
     
     UPDATE 
        (SELECT CS."IsDeleted" as OLD, 'Y' as NEW
        FROM "Input_Endwalls_ColumnSpacing" CS JOIN "Input_Endwall" EW ON CS."EndWallID" = EW."EndWallID"
        where EW."IsDeleted"='N' AND EW."BuildingNo" = BuildingNo AND EW."EndWallID" != EndwallId AND EW."EndWallNo" = EndwallNo
        ) t
        SET t.OLD = t.NEW;
        
      UPDATE 
        (SELECT CS."IsDeleted" as OLD, 'Y' as NEW
        FROM "Input_Endwalls_Recesses" CS JOIN "Input_Endwall" EW ON CS."EndWallID" = EW."EndWallID"
        where EW."IsDeleted"='N' AND EW."BuildingNo" = BuildingNo AND EW."EndWallID" != EndwallId AND EW."EndWallNo" = EndwallNo
        ) t
        SET t.OLD = t.NEW;
     UPDATE "Input_Endwall" SET 
     "IsDeleted" = 'Y'     
     WHERE "BuildingNo" = BuildingNo AND "EndWallID" != EndwallId AND "EndWallNo" = EndwallNo;
END ENDWALL_DELEXTRA;
/