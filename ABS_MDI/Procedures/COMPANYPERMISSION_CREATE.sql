CREATE OR REPLACE PROCEDURE abs_mdi."COMPANYPERMISSION_CREATE" 
(
	PermissionGroupId IN NUMBER,
    CompanyId IN NUMBER,
	UserId IN NUMBER,
    IpAddress IN VARCHAR2
)
AS
BEGIN
	UPDATE "CompanyPermission" SET
			"IsActive" = 'N',
			"ModifiedBy" = UserId,
			"ModifiedDate" = CURRENT_TIMESTAMP, 
            "IpAddress" = IpAddress
	WHERE "CompanyId" = CompanyId
    AND EXISTS (SELECT 1 FROM "CompanyPermission" WHERE "CompanyId" = CompanyId AND "PermissionGroupId" != PermissionGroupId AND "IsActive" = 'Y');
	INSERT INTO "CompanyPermission"
		 (
			"PermissionGroupId",
			"CompanyId",
			"IsActive",
			"CreatedBy",
			"CreatedDate",
            "IpAddress"
		 )
		 SELECT
			PermissionGroupId,
			CompanyId,
			'Y',
			UserId,
			CURRENT_TIMESTAMP, 
            IpAddress
		 FROM DUAL
         WHERE NOT EXISTS (SELECT 1 FROM "CompanyPermission" WHERE "CompanyId" = CompanyId AND "PermissionGroupId" = PermissionGroupId AND "IsActive" = 'Y');	
END COMPANYPERMISSION_CREATE;
/