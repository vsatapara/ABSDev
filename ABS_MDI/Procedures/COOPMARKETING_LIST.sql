CREATE OR REPLACE PROCEDURE abs_mdi."COOPMARKETING_LIST" 
( Output_Data OUT SYS_REFCURSOR,
 Output_DataBrandAssets OUT SYS_REFCURSOR,
 Output_DataPhotos OUT SYS_REFCURSOR
) 
AS 
BEGIN
  OPEN Output_Data FOR 
      SELECT 
        "CoOpMarketingId",
    	 "BrandAssetsTitle",
        "BrandAssetsContent",
        "ProgramGuideLinesTitle",
         "ProgramGuideLinesContent",
        "RequestForApprovalTitle",
         "RequestForApprovalContent"
      FROM "CoOpMarketing";
      
      
   OPEN Output_DataBrandAssets FOR 
      SELECT 
      "BrandAssetsFile",
      "BrandAssetsDisplayName"
      FROM "BrandAssets";
      
    OPEN Output_DataPhotos FOR 
      SELECT 
      "PhotosFile",
      "PhotosDisplayName"
      FROM "Photos";
END COOPMARKETING_LIST;
/