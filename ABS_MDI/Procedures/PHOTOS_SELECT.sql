CREATE OR REPLACE PROCEDURE abs_mdi."PHOTOS_SELECT" 
( 
PhotosId IN Number,
Output_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Data FOR 
      SELECT 
        "PhotosId",
       "PhotosFile",
        "PhotosDisplayName",
        "IsDelete"
      FROM "Photos" WHERE "PhotosId"=PhotosId;
END PHOTOS_SELECT;
/