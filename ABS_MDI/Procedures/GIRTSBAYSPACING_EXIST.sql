CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSBAYSPACING_EXIST" 
(
    BuildingInformationId IN NUMBER,
    OutputId OUT NUMBER
)
IS  
TotalCount number; 
BEGIN
    select count(*) into TotalCount from "Input_GirtsBaySpacing" WHERE "BuildingInformationId" = BuildingInformationId and "IsDelete" != 'Y';
    if TotalCount != 0 then
    begin
        SELECT 
            "GirtSpacingId" into OutputId
        FROM "Input_GirtsBaySpacing"
        WHERE "BuildingInformationId" = BuildingInformationId and "IsDelete" != 'Y';
    end;
    ELSE
        begin
             OutputId := 0;
        end;     
    end if;
END GirtsBaySpacing_EXIST;
/