CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_WALLLTP_CREATE" (
/*   Created By    Dipali Patel    
     Created Date  25-07-2021
     Description   This stored Procedure used to Insert Accesories_WallLTP.
*/
    BuildingInformationId    IN  NUMBER,
    Quantity                 IN  NUMBER,
    Elevation                IN  CHAR,
    Type                     IN  VARCHAR2,
    Length                   IN  NUMBER,
    Size_                     IN  NUMBER,
    DistFromLeftCorner       IN  NUMBER,
    DistFromLeftCol          IN  NUMBER,
    PatternPerBay            IN  NUMBER,
    EaveCondition            IN  VARCHAR2,
    Continuous               IN  CHAR,
    InsulationTrim           IN  CHAR,
    TopElevation             IN  NUMBER,
    LTPSize                  IN  VARCHAR2,
    AccessoryConflictOverride IN  CHAR,
    PartitionNumber          IN  NUMBER,
    ProjectId               IN  NUMBER,
    StopValue               IN  NUMBER,
    IsLocate             IN  CHAR,  
    UserId                   IN   NUMBER DEFAULT NULL,
    IpAddress                IN   VARCHAR2,
    OutputId                 OUT  NUMBER
    
) AS
BEGIN
    INSERT INTO "Accesories_WallLTP" (
        "BuildingInformationId",
        "Quantity",
        "Elevation",
        "Type",
        "Length",
        "Size",
        "DistFromLeftCorner",
        "DistFromLeftCol",
        "PatternPerBay",
        "EaveCondition",
        "Continuous",
        "InsulationTrim",
        "TopElevation",
        "LTPSize",
        "AccessoryConflictOverride",
        "PartitionNumber",
        "ProjectId",
        "StopValue",
        "IsLocate",
        "IsDelete",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
    ) VALUES (
        BuildingInformationId,
        Quantity,
        Elevation,
        Type,
        Length,
        Size_,
        DistFromLeftCorner,
        DistFromLeftCol,
        PatternPerBay,
        EaveCondition,
        Continuous,
        InsulationTrim,
        TopElevation,
        LTPSize,
        AccessoryConflictOverride,
        case when PartitionNumber=0 then null else PartitionNumber end,
        ProjectId,
        StopValue,
        IsLocate,
        'N',
        UserId,
        CURRENT_TIMESTAMP,
        IpAddress
    ) RETURNING "WallLTPId" INTO OutputId;
END ACCESORIES_WALLLTP_CREATE;
/