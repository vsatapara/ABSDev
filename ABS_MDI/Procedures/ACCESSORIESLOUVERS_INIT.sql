CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIESLOUVERS_INIT" 
(
    ProjectId IN NUMBER,
    BuildingId IN NUMBER,
    Output_Size OUT SYS_REFCURSOR,
    Output_Building OUT SYS_REFCURSOR,
    Output_LouversMaster OUT SYS_REFCURSOR
)
AS
BEGIN
    OPEN  Output_Size FOR
        SELECT 
           "Id",
           "LouverSize",
           "LouverImage"
        FROM "Accessories_LouverSize";
        
    OPEN Output_Building FOR
        SELECT
            BI."BuildingInformationId" Id,
            BI."BuildingName" Name,
            BI."BuildingLabel" Label,
            BI."Elevation" Elevation,
            BI."IsComplete" IsComplete
        FROM
        "BuildingInformation" BI
        where BI."ProjectId"=ProjectId and "IsDelete" != 'Y';
    IF BuildingId = 0 THEN
        OPEN Output_LouversMaster FOR 
            SELECT "State",
            'PBR' AS Type,
            24 AS Gauge
            FROM "Project" WHERE "ProjectId"=ProjectId;
    ELSE
        OPEN Output_LouversMaster FOR 
        SELECT
            MPT."Type" AS Type,
            MPD."Value" AS Gauge,
            (SELECT "State" FROM "Project" WHERE "ProjectId"=ProjectId) AS State
        FROM "Input_Wall" IW
        INNER JOIN  "M_PanelType" MPT
        ON IW."Type" = MPT."Id"
        INNER JOIN "M_Panel_Dropdown" MPD
        ON IW."Gauge" = MPD."Id"
        WHERE IW."BuildingInformationId"=BuildingId;
    END IF;
END ACCESSORIESLOUVERS_INIT;
/