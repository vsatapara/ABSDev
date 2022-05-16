CREATE OR REPLACE PROCEDURE abs_mdi."BRANDASSETS_LIST" 
( Output_Data OUT SYS_REFCURSOR) 
AS 
BEGIN
  OPEN Output_Data FOR 
      SELECT 
        "BrandAssetsId",
        "BrandAssetsFile",
        "BrandAssetsDisplayName",
        "IsDelete"
      FROM "BrandAssets" WHERE "IsDelete"='N';
END BRANDASSETS_LIST;
/