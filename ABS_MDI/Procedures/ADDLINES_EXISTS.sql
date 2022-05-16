CREATE OR REPLACE PROCEDURE abs_mdi."ADDLINES_EXISTS" 
(
    AddLinesId IN Number,
    Guid IN RAW,
    OutputId OUT NUMBER
)
IS  
TotalCount number;  
BEGIN        
    select count(*) into TotalCount from "Input_AddLines" WHERE "AddLinesId" = AddLinesId;
    if TotalCount != 0 then
    begin
        SELECT 
            "AddLinesId" into OutputId
        FROM "Input_AddLines"
        WHERE "AddLinesId" = AddLinesId;
    end;
    ELSE
        begin
             OutputId := 0;
        end;     
    end if;
END ADDLINES_EXISTS;
/