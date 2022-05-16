CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERACCESSPERMISSION_DELETE" 
(
BuilderAccessPermissionId IN NUMBER,
UserId IN NUMBER
)
AS 
BEGIN
  UPDATE "BuilderAccessPermission" SET
    "IsDelete"='Y', 
    "ModifiedBy"=UserId, 
    "ModifiedDate"=CURRENT_TIMESTAMP
  WHERE "BuilderAccessPermissionId"= BuilderAccessPermissionId;
END BUILDERACCESSPERMISSION_DELETE;
/