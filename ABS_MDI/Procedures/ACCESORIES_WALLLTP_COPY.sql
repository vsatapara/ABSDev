CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_WALLLTP_COPY" (
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
    IsLocate                IN  CHAR,
    Insulated               IN  CHAR,
    TrimFlashing            IN  CHAR,  
    UL90                    IN  CHAR,
    IsPriced                IN  CHAR, 
    ErrorCode               IN  NUMBER,
    QuantityA               IN  NUMBER,
    QuantityB               IN  NUMBER,
    QuantityC               IN  NUMBER,
    QuantityD               IN  NUMBER,
    Weight                  IN  NUMBER,
    Price                   IN  NUMBER,
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
        "Insulated",
        "TrimFlashing",
        "UL90",
        "IsPriced",
        "ErrorCode",
        "QuantityA",
        "QuantityB",
        "QuantityC",
        "QuantityD",
        "Weight",
        "Price",
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
        Insulated,
        TrimFlashing,
        UL90,
        IsPriced,
        ErrorCode,
        QuantityA,
        QuantityB,
        QuantityC,
        QuantityD,
        Weight,
        Price,
        'N',
        UserId,
        CURRENT_TIMESTAMP,
        IpAddress
    ) RETURNING "WallLTPId" INTO OutputId;
END ACCESORIES_WALLLTP_COPY;
/