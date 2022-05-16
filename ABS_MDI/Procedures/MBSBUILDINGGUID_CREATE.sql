CREATE OR REPLACE PROCEDURE abs_mdi."MBSBUILDINGGUID_CREATE" (
       BuildingId IN NUMBER,
       ProjectId IN NUMBER
)AS
Total  Number;
UserId VARCHAR2(40);
BEGIN
        SELECT COUNT(*)
        INTO Total
        FROM "MBSBuildingPrice"
        WHERE "BuildingId" = BuildingId;
        IF Total = 0 THEN --OR GuiId IS null 
        
        BEGIN
            SELECT "UserId" INTO UserId FROM "Project" WHERE "ProjectId" =  ProjectId;
            INSERT INTO "MBSBuildingPrice"(
                "BuildingId",
                "BuildingGuid",
                "ProjectId",
                "ProjectGuid",
                "UserId")
            VALUES(
                BuildingId,
                RAW_TO_GUID(sys_guid()),
                ProjectId,
                RAW_TO_GUID(sys_guid()),
                UserId);
        --RETURNING "BuildingGuid"."BuildingGuid" Into BuildingGuid_Data;
        END;
        END IF;
END MBSBuildingGuid_Create;
/