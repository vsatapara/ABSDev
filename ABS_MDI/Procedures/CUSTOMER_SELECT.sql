CREATE OR REPLACE PROCEDURE abs_mdi."CUSTOMER_SELECT" 
(
   CustomerId IN NUMBER,
   UserDetailId IN NUMBER,
   Out_Data OUT SYS_REFCURSOR,   
   Permission_Data OUT SYS_REFCURSOR,
   BuilderAccess_Data OUT SYS_REFCURSOR   
)
is  
CompanyId number; 
BEGIN
   select "CompanyId" into CompanyId from "Customer" where "CustomerID" = CustomerId and "IsDelete" = 'N' and rownum=1;
   OPEN Out_Data FOR 
      SELECT 
        "CustomerID",
        "CustomerNo",
        "CustomerName",       
        "IsDefault" as "IsDefaultCustomer",
        "IsActive",
        "IsPrivateLabelBuilder",
        "EnforceSignatureRule",
        (select "UserId" from "USR_UserDetail" where "UserDetailId" = UserDetailId and "IsCustomerAdmin"='Y' and "IsDelete"='N' and rownum=1) as "UserId",
        (select "PermissionGroupId" FROM "USR_Brand_PermissionGroup"  where "BrandId"=CompanyId and "UserDetailId"=UserDetailId and rownum = 1) as PermissionId,
        (select "BuilderAccessPermissionId" FROM "USR_PER_BuilderAccess"  where "BrandId"=CompanyId and "UserDetailId"=UserDetailId and rownum = 1) as BuilderAccessId        
      FROM "Customer" C where  C."CustomerID" = CustomerId and C."IsDelete" = 'N';
            
    OPEN Permission_Data FOR     
        SELECT distinct
            P."PermissionId",
            "PermissionGrpName" as PermissionGroupName,
            "BrandId"
            --(select "IsEnable" FROM "USR_Brand_PermissionGroup"  where "PermissionGroupId"=P."PermissionId" and "BrandId"=PB."BrandId" and "UserDetailId"=UserDetailId and rownum = 1) as IsEnable
        FROM
            "Permission" P, "PermissionBrand" PB
        where P."PermissionId" = PB."PermissionId" and P."IsActive"='Y' and P."IsDelete"!='Y'and "BrandId"=CompanyId
        ORDER BY "BrandId",P."PermissionId" ASC; 
           
    OPEN BuilderAccess_Data FOR               
        SELECT distinct
                BAP."BuilderAccessPermissionId" AS BuilderAccessPermissionId,
                "GroupName" as BuilderAccessPermissionName,
                "PermissionId" as PermissionGroupId,
                --(select count(*) FROM "USR_PER_BuilderAccess"  
                --where "BuilderAccessPermissionId"=BAP."BuilderAccessPermissionId" and "PermissionGroupId"=PB."PermissionId" and "UserDetailId"=UserDetailId) as IsRecord,
                case "IsExternal" when 'Y' THEN CASE "IsInternal" when 'Y' then 'N' else 'Y' end 
                     else 'N'
                end as External
        FROM
            "BuilderAccessPermission" BAP,"PermissionBrand" PB
            WHERE BAP."BuilderAccessPermissionId" = PB."UserTypeId" and BAP."IsActive"='Y' and PB."BrandId"=CompanyId; 
      
END Customer_Select;
/