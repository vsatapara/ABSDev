CREATE OR REPLACE PROCEDURE abs_mdi."PHOTOS_LIST" 
( Output_Data OUT SYS_REFCURSOR) 
AS
BEGIN
  OPEN Output_Data FOR 
      SELECT 
        "PhotosId",
       "PhotosFile",
        "PhotosDisplayName",
        "IsDelete"
      FROM "Photos" WHERE "IsDelete"='N';
END PHOTOS_LIST;
/