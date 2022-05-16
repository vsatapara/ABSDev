CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_WAINSCOT_GETMAXBAYS" 
(
BuildingInformationId IN NUMBER,
    BaysInformation OUT SYS_REFCURSOR
)
AS 
BEGIN 
Open BaysInformation For
SELECT
    "A1"."BuildingInformationId"    "BuildingInformationId",
    "A1"."BayNumber"                "BayNumber",
    "A1"."Elevation"                "Elevation"
FROM
    "Input_Bays" "A1";
END ACCESSORIES_WAINSCOT_GETMAXBAYS;
/