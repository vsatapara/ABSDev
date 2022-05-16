CREATE OR REPLACE PROCEDURE abs_mdi."PERMISSION_SELECT" 
(
    PermissionId IN NUMBER,
    CompanyId IN NUMBER,
    Output_Model OUT SYS_REFCURSOR,
    Output_PermissionTransactionList OUT SYS_REFCURSOR,
    Output_PermissionBrandList OUT SYS_REFCURSOR
)
AS 
--TotalCount number;
BEGIN
  OPEN Output_Model FOR 
    SELECT
        "PermissionId",
        "PermissionGrpName",
        "IsActive"
    FROM
        "Permission"
    WHERE "PermissionId"= PermissionId AND "IsDelete" != 'Y';
    --select count(*) into TotalCount from "PermissionTransaction" where "PermissionTransaction"."PermissionId"=PermissionId;
    /*if TotalCount > 1 then */
    begin
        OPEN Output_PermissionTransactionList FOR 
        SELECT
            "PermissionTransaction"."PermissionTransactionId",
            "PermissionTransaction"."PermissionId",
            "PermissionTransaction"."RoleId",
            "RoleMaster"."ParentId" as "ParentId",
            "RoleMaster"."RoleName" as "RoleName",
            "PermissionTransaction"."IsAdd",
            "PermissionTransaction"."IsEdit",
            "PermissionTransaction"."IsDelete",
            "PermissionTransaction"."IsView",
            "PermissionTransaction"."IsHistory",
            "PermissionTransaction"."IsActive"
        FROM "PermissionTransaction"
        INNER JOIN "RoleMaster" on "RoleMaster"."RoleId"="PermissionTransaction"."RoleId" 
        where "PermissionTransaction"."PermissionId"=PermissionId and "RoleMaster"."IsActive"='Y'
       union all
         SELECT
            NVL("PermissionTransaction"."PermissionTransactionId",0) "PermissionTransactionId",
            NVL("PermissionTransaction"."PermissionId",0) as "PermissionId",
            "MenuAdmin"."MenuAdminId" as "RoleId",
            case "MenuAdmin"."ParentId" when 0 then 56 else "MenuAdmin"."ParentId" end as "ParentId",
            "MenuAdmin"."Name" as "RoleName",
            NVL("PermissionTransaction"."IsAdd",'Y') as "IsAdd",
             NVL("PermissionTransaction"."IsEdit",'Y') as "IsEdit",
             NVL("PermissionTransaction"."IsDelete",'Y') as "IsDelete",
             NVL("PermissionTransaction"."IsView",'Y') as "IsView",
             NVL("PermissionTransaction"."IsHistory",'Y') as "IsHistory",
             NVL("PermissionTransaction"."IsActive",'Y') as "IsActive"
        FROM "MenuAdmin"
        left outer JOIN "PermissionTransaction" on "MenuAdmin"."MenuAdminId"="PermissionTransaction"."RoleId" 
        AND "PermissionTransaction"."PermissionId"=PermissionId
        where "CompanyId"=CompanyId;
    end;    
   /* ELSE
    begin
        OPEN Output_PermissionTransactionList FOR 
        SELECT
            0 as "PermissionTransactionId",
            0 as "PermissionId",
            "RoleMaster"."RoleId",
            "RoleMaster"."ParentId" as "ParentId",
            "RoleMaster"."RoleName" as "RoleName",
            'N' as "IsAdd",
            'N' as "IsEdit",
            'N' as "IsDelete",
            'N' as "IsView",
            'N' as "IsHistory",
            'Y' as "IsActive"
        FROM "RoleMaster" where "IsActive"='Y'
        union all
        SELECT
            0 as "PermissionTransactionId",
            0 as "PermissionId",
            "MenuAdmin"."MenuAdminId" as "RoleId",
            case "MenuAdmin"."ParentId" when 0 then 56 else "MenuAdmin"."ParentId" end as "ParentId",
            "MenuAdmin"."Name" as "RoleName",
            'N' as "IsAdd",
            'N' as "IsEdit",
            'N' as "IsDelete",
            'N' as "IsView",
            'N' as "IsHistory",
            'Y' as "IsActive"
        FROM
            "MenuAdmin" where "IsDelete"='N' and "CompanyId"=1;
    end;    
    END IF;*/
    OPEN Output_PermissionBrandList FOR 
     SELECT 
        (case "PermissionBrand"."BrandId" when "Company"."CompanyId" then "PermissionBrand"."PermissionBrandId" else 0 end) as PermissionBrandId,
        (case  when "PermissionBrand"."BrandId"="Company"."CompanyId" then "PermissionBrand"."PermissionId" else PermissionId end) as PermissionId, 
        (case "PermissionBrand"."BrandId" when "Company"."CompanyId" then "PermissionBrand"."BrandId" else "Company"."CompanyId" end) as BrandId,
        NVL("PermissionBrand"."UserTypeId","BuilderAccessPermission"."BuilderAccessPermissionId") as UserTypeId,
        (case "PermissionBrand"."BrandId" when "Company"."CompanyId" then  "PermissionBrand"."IsActive" else 'N' end) as IsActive,
        "BuilderAccessPermission"."GroupName",
        "BuilderAccessPermission"."PredefineTemplateId",
        "BuilderAccessPermission"."IsInternal",
        "BuilderAccessPermission"."IsExternal",
        "PermissionBrand"."UserType",
        "BuilderAccessPermission"."IsActive" as IsEnable
    FROM "BuilderAccessPermission"
    LEFT OUTER join "Company" on "Company"."IsDelete" != 'Y'
    LEFT OUTER JOIN "PermissionBrand" on "BuilderAccessPermission"."BuilderAccessPermissionId"="PermissionBrand"."UserTypeId" AND "PermissionBrand"."PermissionId"=PermissionId
    where "BuilderAccessPermission"."IsDelete" = 'N'
    order by (case when "PermissionBrand"."BrandId" = "Company"."CompanyId" then "PermissionBrand"."PermissionBrandId" else 0 end) desc;
