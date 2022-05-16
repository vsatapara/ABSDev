CREATE OR REPLACE PROCEDURE abs_mdi."PERMISSIONGROUPFEATURESMATRIX_CREATE" 
(
	PermissionGroupId IN NUMBER,
	FeatureId IN NUMBER,
	IsEnabled IN CHAR,
	CreatedBy IN NUMBER,
    IpAddress IN VARCHAR2
)
AS
BEGIN
	UPDATE "PermissionGroupFeaturesMatrix" SET
		"PermissionGroupId" = PermissionGroupId,
		"FeatureId" = FeatureId,
		"IsEnabled" = IsEnabled,
        "ModifiedBy" = CreatedBy,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
	WHERE "PermissionGroupId" = PermissionGroupId AND "FeatureId" = FeatureId
    AND EXISTS (SELECT 1 FROM "PermissionGroupFeaturesMatrix" WHERE "PermissionGroupId" = PermissionGroupId AND "FeatureId" = FeatureId);
     INSERT INTO "PermissionGroupFeaturesMatrix"
     (
		"PermissionGroupId",
        "FeatureId",
		"IsEnabled",
        "CreatedBy",
        "CreatedDate",
        "IpAddress"
     )
	SELECT
		PermissionGroupId,
        FeatureId,
		IsEnabled,
        CreatedBy,
        CURRENT_TIMESTAMP,
        IpAddress
     FROM DUAL
     WHERE NOT EXISTS (SELECT 1 FROM "PermissionGroupFeaturesMatrix" WHERE "PermissionGroupId" = PermissionGroupId AND "FeatureId" = FeatureId);
END PERMISSIONGROUPFEATURESMATRIX_CREATE;
/