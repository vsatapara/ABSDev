CREATE OR REPLACE PROCEDURE abs_mdi."DELETERECORD" 
(
  TableName IN VARCHAR2,
  TargetColumnId IN VARCHAR2, 
  RecordId IN NUMBER,
  UserId IN NUMBER,
  IpAddress IN VARCHAR2
)
IS 
str1  VARCHAR2(2000);
str  VARCHAR2(2000);
buildingSeq VARCHAR2(1);
projectId NUMBER(10,0);
BEGIN
    IF ( LOWER(TableName) = 'openareas') THEN
        str1 :='
        UPDATE "'||TableName||'" 
        SET "IsDeleted"=''Y'',
        "ModifiedBy"='||UserId||',
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"='''||IpAddress||'''
        WHERE "'||TargetColumnId||'"='||RecordId;
        execute immediate str1 ;
    ELSIF ( LOWER(TableName) = 'buildinginformation') THEN
        select "ProjectId"  INTO  projectId from "BuildingInformation" where "BuildingInformationId" = RecordId;
        select "BuildingLabel"  INTO  buildingSeq from "BuildingInformation" where "BuildingInformationId" = RecordId;
        UPDATE "BuildingInformation"
        SET "IsDelete"= 'Y' WHERE "BuildingInformationId"=RecordId;
    -----
        UPDATE "BuildingInformation"
        SET "IsDelete" = 'Y'
        WHERE "ParentBuildingId" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "BuildingInformationId" = RecordId);

        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        execute immediate 'truncate table "BuildingInformation_Temporary2" drop storage';
        INSERT INTO "BuildingInformation_Temporary1"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG(ascii("BuildingLabel") ) OVER (ORDER BY ascii("BuildingLabel") ) + 1 , 65))AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG(ascii("BuildingLabel") ) OVER (ORDER BY ascii("BuildingLabel") ) + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation"
        WHERE "IsDelete" = 'N' AND "ProjectId"= projectId;
        INSERT INTO "BuildingInformation_Temporary2"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary1";
        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        INSERT INTO "BuildingInformation_Temporary1"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary2";
        execute immediate 'truncate table "BuildingInformation_Temporary2" drop storage';
        INSERT INTO "BuildingInformation_Temporary2"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary1";
        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        INSERT INTO "BuildingInformation_Temporary1"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary2";
        execute immediate 'truncate table "BuildingInformation_Temporary2" drop storage';
        INSERT INTO "BuildingInformation_Temporary2"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary1";
        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        INSERT INTO "BuildingInformation_Temporary1"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary2";
        execute immediate 'truncate table "BuildingInformation_Temporary2" drop storage';
        INSERT INTO "BuildingInformation_Temporary2"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary1";
        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        INSERT INTO "BuildingInformation_Temporary1"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary2";
        execute immediate 'truncate table "BuildingInformation_Temporary2" drop storage';
        INSERT INTO "BuildingInformation_Temporary2"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary1";
        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        INSERT INTO "BuildingInformation_Temporary1"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary2";
        execute immediate 'truncate table "BuildingInformation_Temporary2" drop storage';
        INSERT INTO "BuildingInformation_Temporary2"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary1";
        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        INSERT INTO "BuildingInformation_Temporary1"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary2";
        execute immediate 'truncate table "BuildingInformation_Temporary2" drop storage';
        INSERT INTO "BuildingInformation_Temporary2"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary1";
        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        INSERT INTO "BuildingInformation_Temporary1"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary2";
        execute immediate 'truncate table "BuildingInformation_Temporary2" drop storage';
        INSERT INTO "BuildingInformation_Temporary2"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary1";
        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        INSERT INTO "BuildingInformation_Temporary1"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary2";
        execute immediate 'truncate table "BuildingInformation_Temporary2" drop storage';
        INSERT INTO "BuildingInformation_Temporary2"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary1";
        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        INSERT INTO "BuildingInformation_Temporary1"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary2";
        execute immediate 'truncate table "BuildingInformation_Temporary2" drop storage';
        INSERT INTO "BuildingInformation_Temporary2"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary1";
        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        INSERT INTO "BuildingInformation_Temporary1"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary2";
        execute immediate 'truncate table "BuildingInformation_Temporary2" drop storage';
        INSERT INTO "BuildingInformation_Temporary2"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary1";
        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        INSERT INTO "BuildingInformation_Temporary1"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary2";
        execute immediate 'truncate table "BuildingInformation_Temporary2" drop storage';
        INSERT INTO "BuildingInformation_Temporary2"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary1";
        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        INSERT INTO "BuildingInformation_Temporary1"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary2";
        execute immediate 'truncate table "BuildingInformation_Temporary2" drop storage';
        INSERT INTO "BuildingInformation_Temporary2"
        SELECT "BuildingInformationId", CAST(chr( ascii("BuildingLabel") )AS VARCHAR2(1)) AS BuildingLabel, ascii("BuildingLabel") AS BuildingLabelNumber,
        CAST(chr( NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) )AS VARCHAR2(1)) AS NewBuildingLabel, NVL(LAG("NewBuildingLabelNumber") OVER (ORDER BY "NewBuildingLabelNumber") + 1 , 65) AS NewBuildingLabelNumber
        ,"ProjectId"
        FROM "BuildingInformation_Temporary1";
        execute immediate 'truncate table "BuildingInformation_Temporary1" drop storage';
        UPDATE "BuildingInformation" t
        SET t."BuildingLabel" = (SELECT t2."NewBuildingLabel" FROM "BuildingInformation_Temporary2" t2 WHERE t2."BuildingInformationId" = t."BuildingInformationId")
        WHERE t."IsDelete" = 'N' AND "ProjectId" = projectId;


        UPDATE "Accesories_Windows"
        SET "IsDelete" = 'Y'
        WHERE "BuildingNumber" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accessories_WalkDoors"
        SET "IsDelete" = 'Y'
        WHERE "BuildingId" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accesories_TopMountedSlideDoor"
        SET "IsDelete" = 'Y'
        WHERE "BuildingNumber" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accessories_DBCIDoor"
        SET "IsDelete" = 'Y'
        WHERE "BuildingId" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accesories_Partition"
        SET "IsDelete" = 'Y'
        WHERE "BuildingNumber" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "OpenAreas"
        SET "IsDeleted" = 'Y'
        WHERE "BuildingNumber" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accessories_Canopy"
        SET "IsDelete" = 'Y'
        WHERE "BuildingNumber" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accessories_Liners"
        SET "IsDelete" = 'Y'
        WHERE "BuildingNumber" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accesories_WallLTP"
        SET "IsDelete" = 'Y'
        WHERE "BuildingInformationId" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accesories_PurlinExtensions"
        SET "IsDelete" = 'Y'
        WHERE "BuildingNumber" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accesories_RoofLTP"
        SET "IsDelete" = 'Y'
        WHERE "BuildingNumber" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accessories_RubberPipeFlash"
        SET "IsDelete" = 'Y'
        WHERE "BuildingId" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accessories_Vents"
        SET "IsDelete" = 'Y'
        WHERE "BuildingId" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accessories_Louvers"
        SET "IsDelete" = 'Y'
        WHERE "BuildingId" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accessories_FramedOpening"
        SET "IsDelete" = 'Y'
        WHERE "BuildingNumber" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accessories_Facade"
        SET "IsDelete" = 'Y'
        WHERE "BuildingInformationId" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accessories_Parapet"
        SET "IsDelete" = 'Y'
        WHERE "BuildingInformationId" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accessories_Valleygutters"
        SET "IsDelete" = 'Y'
        WHERE "BuildingInformationId" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        UPDATE "Accesories_Wainscot"
        SET "IsDelete" = 'Y'
        WHERE "BuildingInformationId" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        
        UPDATE "Accessories_Cranes"
        SET "IsDelete" = 'Y'
        WHERE "BuildingId" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        
        UPDATE "Input_AddLines"
        SET "IsDelete" = 'Y'
        WHERE "BuildingInformationId" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');
        
         UPDATE "EDSPrice_IO_Mezzanines"
        SET "IsDelete" = 'Y'
        WHERE "BuildingNumber" IN (SELECT "BuildingInformationId" FROM "BuildingInformation" WHERE "IsDelete" = 'Y');

    -----
        /*UPDATE "BuildingInformation"
        SET "BuildingLabel"=
        CASE
            WHEN ascii("BuildingLabel") > ascii(buildingSeq)
            THEN (select CAST(chr( ascii("BuildingLabel")+level-2 )AS VARCHAR2(1)) from dual connect by level <= 1)
            ELSE "BuildingLabel"
            END
        WHERE NVL("IsDelete",'N')='N' AND "ProjectId"=projectId;*/
    ELSE
        str :='
        UPDATE "'||TableName||'" 
        SET "IsDelete"=''Y'',
        "ModifiedBy"='||UserId||',
        "ModifiedDate"=CURRENT_TIMESTAMP,
        "IpAddress"='''||IpAddress||'''
        WHERE "'||TargetColumnId||'"='||RecordId;
        --dbms_output.put_line(str);
        execute immediate str ;
    END IF;
END DeleteRecord;
/