CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_WAINSCOT_SELECT_BY_ELEVATION" 
(
    BuildingInformationId IN NUMBER,
    ElevationA_Data OUT SYS_REFCURSOR,
    ElevationB_Data OUT SYS_REFCURSOR,
    ElevationC_Data OUT SYS_REFCURSOR,
    ElevationD_Data OUT SYS_REFCURSOR
    
)
AS 
BEGIN
  OPEN ElevationA_Data FOR 
    SELECT
    A1."WainscotId",
    A1."Elevation",
    A1."FromColumn",               
    A1."ToColumn"
	FROM
	"Accesories_Wainscot" A1
	WHERE
    A1."BuildingInformationId" =BuildingInformationId AND (A1."Elevation"='SWA' OR A1."Elevation"='EWA')AND A1."IsDelete"='N';
   OPEN ElevationB_Data FOR 
    SELECT
    A1."WainscotId",
    A1."Elevation",
    A1."FromColumn",               
    A1."ToColumn"
	FROM
	"Accesories_Wainscot" A1
	WHERE
    A1."BuildingInformationId" =BuildingInformationId AND (A1."Elevation"='SWB' OR A1."Elevation"='EWB')AND A1."IsDelete"='N';
 OPEN ElevationC_Data FOR 
    SELECT
    A1."WainscotId",
    A1."Elevation",
    A1."FromColumn",               
    A1."ToColumn"
	FROM
	"Accesories_Wainscot" A1
	WHERE
    A1."BuildingInformationId" =BuildingInformationId AND (A1."Elevation"='SWC' OR A1."Elevation"='EWC')AND A1."IsDelete"='N';
     OPEN ElevationD_Data FOR 
    SELECT
    A1."WainscotId",
    A1."Elevation",
    A1."FromColumn",               
    A1."ToColumn"
	FROM
	"Accesories_Wainscot" A1
	WHERE
    A1."BuildingInformationId" =BuildingInformationId AND (A1."Elevation"='SWD' OR A1."Elevation"='EWD')AND A1."IsDelete"='N';
END ACCESORIES_WAINSCOT_SELECT_BY_ELEVATION;
/