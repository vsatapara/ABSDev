CREATE OR REPLACE PROCEDURE abs_mdi."PHOTOS_DELETE" 
(
    PhotosId IN VARCHAR2,
    UserId IN NUMBER
)
IS 
sqlStr VARCHAR(500);
BEGIN
      
sqlStr := 'UPDATE "Photos" SET "IsDelete"=''Y'',"ModifiedBy"='|| UserId ||',"ModifiedDate"=CURRENT_TIMESTAMP WHERE "PhotosId" IN (' ||PhotosId || ')';
--DBMS_OUTPUT.PUT_LINE(sqlStr);
execute immediate sqlStr;    
      
END PHOTOS_DELETE;
/