CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_WAINSCOT_CREATE" 
(
   
    BuildingInformation_Id in   NUMBER,
    Project_Id       IN   NUMBER,
    Qty        IN   NUMBER,
    Wainscot_Height        IN   VARCHAR2,
    From_Column        IN   NUMBER,
    To_Column        IN   NUMBER,
    TransitionStyle_Id        IN   NUMBER,
    PanelType_Id        IN   NUMBER,
    PanelThickness_Id        IN   NUMBER,
    PanelColor_Id        IN   STRING,
    TransitionTrimColor_Id        IN   STRING,
    Wainscot_Elevation        IN   STRING,
    User_Id IN  NUMBER,
    Ip_Address IN   STRING,
    OutputId  OUT  NUMBER
) AS 
BEGIN
   INSERT INTO "Accesories_Wainscot" (
       
    "BuildingInformationId",
     "ProjectId",
      "Qty",
       "Hieght",
    "FromColumn",
    "ToColumn",
    "TransitionStyleId",
    "PanelTypeId",
      "PanelThicknessId",
    "PanelColorId",
    "TransitionTrimColorId",
    "Elevation",
    "IpAddress",
    "CreatedBy",
    "CreatedDate",
     "IsDelete"
    
    ) VALUES (
        BuildingInformation_Id,
        Project_Id,
        1,
        Wainscot_Height,
        From_Column,
        To_Column,
        TransitionStyle_Id,
        PanelType_Id,
        PanelThickness_Id,
        PanelColor_Id,
        TransitionTrimColor_Id,
        Wainscot_Elevation,
        Ip_Address,
        User_Id,
        CURRENT_TIMESTAMP,
        'N'
    ) RETURNING "WainscotId" INTO OutputId;
END ACCESSORIES_WAINSCOT_CREATE;
/