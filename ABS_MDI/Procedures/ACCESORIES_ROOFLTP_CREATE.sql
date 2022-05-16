CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_ROOFLTP_CREATE" (
    BuildingNumber  IN   NUMBER,
    ProjectId       IN   NUMBER,
    Length          IN   NUMBER,
    RoofSize        IN   NUMBER,
    Location        IN   VARCHAR2,
    Qty             IN   NUMBER,
    IsInsulated     IN   CHAR,
    IsUL90Framing   IN   CHAR,
    UserId          IN   NUMBER DEFAULT NULL,
    IpAddress       IN   VARCHAR2,
    OutputId        OUT  NUMBER
) AS
    RoofType VARCHAR(50);
BEGIN
    SELECT
        "Type"
    INTO RoofType
    FROM
        "Input_Roof"
    WHERE
        "BuildingInformationId" = BuildingNumber;
    INSERT INTO "Accesories_RoofLTP" (
        "BuildingNumber",
        "ProjectId",
        "Length",
        "Size",
        "Location",
        "Qty",
        "IsInsulated",
        "IsUL90Framing",
        "IsDelete",
        "CreatedBy",
        "CreatedDate",
        "IpAddress",
        "RoofType"
    ) VALUES (
        BuildingNumber,
        ProjectId,
        Length,
        RoofSize,
        Location,
        Qty,
        IsInsulated,
        IsUL90Framing,
        'N',
        UserId,
        CURRENT_TIMESTAMP,
        IpAddress,
            CASE
                WHEN RoofType IN ( 'LS36', 'CFR' ) THEN
                    ''
                ELSE
                    RoofType
            END
    ) RETURNING "RoofLTPId" INTO OutputId;
END ACCESORIES_ROOFLTP_CREATE;
/