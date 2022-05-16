CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_DBCIDOOR_INIT" 
(
    ProjectId IN NUMBER,
    BuildingId IN NUMBER,
     --Output_DBCIDoors OUT SYS_REFCURSOR,
      Output_DBCIDoorSeries OUT SYS_REFCURSOR,
       Output_DBCIDoorSize OUT SYS_REFCURSOR,
    Output_Building OUT SYS_REFCURSOR,
    Output_DBCIDOORMaster OUT SYS_REFCURSOR
)
AS
BEGIN
        OPEN Output_DBCIDoorSeries FOR
        SELECT
         T."Id" AS "Id",
           T."ItemText" AS "Value"
         FROM
         "TableOfTables" T
          where T."Category"='DBCIDoorSeries' and "IsActive" = 'Y'
         order by T."DisplayOrder"; 

  OPEN Output_DBCIDoorSize FOR
      SELECT
         T."Id" AS "Id",
          T."ItemText" AS "Value"
      FROM
        "TableOfTables" T
        where T."Category"='DBCIDoorSize' and "IsActive" = 'Y'
     order by T."DisplayOrder";
    OPEN Output_Building FOR
        SELECT
            BI."BuildingInformationId" AS "Id",
            BI."BuildingName" AS "Name",
            BI."BuildingLabel" AS "Label",
            BI."Elevation" AS "Elevation",
            BI."IsComplete" AS "IsComplete"
        FROM
        "BuildingInformation" BI
        where BI."ProjectId"=ProjectId and "IsDelete" != 'Y';     
        IF BuildingId = 0 THEN
          OPEN Output_DBCIDOORMaster FOR 
            SELECT "State",
            'PBR' AS Type,
            24 AS Gauge
            FROM "Project" WHERE "ProjectId"=ProjectId;
     ELSE
        OPEN Output_DBCIDOORMaster FOR 
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
END ACCESSORIES_DBCIDOOR_INIT;
/