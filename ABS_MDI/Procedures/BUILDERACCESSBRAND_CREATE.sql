CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERACCESSBRAND_CREATE" 
(
BuilderAccessBrandId IN NUMBER,
BuilderAccessPermissionId IN NUMBER,
CompanyId IN NUMBER
)
AS 
BEGIN
  INSERT INTO "BuilderAccessBrands"
     (
     "BuilderAccessPermissionId",
     "CompanyId"
     )
     VALUES
     (
        BuilderAccessPermissionId,
        CompanyId       
     );
END BUILDERACCESSBRAND_CREATE;
/