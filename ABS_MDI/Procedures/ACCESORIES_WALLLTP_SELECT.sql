CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_WALLLTP_SELECT" (
/*   Created By    Dipali Patel    
     Created Date  25-07-2021
     Description   This stored Procedure used to Select Accesories_WallLTP.
*/
    WallLTPId    IN   NUMBER,
    WallLTP_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN WallLTP_Data FOR SELECT
                                "WallLTPId",
                                "BuildingInformationId",
                                "Quantity",
                                "Elevation",
                                aw."Type",
                                "Size",
                                "DistFromLeftCorner",
                                "DistFromLeftCol",
                                "PatternPerBay",
                                "EaveCondition",
                                "Continuous",
                                "TopElevation",
                                --"LTPSize",
                                ws."Id" "LTPSize",
                                "AccessoryConflictOverride",
                                "InsulationTrim",
                                "Length",
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
                                "Price"
                       FROM
                             "Accesories_WallLTP" aw JOIN "Accesories_WallLTP_Size" ws ON aw."LTPSize" = ws."Value"
                              JOIN "Accesories_WallLTP_Common" wc ON ws."Id" = wc."SizeId"
                              JOIN "M_PanelType" MPanel ON wc."TypeId" = MPanel."Id"
                         WHERE
                                 "WallLTPId" = WallLTPId
                             AND MPanel."Type"=aw."Type"
                             AND "IsDelete" = 'N';
END ACCESORIES_WALLLTP_SELECT;
/