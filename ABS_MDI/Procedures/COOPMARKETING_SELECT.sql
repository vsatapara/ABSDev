CREATE OR REPLACE PROCEDURE abs_mdi."COOPMARKETING_SELECT" 
(
 CoOpMarketingId IN NUMBER,
 Output_Data OUT SYS_REFCURSOR,
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
         "RequestForApprovalContent",
         "CompanyID"
      FROM "CoOpMarketing" WHERE "CompanyID"=CoOpMarketingId;
      
       OPEN Output_DataBrandAssets FOR 
      SELECT 
      "BrandAssetsId",
      "BrandAssetsFile",
      "BrandAssetsDisplayName",
      AT."AttachmentName",
      AT."AttachmentPath"
      FROM "BrandAssets" 
      LEFT OUTER JOIN "Attachment" AT ON "BrandAssets"."BrandAssetsFile" = AT."AttachmentId"
      WHERE "BrandAssets"."IsDelete"='N' and "CompanyID" = CoOpMarketingId;
      
    OPEN Output_DataPhotos FOR 
      SELECT 
      "PhotosId",
      "PhotosFile",
      "PhotosDisplayName",
      AT."AttachmentName",
      AT."AttachmentPath"      
      FROM "Photos" 
      LEFT OUTER JOIN "Attachment" AT ON "Photos"."PhotosFile" = AT."AttachmentId"
      WHERE "Photos"."IsDelete"='N' and "CompanyID" = CoOpMarketingId;
END COOPMARKETING_SELECT;
/