CREATE OR REPLACE PROCEDURE abs_mdi."ACCESSORIES_WAINSCOT_GETBAYSDETAILS" 
(
BuildingInformationId IN NUMBER,
    BaysInformation_A OUT SYS_REFCURSOR,
     BaysInformation_B OUT SYS_REFCURSOR,
      BaysInformation_C OUT SYS_REFCURSOR,
       BaysInformation_D OUT SYS_REFCURSOR
)
AS 
BEGIN 
Open BaysInformation_A For
SELECT
    "A1"."BuildingInformationId"    "BuildingInformationId",
    "A1"."RoofBaySpacing"                "BayNumber",
    'A'                "Elevation"
FROM
    "NXTABS"."Input_GirtsBaySpacing" "A1"
    WHERE "A1"."BuildingInformationId" = BuildingInformationId;
    
Open BaysInformation_B For
SELECT
    "A1"."BuildingInformationId"    "BuildingInformationId",
    "A1"."RoofBaySpacing"                "BayNumber",
    'B'                "Elevation"
FROM
    "NXTABS"."Input_GirtsBaySpacing" "A1"
    WHERE "A1"."BuildingInformationId" = BuildingInformationId;
    
Open BaysInformation_C For
SELECT
    "A1"."BuildingInformationId"    "BuildingInformationId",
    "A1"."RoofBaySpacing"                "BayNumber",
        'C'                "Elevation"
FROM
    "NXTABS"."Input_GirtsBaySpacing" "A1"
    WHERE "A1"."BuildingInformationId" = BuildingInformationId;
    
Open BaysInformation_D For
SELECT
    "A1"."BuildingInformationId"    "BuildingInformationId",
    "A1"."RoofBaySpacing"                "BayNumber",
        'D'                "Elevation"
FROM
    "NXTABS"."Input_GirtsBaySpacing" "A1"
    WHERE "A1"."BuildingInformationId" = BuildingInformationId;
 
END ACCESSORIES_WAINSCOT_GETBAYSDETAILS;
/