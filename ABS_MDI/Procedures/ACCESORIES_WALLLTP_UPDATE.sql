CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_WALLLTP_UPDATE" (
/*   Created By    Dipali Patel    
     Created Date  25-07-2021
     Description   This stored Procedure used to Update Accesories_WallLTP.
*/
   WallLTPId                IN  NUMBER,
    BuildingInformationId    IN  NUMBER,
    Quantity                 IN  NUMBER,
    Elevation                IN  CHAR,
    Type                     IN  VARCHAR2,
    Size_                     IN  NUMBER,
    DistFromLeftCorner       IN  NUMBER,
    DistFromLeftCol          IN  NUMBER,
    PatternPerBay            IN  NUMBER,
    EaveCondition            IN  VARCHAR2,
    Continuous               IN  CHAR,
    TopElevation             IN  NUMBER,
    LTPSize                  IN  VARCHAR2,
    AccessoryConflictOverride IN  CHAR,
    PartitionNumber          IN  NUMBER,
    InsulationTrim           IN  CHAR,
    Length                   IN  NUMBER,
    ProjectId               IN  NUMBER,
    StopValue               IN  NUMBER,
    IsLocate               IN  CHAR,
    UserId          IN  NUMBER DEFAULT NULL,
    IpAddress       IN  VARCHAR2
) AS
BEGIN
    UPDATE "Accesories_WallLTP"
    SET
        "BuildingInformationId"=BuildingInformationId,
        "Quantity"=Quantity,
        "Elevation"=Elevation,
        "Type"=Type,
        "Size"=Size_,
        "DistFromLeftCorner"=DistFromLeftCorner,
        "DistFromLeftCol"=DistFromLeftCol,
        "PatternPerBay"=PatternPerBay,
        "EaveCondition"=EaveCondition,
        "Continuous"=Continuous,
        "TopElevation"=TopElevation,
        "LTPSize"=LTPSize,
        "AccessoryConflictOverride"=AccessoryConflictOverride,
        "InsulationTrim"=InsulationTrim,
        "PartitionNumber"=case when PartitionNumber=0 then null else PartitionNumber end,
        "Length"=Length,
        "ProjectId"=ProjectId,
        "StopValue"=StopValue,
        "IsLocate"=IsLocate,
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
    WHERE
        "WallLTPId" = WallLTPId;
END ACCESORIES_WALLLTP_UPDATE;
/