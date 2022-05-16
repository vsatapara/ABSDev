CREATE OR REPLACE PROCEDURE abs_mdi."COMPANYPERMISSION_SELECT" 
(
    CompanyId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
)
AS
BEGIN
    IF CompanyId > 0 THEN
		 OPEN Output_Data FOR
				SELECT
					"PermissionGroupId",
					"CompanyId",
					"CreatedBy",
					"CreatedDate",
					"ModifiedBy",
					"ModifiedDate"
				  FROM "CompanyPermission" 
				  WHERE "CompanyId" = CompanyId;
	ELSE
		OPEN Output_Data FOR
				SELECT
					"PermissionGroupId",
					"CompanyId",
					"CreatedBy",
					"CreatedDate",
					"ModifiedBy",
					"ModifiedDate"
				  FROM "CompanyPermission" 
				  WHERE "CompanyId" = CompanyId;
    END IF;
END COMPANYPERMISSION_SELECT;
/