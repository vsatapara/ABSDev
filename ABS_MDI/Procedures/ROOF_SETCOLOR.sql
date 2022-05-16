CREATE OR REPLACE PROCEDURE abs_mdi."ROOF_SETCOLOR" 
(
    BuildingInformationId IN NUMBER,
    RoofPanel IN VARCHAR2 DEFAULT NULL,
    RoofPanelValsparCode IN VARCHAR2 DEFAULT NULL,
    RoofPanelSpecialName IN VARCHAR2 DEFAULT NULL,    
    RoofInteriorSkin IN VARCHAR2 DEFAULT NULL,
    RoofInteriorSkinValsparCode IN VARCHAR2 DEFAULT NULL,
    RoofInteriorSkinSpecialName IN VARCHAR2 DEFAULT NULL
)
AS 
TotalCount number;
BEGIN
  select count(*) into TotalCount from "Input_TrimColorSelections" WHERE "BuildingNumber" = BuildingInformationId;-- and "IsDelete" != 'Y';
    if TotalCount != 0 then
        BEGIN
            UPDATE "Input_TrimColorSelections" SET        
                    "RoofPanel" = RoofPanel,
                    "RoofPanelValsparCode" = RoofPanelValsparCode,
                    "RoofPanelSpecialName"=RoofPanelSpecialName,
                    "RoofInteriorSkin"=RoofInteriorSkin,
                    "RoofInteriorSkinValsparCode"=RoofInteriorSkinValsparCode,                    
                    "RoofInteriorSkinSpecialName" = RoofInteriorSkinSpecialName
            WHERE "BuildingNumber" = BuildingInformationId;
        END;
    ELSE
        BEGIN
             INSERT INTO "Input_TrimColorSelections"
            (
                "BuildingNumber",
                "RoofPanel",
                "RoofPanelValsparCode",
                "RoofPanelSpecialName",
                "RoofInteriorSkin",
                "RoofInteriorSkinValsparCode",                
                "RoofInteriorSkinSpecialName"
            )
            VALUES
            (
                BuildingInformationId,
                RoofPanel,
                RoofPanelValsparCode,
                RoofPanelSpecialName,
                RoofInteriorSkin,
                RoofInteriorSkinValsparCode,                
                RoofInteriorSkinSpecialName
            );
        END;     
    END IF;
END ROOF_SETCOLOR;
/