CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_WAINSCOT_SELECT" 
(
    Id IN NUMBER,
    Output_Data  OUT  SYS_REFCURSOR
    )
AS 
BEGIN
    OPEN Output_Data FOR
   SELECT
    
    "WainscotId",
    "BuildingInformationId",
    "FromColumn",
    "ToColumn",
    "Hieght",
    "PanelColorId",
    "ProjectId",
    "PanelThicknessId",
    "Qty",
    "TransitionStyleId",
    "TransitionTrimColorId",
    "Elevation"
    
FROM
    "Accesories_Wainscot" 
 WHERE
 "WainscotId" = Id and "IsDelete"='N';
 
END ACCESORIES_WAINSCOT_SELECT;
/