CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_WALLLINER_LIST" 
(
    BuildingId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
   SELECT
    "LinerId",
    "Elevation",
    "Length",
    "DistFromLeftCorner",
    "PartitionNumber"
FROM
    "Accessories_Liners" where "BuildingNumber"= BuildingId and "IsDelete" = 'N';
END ACCESSORIES_WALLLINER_LIST;
/