CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_WAINSCOT_GETPANELDETIALSBYID" 
(
    BuildingInformationId IN NUMBER,
    Panel_Data OUT SYS_REFCURSOR
  
)
AS 
BEGIN
 OPEN Panel_Data FOR 
         SELECT
        W."Type",
        W."Thick",
        PT."Type" as PanelTypeName,
        PD."Value" as PanelThicknessValue
        From 
        "Input_Wall" W
        LEFT join "M_PanelType" PT
        on W."Type"=PT."Id"
        LEFT JOIN "M_Panel_Dropdown" PD
        on  W."Thick"=PD."Id"
        
        where W."BuildingInformationId"=BuildingInformationId;
        
END ACCESSORIES_WAINSCOT_GETPANELDETIALSBYID;
/