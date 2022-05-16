CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_WAINSCOT_UPDATE" 
(
    Id IN NUMBER,
    BuildingInformation_Id IN   NUMBER,
    Project_Id       IN   NUMBER,
    Qty        IN   NUMBER,
    Wainscot_Height        IN   VARCHAR2,
    From_Column        IN   NUMBER,
    To_Column        IN   NUMBER,
    TransitionStyle_Id        IN   NUMBER,
    PanelType_Id        IN   NUMBER,
    PanelThickness_Id        IN   NUMBER,
    PanelColor_Id        IN   VARCHAR2,
    TransitionTrimColor_Id        IN   VARCHAR2,
    Wainscot_Elevation        IN   VARCHAR2,
    Ip_Address IN   VARCHAR2,
    User_Id  out NUMBER
)
AS 
BEGIN
  UPDATE "Accesories_Wainscot"
    SET
        "BuildingInformationId"=BuildingInformation_Id,
        "ProjectId"=Project_Id,
        "Hieght"=Wainscot_Height,
        "FromColumn"=From_Column,
        "ToColumn"=To_Column,
        "TransitionStyleId"=TransitionStyle_Id,
        "PanelTypeId"=PanelType_Id,
        "PanelThicknessId"=PanelThickness_Id,
        "PanelColorId"=PanelColor_Id,
        "TransitionTrimColorId"=TransitionTrimColor_Id,
        "Elevation"=Wainscot_Elevation,
        "ModifiedBy"=User_Id ,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=Ip_Address
  
    WHERE
        "WainscotId" = Id;
END ACCESSORIES_WAINSCOT_UPDATE;
/