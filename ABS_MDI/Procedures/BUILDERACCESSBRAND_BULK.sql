CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERACCESSBRAND_BULK" 
(
    Builder_Brand IN BuilderAccessBrand_Type
    
) AS 
BEGIN
    INSERT INTO "BuilderAccessBrands"
           ("BuilderAccessBrandId",
           "BuilderAccessPermissionId",
           "CompanyId",
           "IpAddress",
           "CreatedBy",
           "CreatedDate",
           "ModifiedBy",
           "ModifiedDate",
           "IsDelete")
    SELECT BuilderAccessBrandId,
           BuilderAccessPermissionId,
           CompanyId,
           IpAddress,
           CreatedBy,
           CreatedDate,
           ModifiedBy,
           ModifiedDate,
           IsDelete
    FROM TABLE(Builder_Brand);
END BuilderAccessBrand_Bulk;
/