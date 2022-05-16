CREATE OR REPLACE PROCEDURE abs_mdi."COLLATERAL_CREATE" (
    ProjectId         IN   NUMBER,
    BuildingNumber    IN   NUMBER,
    CeilingLoad       IN   NUMBER,
    OtherLoad         IN   NUMBER,
    PlasterSheetrock  IN   NUMBER,
    Occupancy         IN   VARCHAR2,
    CreatedBy         IN   NUMBER,
    IpAddress         IN   VARCHAR2,
    BurLoad IN NUMBER DEFAULT  0,
    OutputId          OUT  NUMBER
) AS
    record_exists      NUMBER;
    SetDesignCodeName  VARCHAR2(300);
BEGIN
    record_exists := 0;
    SELECT
        "DesignCodeName"
    INTO SetDesignCodeName
    FROM
        "Project"
    WHERE
            "ProjectId" = ProjectId
        AND "IsDelete" != 'Y';
    SELECT
        COUNT(*)
    INTO record_exists
    FROM
        "Collaterals" C
    WHERE
            C."BuildingNumber" = BuildingNumber
        AND C."IsDeleted" != 'Y';
    IF record_exists > 0 THEN
        UPDATE "Collaterals"
        SET
            "CeilingLoad" = CeilingLoad,
            "OtherLoad" = OtherLoad,
            "PlasterSheetrock" = PlasterSheetrock,
            "Occupancy" = Occupancy,
            "BurLoad" = BurLoad,
            "ModifiedBy" = CreatedBy,
            "ModifiedDate" = CURRENT_TIMESTAMP,
            "BuildingCode" = SetDesignCodeName
        WHERE
                "ProjectId" = ProjectId
            AND "BuildingNumber" = BuildingNumber;
        SELECT
            "CollateralId"
        INTO OutputId
        FROM
            "Collaterals"
        WHERE
                "BuildingNumber" = BuildingNumber
            AND "ProjectId" = ProjectId;
    ELSE
        INSERT INTO "Collaterals" (
            "ProjectId",
            "BuildingNumber",
            "CeilingLoad",
            "OtherLoad",
            "PlasterSheetrock",
            "Occupancy",
            "BurLoad",
            "CreatedBy",
            "CreatedDate",
            "IpAddress",
            "IsDeleted",
            "BuildingCode"
        ) VALUES (
            ProjectId,
            BuildingNumber,
            CeilingLoad,
            OtherLoad,
            PlasterSheetrock,
            Occupancy,
            BurLoad,
            CreatedBy,
            current_timestamp,
            IpAddress,
            'N',
            SetDesignCodeName
        ) RETURNING "CollateralId" INTO OutputId;
    END IF;
END collateral_create;
/