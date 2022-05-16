CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_ROOFLINER_LIST" (
    BuildingId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
   OPEN Output_Data FOR 
 SELECT
    AL."LinerId",
    TOT."ItemText" "LinerCoverageValue",
    AL."StartColumn",
    AL."StopColumn",
    AL."XFrom",
    AL."XTo",
    AL."YFrom",
    AL."YTo"
FROM
    "Accessories_Liners" AL join "TableOfTables" TOT ON ToT."Id"= AL."LinerCoverage" WHERE AL."BuildingNumber" = BuildingId AND AL."Elevation"='R' AND AL."IsDelete"='N';
END ACCESSORIES_ROOFLINER_LIST;
/