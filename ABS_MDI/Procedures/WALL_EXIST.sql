CREATE OR REPLACE PROCEDURE abs_mdi."WALL_EXIST" 
(
    BuildingInformationId IN NUMBER,
    OutputId OUT NUMBER
)
IS  
TotalCount number; 
BEGIN
    select count(*) into TotalCount from "Input_Wall" WHERE "BuildingInformationId" = BuildingInformationId and "IsDelete" != 'Y';
    if TotalCount != 0 then
    begin
        SELECT 
            "WallId" into OutputId
        FROM "Input_Wall"
        WHERE "BuildingInformationId" = BuildingInformationId and "IsDelete" != 'Y';
    end;
    ELSE
        begin
             OutputId := 0;
        end;     
    end if;
END Wall_EXIST;
/