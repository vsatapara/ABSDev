CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_PARAPET_SELECT" (
/*   Created By    Dipali Patel    
     Created Date  23-08-2021
     Description   This stored Procedure used to Select Accesories_Parapet.
*/
    ParapetId    IN   NUMBER,
    Parapet_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN Parapet_Data FOR SELECT
                                "ParapetId",
                                "ProjectId",
                                "BuildingInformationId",
                                "Elevation",
                                "StartColumn",
                                "StopColumn",
                                "DistFromLeftCorner",
                                "Height"
                         FROM
                                "Accessories_Parapet"
                         WHERE
                                "ParapetId" = ParapetId AND "IsDelete" = 'N';
END ACCESSORIES_PARAPET_SELECT;
/