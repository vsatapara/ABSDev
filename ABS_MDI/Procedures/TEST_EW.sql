CREATE OR REPLACE PROCEDURE abs_mdi."TEST_EW" 
(
 BuildingId IN varchar
)
as 
 ParentBuildingId number(5);
 BuildingType varchar2(2);
 Elevation varchar2(2);
 AttachmentElevation varchar2(2);
 elevation_A varchar2(2);
 EndWallID1 number(10);
 EndWallID2 number(10);
 
  cursor c_update
    IS
     SELECT
        regexp_substr(BuildingId, '[^,]+', 1, level) pid
    FROM
        dual
    CONNECT BY
        regexp_substr(BuildingId, '[^,]+', 1, level) IS NOT NULL;
    
BEGIN
    FOR rec IN c_update 
    
        LOOP
        dbms_output.put_line(rec.pid);
        select 
        "Elevation","ParentBuildingId",NVL(SUBSTR("AttachmentElevation", -1),'') 
        into Elevation,ParentBuildingId,AttachmentElevation
            from "BuildingInformation" 
                where "BuildingInformationId" = rec.pid and "IsDelete" = 'N';
                
        if Elevation = 'S' then 
            elevation_A := 'S'; 
        else 
            elevation_A := 'E'; 
        end if;
            
        IF ParentBuildingId !=0 then
            IF elevation_A = 'S' then
                if AttachmentElevation = 'A' or AttachmentElevation = 'C' then 
                    elevation_A := 'S';
                ELSIF  AttachmentElevation = 'B' or AttachmentElevation = 'D' then
                        elevation_A := 'E';
                END IF;
            ELSIF elevation_A = 'E' then
                if AttachmentElevation = 'A' or AttachmentElevation = 'C' then 
                    elevation_A := 'E';
                ELSIF  AttachmentElevation = 'B' or AttachmentElevation = 'D' then
                        elevation_A := 'S';
                END IF;
            END IF;
        END IF;
        BEGIN
        select * into EndWallID1 from (
            select distinct "EndWallID" from "Input_Endwalls_ColumnSpacing" 
                where "BuildingNo" = rec.pid and "IsDeleted" = 'N' and "EndWallID" != 0 order by "EndWallID" ) where rownum =1;
    
        select * into EndWallID2 from (
            select distinct "EndWallID" from "Input_Endwalls_ColumnSpacing" 
                where "BuildingNo" = rec.pid and "IsDeleted" = 'N' and "EndWallID" != 0 order by "EndWallID" desc) where rownum =1;
        
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                 EndWallID1 := 0;
                 EndWallID2 := 0;
                 dbms_output.put_line('Record not found in Input_Endwalls_ColumnSpacing for Building No:' || rec.pid);
        END;
        
        if EndWallID1 !=0 and EndWallID2 !=0 then 
        update "Input_Endwalls_ColumnSpacing" 
            set "Elevation" = case when elevation_A = 'S' then 'B' else 'A' end
                where "BuildingNo" = rec.pid and "IsDeleted" = 'N' and "EndWallID" = EndWallID1;
                COMMIT;
        
        update "Input_Endwalls_ColumnSpacing" 
            set "Elevation" = case when elevation_A = 'S' then 'D' else 'C' end
                where "BuildingNo" = rec.pid and "IsDeleted" = 'N' and "EndWallID" = EndWallID2;
                COMMIT;
        end if;
    END LOOP;
END TEST_EW;
/