CREATE OR REPLACE PROCEDURE abs_mdi."COLLATERAL_UPDATE" 
(
CollateralId IN NUMBER,
ProjectId IN NUMBER,
BuildingNumber IN NUMBER,
CeilingLoad IN NUMBER,
OtherLoad IN NUMBER,
PlasterSheetrock IN NUMBER,
Occupancy IN VARCHAR2,
BurLoad IN NUMBER DEFAULT  0,
ModifiedBy IN NUMBER,
IpAddress IN VARCHAR2
)
AS 
SetDesignCodeName VARCHAR2(300);
BEGIN
SELECT "DesignCodeName" INTO SetDesignCodeName FROM "Project" WHERE "ProjectId"=ProjectId AND "IsDelete" != 'Y';
 UPDATE "Collaterals"
SET
"CeilingLoad" = CeilingLoad,
"OtherLoad" = OtherLoad,
"PlasterSheetrock" = PlasterSheetrock,
"Occupancy" = Occupancy,
"BurLoad" = BurLoad,
"ModifiedBy" = ModifiedBy,
"ModifiedDate" = CURRENT_TIMESTAMP,
 "BuildingCode"=SetDesignCodeName
     WHERE "ProjectId"=ProjectId AND "BuildingNumber"=BuildingNumber;
END COLLATERAL_UPDATE;
/