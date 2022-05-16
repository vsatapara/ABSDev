CREATE OR REPLACE PROCEDURE abs_mdi."PERMISSIONGROUPFEATURESMATRIX_SELECT" 
(
    PermissionGroupId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
	OPEN Output_Data FOR
			SELECT
                "PermissionGroupFeaturesMatrixId",
				"PermissionGroupId",
				"FeatureId",
                "IsEnabled",
				"CreatedBy",
                "CreatedDate",
                "ModifiedBy",
                "ModifiedDate"
			FROM "PermissionGroupFeaturesMatrix"
			WHERE "PermissionGroupId" = PermissionGroupId;
END PERMISSIONGROUPFEATURESMATRIX_SELECT;
/