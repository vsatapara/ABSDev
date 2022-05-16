CREATE OR REPLACE PROCEDURE abs_mdi."SHOPCOAT_EXIST" 
(
    BuildingInformationId IN NUMBER,
    OutputId OUT NUMBER
)
IS  
TotalCount number; 
BEGIN
    select count(*) into TotalCount from "Input_ShopCoat" WHERE "BuildingInformationId" = BuildingInformationId and "IsDelete" != 'Y';
    if TotalCount != 0 then
    begin
        SELECT 
            "ShopCoatId" into OutputId
        FROM "Input_ShopCoat"
        WHERE "BuildingInformationId" = BuildingInformationId and "IsDelete" != 'Y';
    end;
    ELSE
        begin
             OutputId := 0;
        end;     
    end if;
END ShopCoat_EXIST;
/