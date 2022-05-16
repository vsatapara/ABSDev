CREATE OR REPLACE PROCEDURE abs_mdi."BRACING_BAYS_HISTORICAL_UPDATE" 
(
 BuildingId IN string
)
AS 
 ParentBuildingId number(5);
 BuildingType varchar2(2);
 FrameType varchar2(15);
 Elevation varchar2(2);
 AttachmentElevation varchar2(2);
 elevation_A varchar2(2);
 EndWallID1 number(10);
 EndWallID2 number(10);
 
 b_bays varchar2(150);
 c_bays varchar2(150);
 
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
        "Elevation","ParentBuildingId",NVL(SUBSTR("AttachmentElevation", -1),''), "FrameType" 
        into Elevation,ParentBuildingId,AttachmentElevation, FrameType
            from "BuildingInformation" 
                where "BuildingInformationId" = rec.pid;
                
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
        
        if elevation_A = 'S' then
            select "EW3BracingLocations" into b_bays from "Bracing" WHERE "BuildingNumber" = rec.pid;
            select "SW2BracingLocations" into c_bays from "Bracing" WHERE "BuildingNumber" = rec.pid;
        else
            if FrameType = 'Lean-to' then
                select "SW2BracingLocations" into b_bays from "Bracing" WHERE "BuildingNumber" = rec.pid;
             else
                select "SW1BracingLocations" into b_bays from "Bracing" WHERE "BuildingNumber" = rec.pid;
                select "EW4BracingLocations" into c_bays from "Bracing" WHERE "BuildingNumber" = rec.pid;
            end If;
        end if;
        BEGIN
        
            if elevation_A = 'S' then
                
                if b_bays <> 'No Bays' AND b_bays IS NOT NUll THEN
                    update "Bracing"
                    set "EW3BracingLocations" = (select listagg(TOKEN, ',') WITHIN GROUP (ORDER BY TOKEN desc) from
                    (SELECT  REGEXP_SUBSTR( b_bays,'[^,]+', 1, LEVEL )  AS TOKEN, LEVEL TOKEN_LEVEL
                    FROM dual CONNECT BY REGEXP_SUBSTR( b_bays, '[^,]+', 1, LEVEL ) IS NOT NULL)) WHERE "BuildingNumber" = rec.pid;
                    
                END IF;
                 
                 if c_bays <> 'No Bays' AND c_bays IS NOT NUll THEN
                    update "Bracing"
                    set "SW2BracingLocations" = (select listagg(TOKEN, ',') WITHIN GROUP (ORDER BY TOKEN desc) from
                    (SELECT  REGEXP_SUBSTR( c_bays,'[^,]+', 1, LEVEL )  AS TOKEN, LEVEL TOKEN_LEVEL
                    FROM dual CONNECT BY REGEXP_SUBSTR( c_bays, '[^,]+', 1, LEVEL ) IS NOT NULL)) WHERE "BuildingNumber" = rec.pid;
                    
                END IF;
            else
                if FrameType = 'Lean-to' then
                    if b_bays <> 'No Bays' AND b_bays IS NOT NUll THEN
                        update "Bracing"
                        set "SW2BracingLocations" = (select listagg(TOKEN, ',') WITHIN GROUP (ORDER BY TOKEN desc) from
                        (SELECT  REGEXP_SUBSTR( b_bays,'[^,]+', 1, LEVEL )  AS TOKEN, LEVEL TOKEN_LEVEL
                        FROM dual CONNECT BY REGEXP_SUBSTR( b_bays, '[^,]+', 1, LEVEL ) IS NOT NULL)) WHERE "BuildingNumber" = rec.pid;
                        
                    END IF;
                    
               else
                    if b_bays <> 'No Bays' AND b_bays IS NOT NUll THEN
                        update "Bracing"
                        set "SW1BracingLocations" = (select listagg(TOKEN, ',') WITHIN GROUP (ORDER BY TOKEN desc) from 
                        (SELECT  REGEXP_SUBSTR( b_bays,'[^,]+', 1, LEVEL )  AS TOKEN, LEVEL TOKEN_LEVEL
                        FROM dual CONNECT BY REGEXP_SUBSTR( b_bays, '[^,]+', 1, LEVEL ) IS NOT NULL)) WHERE "BuildingNumber" = rec.pid;
                        
                    END IF;
                    
                    if c_bays <> 'No Bays' AND c_bays IS NOT NUll THEN
                        update "Bracing"
                        set "EW4BracingLocations" = (select listagg(TOKEN, ',') WITHIN GROUP (ORDER BY TOKEN desc) from
                        (SELECT  REGEXP_SUBSTR( c_bays,'[^,]+', 1, LEVEL )  AS TOKEN, LEVEL TOKEN_LEVEL
                        FROM dual CONNECT BY REGEXP_SUBSTR( c_bays, '[^,]+', 1, LEVEL ) IS NOT NULL)) WHERE "BuildingNumber" = rec.pid;
                        
                    END IF;
                end If;
            end if;
        END;
    END LOOP;
END BRACING_BAYS_HISTORICAL_UPDATE;
/