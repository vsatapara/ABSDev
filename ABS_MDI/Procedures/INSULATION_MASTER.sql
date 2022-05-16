CREATE OR REPLACE PROCEDURE abs_mdi."INSULATION_MASTER" 
(
    BuildingNumber IN NUMBER DEFAULT NULL,
    BuildingHasInsulation IN NUMBER DEFAULT NULL,
    InsulationByBrand IN NUMBER DEFAULT NULL,
    ComCheck IN NUMBER DEFAULT NULL,
    IpAddress IN VARCHAR2 DEFAULT NULL,
    ModifiedBy IN VARCHAR2
)
AS 
BEGIN
   UPDATE "BuildingInformation" 
   SET
        "BuildingHasInsulation" = BuildingHasInsulation,
        "InsulationByBrand" = InsulationByBrand,
        "ComCheck" = ComCheck,
        "ModifiedBy" = ModifiedBy,
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"=IpAddress
    WHERE "BuildingInformationId" = BuildingNumber;
END INSULATION_MASTER;
/