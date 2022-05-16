CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_VALLEYGUTTER_UPDATE" (
    ValleyguttersId IN  NUMBER,
    BuildingNumber  IN   NUMBER,
    ProjectId       IN   NUMBER,
    Quantity        IN   NUMBER,
    VLength          IN   NUMBER,
    ConductorHeadLocation   IN   VARCHAR2,
    UserId          IN   NUMBER DEFAULT NULL,
    IpAddress       IN   VARCHAR2
) AS
BEGIN
    UPDATE "Accessories_Valleygutters"
    SET
        "BuildingInformationId" = BuildingNumber,
        "ProjectId" = ProjectId,
        "Quantity" = Quantity,
        "Length" = VLength,
        "ConductorHeadLocation" = ConductorHeadLocation,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
    WHERE
        "ValleyguttersId" = ValleyguttersId;
END ACCESORIES_VALLEYGUTTER_UPDATE;
/