CREATE OR REPLACE PROCEDURE abs_mdi."BAYS_LIST_TEMP" 
(
    BuildingInformationId                 IN   NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
    ParentBuildingId Number;
    Elevation  VARCHAR2(40);
    L_COUNT   NUMBER(5);
BEGIN
    SELECT
        COUNT(*)
    INTO L_COUNT
    FROM
        "BuildingInformation"
    WHERE
            "BuildingInformationId" = BuildingInformationId
            AND ROWNUM = 1;
            
    IF ( L_COUNT > 0 ) 
    THEN
        SELECT
            "ParentBuildingId",
            "AttachmentElevation"
        INTO ParentBuildingId,Elevation
        FROM
            "BuildingInformation"
        WHERE
                "BuildingInformationId" = BuildingInformationId
            AND ROWNUM = 1;
    END IF;
    
    IF ( Elevation = 'SWA' OR Elevation = 'SWC' OR Elevation = 'EWA' OR Elevation = 'EWC') 
    THEN
    OPEN Output_Data FOR 
    SELECT 
        "BuildingInformationId" AS "BuildingId",
        "Elevation" AS "Elevation",
        "BayNumber" AS "BayNumber",
        "Width" AS "BayWidth"
    FROM 
    "Input_Bays" 
    WHERE 
    "BuildingInformationId" = ParentBuildingId;
    ELSIF ( Elevation = 'EWB' OR Elevation = 'SWB' ) 
    THEN
        OPEN Output_Data FOR 
        SELECT
            iec."BuildingNo" AS "BuildingId",
            'B' AS "Elevation",
            "BayNo" AS "BayNumber",
            "BaySpacing" AS "BayWidth"
            FROM
            "Input_Endwall" ie,"Input_Endwalls_ColumnSpacing" iec
            WHERE 
            iec."BuildingNo" = ParentBuildingId AND ie."EndWallID" = iec."EndWallID" AND ie."EndWallNo"=1;
    ELSE
        OPEN Output_Data FOR 
        SELECT
            iec."BuildingNo" AS "BuildingId",
            'D' AS "Elevation",
            "BayNo" AS "BayNumber",
            "BaySpacing" AS "BayWidth"
            FROM
            "Input_Endwall" ie,"Input_Endwalls_ColumnSpacing" iec
            WHERE 
            iec."BuildingNo" = ParentBuildingId AND ie."EndWallID" = iec."EndWallID" AND ie."EndWallNo"=2;
    END IF;
END BAYS_LIST_TEMP;
/