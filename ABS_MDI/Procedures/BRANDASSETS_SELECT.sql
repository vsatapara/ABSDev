CREATE OR REPLACE PROCEDURE abs_mdi."BRANDASSETS_SELECT" 
(
BrandAssetsId IN Number,
Output_Data OUT SYS_REFCURSOR
) 
AS 
BEGIN
OPEN Output_Data FOR 
      SELECT 
        "BrandAssetsId",
        "BrandAssetsFile",
        "BrandAssetsDisplayName",
        "IsDelete"
      FROM "BrandAssets" WHERE "BrandAssetsId"=BrandAssetsId;
END BRANDASSETS_SELECT;
/