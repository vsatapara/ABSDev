CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_TOPMOUNTEDSLIDEDOOR_INIT" 
(
    ProjectId IN NUMBER,   
    Output_TopMountedSlideDoorSize OUT SYS_REFCURSOR,
    Output_Building OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN Output_TopMountedSlideDoorSize FOR
        SELECT
           T."Id" AS "Id",
           T."ItemText" AS "Value"
        FROM
            "TableOfTables" T
        where T."Category"='TopMounteSlideDoorSize' and "IsActive" = 'Y'
        order by T."DisplayOrder"; 
        
    OPEN Output_Building FOR
        SELECT
             BI."BuildingInformationId" AS "Id",
            BI."BuildingName" AS "Name",
            BI."BuildingLabel" AS "Label",
            BI."Elevation" AS "Elevation",
            BI."IsComplete" AS "IsComplete",
            MPT."Type" AS "Type",
            MPD."Value" AS "Gauge"           
        From "BuildingInformation" BI
            LEFT JOIN  "Input_Wall" IW
            ON IW."BuildingInformationId"=BI."BuildingInformationId"
            LEFT JOIN  "M_PanelType" MPT
            ON IW."Type" = MPT."Id"
            LEFT JOIN "M_Panel_Dropdown" MPD
            ON IW."Gauge" = MPD."Id"
        WHERE BI."ProjectId"=ProjectId and BI."IsDelete" != 'Y' ORDER BY BI."BuildingLabel" ASC;
END ACCESSORIES_TOPMOUNTEDSLIDEDOOR_INIT;
/