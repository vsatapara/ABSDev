CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERACCESSBRAND_LIST" 
(
Output_Data OUT SYS_REFCURSOR
) AS 
BEGIN
 OPEN Output_Data FOR 
  SELECT
    "BuilderAccessBrandId",
    "BuilderAccessPermissionId",
    "CompanyId"
FROM
    "BuilderAccessBrands";
END BuilderAccessBrand_List;
/