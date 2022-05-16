CREATE OR REPLACE PROCEDURE abs_mdi."ADDLINES_EXIST" 
(
    Guid IN RAW,
    OutputId OUT NUMBER
)
IS  
TotalCount number;  
BEGIN        
    select count(*) into TotalCount from "Input_AddLines" WHERE "Guid" = Guid;
    if TotalCount != 0 then
    begin
        SELECT 
            "AddLinesId" into OutputId
        FROM "Input_AddLines"
        WHERE "Guid" = Guid;
    end;
    ELSE
        begin
             OutputId := 0;
        end;     
    end if;
END AddLines_EXIST;
/