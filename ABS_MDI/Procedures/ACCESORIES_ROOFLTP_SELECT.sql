CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_ROOFLTP_SELECT" (
    RoofLTPId    IN   NUMBER,
    RoofLTP_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN RoofLTP_Data FOR SELECT
                             "RoofLTPId",
                             "BuildingNumber",
                             "ProjectId",
                             "Length",
                             "Size",
                             "Location",
                             "IsInsulated",
                             "IsUL90Framing",
                             "Qty"
                         FROM
                             "Accesories_RoofLTP"
                         WHERE
                                 "RoofLTPId" = RoofLTPId
                             AND "IsDelete" = 'N';
END ACCESORIES_ROOFLTP_SELECT;
/