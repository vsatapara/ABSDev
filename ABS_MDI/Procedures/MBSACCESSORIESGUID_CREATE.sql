CREATE OR REPLACE PROCEDURE abs_mdi."MBSACCESSORIESGUID_CREATE" 
(
   BuildingId IN NUMBER,
   ProjectId IN NUMBER
)
AS
AccessoryVentsId  NUMBER;
TotalVents  NUMBER;
TotalDBCIdoor  NUMBER;
TotalWalkdoor NUMBER;
TotalWindows NUMBER;
TotalLouvers NUMBER;
TotalFramedOpening NUMBER;
TotalInsulation NUMBER;
TotalRubberPipeFlash NUMBER;
BEGIN
SELECT COUNT(*)
        INTO TotalVents
        FROM "MBSAccessoriesGuid"
        WHERE "BuildingId" = BuildingId AND "ProjectId" =ProjectId AND "AccessoriesName" = 'AccessoriesVents' ;
SELECT COUNT(*)
        INTO TotalDBCIdoor
        FROM "MBSAccessoriesGuid"
        WHERE "BuildingId" = BuildingId AND "ProjectId" =ProjectId AND "AccessoriesName" = 'AccessoriesDBCIdoor';
SELECT COUNT(*)
        INTO TotalWalkdoor
        FROM "MBSAccessoriesGuid"
        WHERE "BuildingId" = BuildingId AND "ProjectId" =ProjectId AND "AccessoriesName" = 'AccessoriesWalkdoor';
SELECT COUNT(*)
        INTO TotalWindows
        FROM "MBSAccessoriesGuid"
        WHERE "BuildingId" = BuildingId AND "ProjectId" =ProjectId AND "AccessoriesName" = 'AccessoriesWindows';
SELECT COUNT(*)
        INTO TotalLouvers
        FROM "MBSAccessoriesGuid"
        WHERE "BuildingId" = BuildingId AND "ProjectId" =ProjectId AND "AccessoriesName" = 'AccessoriesLouvers';
SELECT COUNT(*)
        INTO TotalFramedOpening
        FROM "MBSAccessoriesGuid"
        WHERE "BuildingId" = BuildingId AND "ProjectId" =ProjectId AND "AccessoriesName" = 'AccessoriesFramedOpening';
SELECT COUNT(*)
        INTO TotalInsulation
        FROM "MBSAccessoriesGuid"
        WHERE "BuildingId" = BuildingId AND "ProjectId" =ProjectId AND "AccessoriesName" = 'AccessoriesInsulation';
SELECT COUNT(*)
        INTO TotalRubberPipeFlash
        FROM "MBSAccessoriesGuid"
        WHERE "BuildingId" = BuildingId AND "ProjectId" =ProjectId AND "AccessoriesName" = 'AccessoriesRubberPipeFlash';
        
         IF TotalVents = 0 THEN --OR GuiId IS null 
FOR C IN( SELECT
"VentsId"
FROM "Accessories_Vents"
WHERE "BuildingId"=BuildingId AND  "ProjectId"=ProjectId AND NVL("IsDelete", 'N') = 'N')
LOOP
 INSERT INTO "MBSAccessoriesGuid"(
                "AccessoriesId",
                "AccessoriesGuid",
                "AccessoriesName",
                "BuildingId",
                "ProjectId")
            VALUES(
                C."VentsId",
                RAW_TO_GUID(sys_guid()),
                'AccessoriesVents',
                 BuildingId,
                 ProjectId);
END LOOP;
END IF;
     IF TotalDBCIdoor = 0 THEN --OR GuiId IS null 
FOR C IN( SELECT
"DbciDoorId"
FROM "Accessories_DBCIDoor"
WHERE "BuildingId"=BuildingId AND  "ProjectId"=ProjectId AND NVL("IsDelete", 'N') = 'N')
LOOP
 INSERT INTO "MBSAccessoriesGuid"(
                "AccessoriesId",
                "AccessoriesGuid",
                "AccessoriesName",
                "BuildingId",
                "ProjectId")
            VALUES(
                C."DbciDoorId",
                RAW_TO_GUID(sys_guid()),
                'AccessoriesDBCIdoor',
                 BuildingId,
                 ProjectId);
END LOOP;
END IF;
      IF TotalWalkdoor = 0 THEN --OR GuiId IS null 
