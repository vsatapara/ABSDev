CREATE OR REPLACE PROCEDURE abs_mdi."INSULATION_DELETE" 
(
    ProjectId IN NUMBER,
    BuildingId IN NUMBER,
    Action IN VARCHAR2 DEFAULT NULL,
    ModifiedBy IN VARCHAR2
)
AS 
BEGIN
    IF(Action ='INSULATION')
      THEN
        UPDATE "Insulation"
        SET
            "IsDelete"='Y',
            "ModifiedBy" = ModifiedBy,
            "ModifiedDate"=CURRENT_TIMESTAMP
        WHERE "BuildingNumber" IN(SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId"=ProjectId);
    ELSIF (Action ='INSULATION_BUILDING')
      THEN
        UPDATE "Insulation"
        SET
            "IsDelete"='Y',
            "ModifiedBy" = ModifiedBy,
            "ModifiedDate"=CURRENT_TIMESTAMP
        WHERE "BuildingNumber"=BuildingId;
         
         UPDATE "InsulationAccessories"
        SET
            "IsDelete"='Y',
            "ModifiedBy" = ModifiedBy,
            "ModifiedDate"=CURRENT_TIMESTAMP
        WHERE "BuildingNumber"=BuildingId;
    ELSIF (Action ='INSULATION_ACCESSORIES')
      THEN
        UPDATE "InsulationAccessories"
        SET
            "IsDelete"='Y',
            "ModifiedBy" = ModifiedBy,
            "ModifiedDate"=CURRENT_TIMESTAMP
        WHERE "BuildingNumber" IN(SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId"=ProjectId);
    ELSE
        UPDATE "Insulation"
        SET
            "IsDelete"='Y',
            "ModifiedBy" = ModifiedBy,
            "ModifiedDate"=CURRENT_TIMESTAMP
        WHERE "BuildingNumber" IN(SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId"=ProjectId);
        
        UPDATE "InsulationAccessories"
        SET
            "IsDelete"='Y',
            "ModifiedBy" = ModifiedBy,
            "ModifiedDate"=CURRENT_TIMESTAMP
        WHERE "BuildingNumber" IN(SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "ProjectId"=ProjectId);
    END IF;
END INSULATION_DELETE;
/