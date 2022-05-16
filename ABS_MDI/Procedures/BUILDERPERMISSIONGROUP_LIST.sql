CREATE OR REPLACE PROCEDURE abs_mdi."BUILDERPERMISSIONGROUP_LIST" (
    UserDetailId in Number,
    Company_Data OUT SYS_REFCURSOR,
    Permission_Data OUT SYS_REFCURSOR,
    BuilderAccess_Data OUT SYS_REFCURSOR
)
AS 
BEGIN
        OPEN Company_Data FOR 
        SELECT
            "CompanyId",
            "CompanyName",
            C."IsActive" as IsActive,
            (select "IsEnable" FROM "USR_Brand_PermissionGroup"  where "BrandId"=C."CompanyId" and "UserDetailId"=UserDetailId and rownum = 1) as IsEnable
        FROM
            "Company" C
        WHERE "IsDelete"='N'
        ORDER BY "CompanyId" ASC; 
        
        OPEN Permission_Data FOR     
        SELECT distinct
            P."PermissionId",
            "PermissionGrpName" as PermissionGroupName,
            P."IsActive" as IsActive,
            "BrandId",
            (select "IsEnable" FROM "USR_Brand_PermissionGroup"  where "PermissionGroupId"=P."PermissionId" and "BrandId"=PB."BrandId" and "UserDetailId"=UserDetailId and rownum = 1) as IsEnable
        FROM
            "Permission" P, "PermissionBrand" PB
        where P."PermissionId" = PB."PermissionId" and P."IsDelete"='N'
        ORDER BY "BrandId",P."PermissionId" ASC; 
           
        OPEN BuilderAccess_Data FOR               
        SELECT distinct
                BAP."BuilderAccessPermissionId" AS BuilderAccessPermissionId,
                "GroupName" as BuilderAccessPermissionName,
                "PermissionId" as PermissionGroupId,
                BAP."IsActive" as IsActive,
                (select count(*) FROM "USR_PER_BuilderAccess"  
                where "BuilderAccessPermissionId"=BAP."BuilderAccessPermissionId" and "PermissionGroupId"=PB."PermissionId" and "UserDetailId"=UserDetailId) as IsRecord,
                case "IsExternal" when 'Y' THEN CASE "IsInternal" when 'Y' then 'N' else 'Y' end 
                     else 'N'
                end as External
        FROM
            "BuilderAccessPermission" BAP,"PermissionBrand" PB
            WHERE BAP."BuilderAccessPermissionId" = PB."UserTypeId" and BAP."IsDelete"='N'; 
END BUILDERPERMISSIONGROUP_LIST;
/