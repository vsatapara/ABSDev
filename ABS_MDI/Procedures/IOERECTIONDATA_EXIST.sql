CREATE OR REPLACE PROCEDURE abs_mdi."IOERECTIONDATA_EXIST" 
(
    ProjectId IN NUMBER,
    OutputId OUT NUMBER
)
IS  
TotalCount number;  
BEGIN        
    select count(*) into TotalCount from "EDSPrice_IO_ErectionData" 
    WHERE "ProjectId" = ProjectId;
    if TotalCount != 0 then
    begin
        SELECT 
            "ErectionDataId" into OutputId
        FROM "EDSPrice_IO_ErectionData"
        WHERE "ProjectId" = ProjectId;
    end;
    ELSE
        begin
             OutputId := 0;
        end;     
    end if;
END IOErectionData_Exist;
/