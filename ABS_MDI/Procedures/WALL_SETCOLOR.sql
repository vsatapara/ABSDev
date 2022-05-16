CREATE OR REPLACE PROCEDURE abs_mdi."WALL_SETCOLOR" 
(
    BuildingInformationId IN NUMBER,
    WallPanel IN VARCHAR2,
    WallPanelValsparCode IN VARCHAR2,
    WallPanelSpecialName IN VARCHAR2,
    WallPanelText IN VARCHAR2,
    WallPanelHashCode IN VARCHAR2,
    
    WallInteriorSkin IN VARCHAR2,
    WallInteriorSkinValsparCode IN VARCHAR2,
    WallInteriorSkinSpecialName IN VARCHAR2,
    WallInteriorText IN VARCHAR2,
    WallInteriorHashCode IN VARCHAR2,
    UserId IN NUMBER,
    IpAddress IN VARCHAR2 DEFAULT NULL
)
IS  
TotalCount number; 
BEGIN
    select count(*) into TotalCount from "Input_TrimColorSelections" WHERE "BuildingNumber" = BuildingInformationId;-- and "IsDelete" != 'Y';
    if TotalCount != 0 then
        begin
            UPDATE "Input_TrimColorSelections" SET        
                    "WallPanel" = WallPanel,
                    "WallPanelValsparCode" = WallPanelValsparCode,
                    "WallPanelSpecialName"=WallPanelSpecialName,
                    "WallPanelText"=WallPanelText,
                    "WallPanelHashCode"=WallPanelHashCode,
                    
                    "WallInteriorSkin" = WallInteriorSkin,
                    "WallInteriorSkinValsparCode" = WallInteriorSkinValsparCode,
                    "WallInteriorSkinSpecialName"=WallInteriorSkinSpecialName,
                    "WallInteriorText"=WallInteriorText,
                    "WallInteriorHashCode"=WallInteriorHashCode,
                    
                    "ModifiedBy"=UserId,
                    "ModifiedDate"=CURRENT_TIMESTAMP,
                    "IpAddress"=IpAddress
            WHERE "BuildingNumber" = BuildingInformationId;
        end;
    ELSE
        begin
             INSERT INTO "Input_TrimColorSelections"
            (
                "BuildingNumber",
                "WallPanel",
                "WallPanelValsparCode",
                "WallPanelSpecialName",
                "WallPanelText",
                "WallPanelHashCode",
                
                "WallInteriorSkin",
                "WallInteriorSkinValsparCode",
                "WallInteriorSkinSpecialName",
                "WallInteriorText",
                "WallInteriorHashCode",
                "CreatedBy",
                "CreatedDate",
                "IpAddress"
            )
            VALUES
            (
                BuildingInformationId,
                WallPanel,
                WallPanelValsparCode,
                WallPanelSpecialName,
                WallPanelText,
                WallPanelHashCode,
                
                WallInteriorSkin,
                WallInteriorSkinValsparCode,
                WallInteriorSkinSpecialName,
                WallInteriorText,
                WallInteriorHashCode,
                UserId,
                CURRENT_TIMESTAMP,
                IpAddress
            );
        end;     
    end if;
END Wall_SetColor;
/