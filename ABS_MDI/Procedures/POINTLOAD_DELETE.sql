CREATE OR REPLACE PROCEDURE abs_mdi."POINTLOAD_DELETE" 
(
        PointLoadId IN NUMBER,
        BuildingNumber IN NUMBER,
        ProjectId IN NUMBER,
        isDeleteAll IN VARCHAR,
        ModifiedBy IN NUMBER,
        IpAddress IN VARCHAR
)
AS 
BEGIN
    IF isDeleteAll = 'N' THEN
        UPDATE "PointLoads" 
            SET
                "IsDeleted" = 'Y',
                "ModifiedBy" = ModifiedBy,
                "ModifiedDate" = CURRENT_TIMESTAMP,
                "IpAddress" =  IpAddress
            WHERE
                    "PointLoadId" = PointLoadId
                AND "BuildingNumber" = BuildingNumber
                AND "ProjectId" = ProjectId;
    ELSE
        UPDATE "PointLoads" 
            SET
                "IsDeleted" = 'Y',
                "ModifiedBy" = ModifiedBy,
                "ModifiedDate" = CURRENT_TIMESTAMP,
                "IpAddress" =  IpAddress
            WHERE
                    "BuildingNumber" = BuildingNumber
                AND "ProjectId" = ProjectId;
    END IF;
END POINTLOAD_DELETE;
/