FOR C IN( SELECT
"WalkDoorId"
FROM "Accessories_WalkDoors"
WHERE "BuildingId"=BuildingId AND  "ProjectId"=ProjectId AND NVL("IsDelete", 'N') = 'N')
LOOP
 INSERT INTO "MBSAccessoriesGuid"(
                "AccessoriesId",
                "AccessoriesGuid",
                "AccessoriesName",
                "BuildingId",
                "ProjectId")
            VALUES(
                C."WalkDoorId",
                RAW_TO_GUID(sys_guid()),
                'AccessoriesWalkdoor',
                 BuildingId,
                 ProjectId);
END LOOP;
END IF;
         IF TotalWindows = 0 THEN --OR GuiId IS null 
FOR C IN( SELECT
"WindowId"
FROM "Accesories_Windows"
WHERE "BuildingNumber"=BuildingId AND "IncludeFramedOpening" != 'N' AND  "ProjectId"=ProjectId AND NVL("IsDelete", 'N') = 'N')
LOOP
 INSERT INTO "MBSAccessoriesGuid"(
                "AccessoriesId",
                "AccessoriesGuid",
                "AccessoriesName",
                "BuildingId",
                "ProjectId")
            VALUES(
                C."WindowId",
                RAW_TO_GUID(sys_guid()),
                'AccessoriesWindows',
                 BuildingId,
                 ProjectId);
END LOOP;
END IF;
      IF TotalLouvers = 0 THEN --OR GuiId IS null 
FOR C IN( SELECT
"LouverId"
FROM "Accessories_Louvers"
WHERE "BuildingId"=BuildingId AND  "ProjectId"=ProjectId AND NVL("IsDelete", 'N') = 'N')
LOOP
 INSERT INTO "MBSAccessoriesGuid"(
                "AccessoriesId",
                "AccessoriesGuid",
                "AccessoriesName",
                "BuildingId",
                "ProjectId")
            VALUES(
                C."LouverId",
                RAW_TO_GUID(sys_guid()),
                'AccessoriesLouvers',
                 BuildingId,
                 ProjectId);
END LOOP;
END IF;
  IF TotalFramedOpening = 0 THEN --OR GuiId IS null 
FOR C IN( SELECT
"FramedOpeningId"
FROM "Accessories_FramedOpening"
WHERE "BuildingNumber"=BuildingId AND  "ProjectId"=ProjectId AND NVL("IsDelete", 'N') = 'N')
LOOP
 INSERT INTO "MBSAccessoriesGuid"(
                "AccessoriesId",
                "AccessoriesGuid",
                "AccessoriesName",
                "BuildingId",
                "ProjectId")
            VALUES(
                C."FramedOpeningId",
                RAW_TO_GUID(sys_guid()),
                'AccessoriesFramedOpening',
                 BuildingId,
                 ProjectId);
END LOOP;
END IF;
      IF TotalInsulation = 0 THEN --OR GuiId IS null 
FOR C IN( SELECT
"InsulationAccessoriesId"
FROM "InsulationAccessories"
WHERE "BuildingNumber"=BuildingId  AND NVL("IsDelete", 'N') = 'N')
LOOP
 INSERT INTO "MBSAccessoriesGuid"(
                "AccessoriesId",
                "AccessoriesGuid",
                "AccessoriesName",
                "BuildingId",
                "ProjectId")
            VALUES(
                C."InsulationAccessoriesId",
                RAW_TO_GUID(sys_guid()),
                'AccessoriesInsulation',
                 BuildingId,
                 ProjectId);
END LOOP;
END IF;
     IF TotalRubberPipeFlash = 0 THEN --OR GuiId IS null 
FOR C IN( SELECT
"RubberPipeFlashId"
FROM "Accessories_RubberPipeFlash"
WHERE "BuildingId"=BuildingId AND  "ProjectId"=ProjectId AND NVL("IsDelete", 'N') = 'N')
LOOP
 INSERT INTO "MBSAccessoriesGuid"(
                "AccessoriesId",
                "AccessoriesGuid",
                "AccessoriesName",
                "BuildingId",
                "ProjectId")
            VALUES(
                C."RubberPipeFlashId",
                RAW_TO_GUID(sys_guid()),
                'AccessoriesRubberPipeFlash',
                 BuildingId,
                 ProjectId);
END LOOP;
END IF;
END MBSACCESSORIESGUID_CREATE;
/