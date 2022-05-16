CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSBAYSPACING_PURLIN_EXIST" 
(
    GirtSpacingId IN NUMBER,
    OutputId OUT NUMBER
)
IS  
TotalCount number;  
BEGIN        
    select count(*) into TotalCount from "Input_GirtsBaySpacing_Purlin" WHERE "GirtSpacingId" = GirtSpacingId;
    if TotalCount != 0 then
    begin
        SELECT 
            "PurlinBaySpaceId" into OutputId
        FROM "Input_GirtsBaySpacing_Purlin"
        WHERE "GirtSpacingId" = GirtSpacingId;
    end;
    ELSE
        begin
             OutputId := 0;
        end;     
    end if;
END GirtsBaySpacing_Purlin_EXIST;
/