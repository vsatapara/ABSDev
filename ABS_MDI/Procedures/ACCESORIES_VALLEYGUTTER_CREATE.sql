CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_VALLEYGUTTER_CREATE" (
    BuildingNumber  IN   NUMBER,
    ProjectId       IN   NUMBER,
    Quantity        IN   NUMBER,
    VLength          IN   NUMBER,
    ConductorHeadLocation   IN   VARCHAR2,
    UserId          IN   NUMBER DEFAULT NULL,
    IpAddress       IN   VARCHAR2,
    OutputId        OUT  NUMBER
) AS
BEGIN
    INSERT INTO "Accessories_Valleygutters" (
        "BuildingInformationId",
        "ProjectId",
        "Quantity",
        "Length",
        "Weight",
        "Drainage",
        "DownspoutLength",
        "ConductorHeadLocation",
        "IsDelete",
        "CreatedBy",
        "CreatedDate",
        "IpAddress",
        "NewBuilding",
        "Color",
        "ErrorCode",
        "Price",
        "IsPrice"
    ) VALUES (
        BuildingNumber,
        ProjectId,
        Quantity,
        VLength,
        0,
        0,
        0,
        ConductorHeadLocation,
        'N',
        UserId,
        CURRENT_TIMESTAMP,
        IpAddress,
        0,
        0,
        0,
        0,
        0
    ) RETURNING "ValleyguttersId" INTO OutputId;
END ACCESORIES_VALLEYGUTTER_CREATE;
/