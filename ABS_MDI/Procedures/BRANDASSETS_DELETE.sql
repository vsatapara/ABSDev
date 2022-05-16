CREATE OR REPLACE PROCEDURE abs_mdi."BRANDASSETS_DELETE" 
(
    BrandAssetsId IN VARCHAR2,
    UserId IN NUMBER
)
IS 
sqlStr VARCHAR(500);
BEGIN
      
sqlStr := 'UPDATE "BrandAssets" SET "IsDelete"=''Y'',"ModifiedBy"='|| UserId ||',"ModifiedDate"=CURRENT_TIMESTAMP WHERE "BrandAssetsId" IN (' ||BrandAssetsId || ')';
--DBMS_OUTPUT.PUT_LINE(sqlStr);
execute immediate sqlStr;      
     
END BRANDASSETS_DELETE;
/