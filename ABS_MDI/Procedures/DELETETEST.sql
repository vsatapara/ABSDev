CREATE OR REPLACE PROCEDURE abs_mdi."DELETETEST" 
(
  --TableName IN VARCHAR2,
  --TargetColumnId IN VARCHAR2, 
  RecordId IN NUMBER,
  OUTPUT_TABLE OUT  SYS_REFCURSOR
  --UserId IN NUMBER,
  --IpAddress IN VARCHAR2
)
IS 
--str1  VARCHAR2(2000);
--str  VARCHAR2(2000);
--buildingSeq VARCHAR2(1);
--projectId NUMBER(10,0);
BEGIN
        UPDATE "BuildingInformation_Copy"
        SET "IsDelete"= 'Y' WHERE "BuildingInformationId"=RecordId;
        OPEN OUTPUT_TABLE FOR
        SELECT "BuildingInformationId", "BuildingLabel", "ParentBuildingId", "IsDelete" FROM "BuildingInformation_Copy" WHERE "IsDelete" = 'N';
        truncate table "BuildingInformation_Temporary1" drop storage;
        
END DeleteTest;
/