END PERMISSION_SELECT;
/*create or replace PROCEDURE PERMISSION_SELECT
(
    PermissionId IN NUMBER,
    Output_Model OUT SYS_REFCURSOR,
    Output_PermissionTransactionList OUT SYS_REFCURSOR,
    Output_PermissionBrandList OUT SYS_REFCURSOR
)
AS 
BEGIN
  OPEN Output_Model FOR 
    SELECT
        "PermissionId",
        "PermissionGrpName",
        "IsActive"
    FROM
        "Permission"
    WHERE "PermissionId"= PermissionId AND "IsDelete" != 'Y';
    OPEN Output_PermissionTransactionList FOR 
    SELECT
        "PermissionTransaction"."PermissionTransactionId",
        "PermissionTransaction"."PermissionId",
        "PermissionTransaction"."RoleId",
        "RoleMaster"."ParentId" as "ParentId",
        "RoleMaster"."RoleName" as "RoleName",
        "PermissionTransaction"."IsAdd",
        "PermissionTransaction"."IsEdit",
        "PermissionTransaction"."IsDelete",
        "PermissionTransaction"."IsView",
        "PermissionTransaction"."IsHistory",
        "PermissionTransaction"."IsActive"
    FROM "PermissionTransaction"
    RIGHT OUTER JOIN "RoleMaster" on "RoleMaster"."RoleId"="PermissionTransaction"."RoleId" 
WHERE "PermissionTransaction"."PermissionId"=PermissionId;
    OPEN Output_PermissionBrandList FOR 
    SELECT
        "PermissionBrand"."PermissionBrandId",
        "PermissionBrand"."PermissionId",
        "PermissionBrand"."BrandId",
        "PermissionBrand"."UserTypeId",
        "PermissionBrand"."IsActive",
        "BuilderAccessPermission"."GroupName",
        "BuilderAccessPermission"."PredefineTemplateId",
        "BuilderAccessPermission"."IsInternal",
        "BuilderAccessPermission"."IsExternal"
    FROM "PermissionBrand"
    RIGHT OUTER JOIN  "BuilderAccessPermission" on "BuilderAccessPermission"."BuilderAccessPermissionId"="PermissionBrand"."UserTypeId"
    WHERE "PermissionBrand"."PermissionId"=PermissionId;
END PERMISSION_SELECT;*/
/