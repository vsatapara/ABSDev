CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERACCESSBRAND_UPDATE" 
(
BuilderAccessBrandId IN NUMBER,
BuilderAccessPermissionId IN NUMBER,
CompanyId IN NUMBER
)AS 
BEGIN
 UPDATE "BuilderAccessBrands" SET        
        "BuilderAccessPermissionId"=BuilderAccessPermissionId,
        "CompanyId"=CompanyId
    WHERE "BuilderAccessBrandId" = BuilderAccessBrandId;
END BUILDERACCESSBRAND_UPDATE;
/