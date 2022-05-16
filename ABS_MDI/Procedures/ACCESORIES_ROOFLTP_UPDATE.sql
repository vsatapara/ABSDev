CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_ROOFLTP_UPDATE" (
    RoofLTPId       IN  NUMBER,
    BuildingNumber  IN  NUMBER,
    ProjectId       IN  NUMBER,
    Length          IN  NUMBER,
    RoofSize        IN  NUMBER,
    Location        IN  VARCHAR2,
    Qty             IN  NUMBER,
    IsInsulated     IN  CHAR,
    IsUL90Framing   IN  CHAR,
    UserId          IN  NUMBER DEFAULT NULL,
    IpAddress       IN  VARCHAR2
) AS
BEGIN
    UPDATE "Accesories_RoofLTP"
    SET
        "BuildingNumber" = BuildingNumber,
        "ProjectId" = ProjectId,
        "Length" = Length,
        "Size" = RoofSize,
        "Location" = Location,
        "Qty" = Qty,
        "IsInsulated" = IsInsulated,
        "IsUL90Framing" = IsUL90Framing,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
    WHERE
        "RoofLTPId" = RoofLTPId;
END ACCESORIES_ROOFLTP_UPDATE;
/