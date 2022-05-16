CREATE OR REPLACE PROCEDURE abs_mdi."GIRTSANDPURLIN_ROOFBAYSPACING_LIST" 
(
    BuildingId IN NUMBER,
    RoofBaySpacing_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
OPEN RoofBaySpacing_Data FOR SELECT 
        "RoofBaySpaceId",
        "BuildingInformationId",
        "Elevation",
        "BayNumber",
        "Width"
        FROM "Input_Bays" where "BuildingInformationId" = BuildingId
        ORDER BY "RoofBaySpaceId";
END GirtsAndPurlin_RoofBaySpacing_LIST;
/