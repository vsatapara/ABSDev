CREATE OR REPLACE PROCEDURE abs_mdi."PERMISSIONGROUP_SELECT" 
(
    PermissionGroupId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
    IF PermissionGroupId > 0 THEN
		OPEN Output_Data FOR
			SELECT
				"PermissionGroupId",
                "PermissionGroupName",
                "IsActive",
                "CreatedBy",
                "CreatedDate",
                "ModifiedBy",
                "ModifiedDate"
			  FROM "PermissionGroup"
			  WHERE "PermissionGroupId" = PermissionGroupId;
	ELSE
		OPEN Output_Data FOR
			SELECT
				"PermissionGroupId",
                "PermissionGroupName",
                "IsActive",
                "CreatedBy",
                "CreatedDate",
                "ModifiedBy",
                "ModifiedDate"
			  FROM "PermissionGroup";
    END IF;
END PERMISSIONGROUP_SELECT;
/