CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSBAYSPACING_GIRT_EXIST" 
(
    GirtSpacingId IN NUMBER,
    OutputId OUT NUMBER
)
IS  
TotalCount number; 
BEGIN
    select count(*) into TotalCount from "Input_GirtsBaySpacing_Girt" where "GirtSpacingId" = GirtSpacingId;
    if TotalCount != 0 then
    begin
        SELECT 
            "GirtBaySpaceId" into OutputId
        FROM "Input_GirtsBaySpacing_Girt"
        WHERE "GirtSpacingId" = GirtSpacingId;
    end;
    ELSE
        begin
             OutputId := 0;
        end;     
    end if;
END GirtsBaySpacing_Girt_EXIST;
/