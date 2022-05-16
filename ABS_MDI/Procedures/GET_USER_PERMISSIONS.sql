CREATE OR REPLACE PROCEDURE abs_mdi."GET_USER_PERMISSIONS" (
    UserId       IN   VARCHAR2,
    CompanyId    IN   NUMBER,
    RoleId       IN   NUMBER default 0,
    Output_Data  OUT  SYS_REFCURSOR
)
AS
--UserDetailId number;
--BrandId number;
--PermissionGroupId number;
BEGIN
    IF CompanyId != 0 and RoleId != 0 then
    begin
    OPEN Output_Data FOR SELECT
                             PT."RoleId",
                             CASE
                                 WHEN PT."RoleId" > 500 THEN
                                     MA."Name"
                                 ELSE
                                     RM."RoleName"
                             END  "RoleName",
                             CASE
                                 WHEN PT."RoleId" > 500 THEN
                                     MA."ParentId"
                                 ELSE
                                     (
                                         SELECT
                                             CASE
                                                 WHEN "ParentId" = 0 THEN
                                                     "RoleId"
                                                 ELSE
                                                     "ParentId"
                                             END
                                         FROM
                                             "RoleMaster"
                                         WHERE
                                             "RoleId" = RM."ParentId"
                                     )
                             END  AS "ParentId",
                             PT."IsAdd",
                             PT."IsEdit",
                             PT."IsDelete",
                             PT."IsView",
                             PT."IsHistory",
                             PT."IsActive"
                         FROM
                             "USR_PER_BuilderAccess"  BA
                             LEFT JOIN "PermissionTransaction"  PT ON PT."PermissionId" = BA."PermissionGroupId"
                             LEFT JOIN "RoleMaster"             RM ON RM."RoleId" = PT."RoleId"
                             LEFT JOIN "USR_UserDetail"         UD ON UD."UserDetailId" = BA."UserDetailId"
                             LEFT JOIN "MenuAdmin"              MA ON PT."RoleId" = MA."MenuAdminId"
                                                         AND MA."CompanyId" = BA."BrandId"
                         WHERE
                                 UD."UserId" = UserId and UD."IsDelete"='N'
                             AND BA."BrandId" = CompanyId
                             AND PT."PermissionId" = RoleId;
    end;
    else
    begin
    
        --select "UserDetailId" into UserDetailId from "USR_UserDetail" where "UserId" = UserId and rownum=1 and "IsDelete"='N';
        
       --select "BrandId","PermissionGroupId" into BrandId,PermissionGroupId from "USR_Brand_PermissionGroup" where "UserDetailId" = UserDetailId and rownum=1;
    
        OPEN Output_Data FOR SELECT
                             PT."RoleId",
                             CASE
                                 WHEN PT."RoleId" > 500 THEN
                                     MA."Name"
                                 ELSE
                                     RM."RoleName"
                             END  "RoleName",
                             CASE
                                 WHEN PT."RoleId" > 500 THEN
                                     MA."ParentId"
                                 ELSE
                                     (
                                         SELECT
                                             CASE
                                                 WHEN "ParentId" = 0 THEN
                                                     "RoleId"
                                                 ELSE
                                                     "ParentId"
                                             END
                                         FROM
                                             "RoleMaster"
                                         WHERE
                                             "RoleId" = RM."ParentId"
                                     )
                             END  AS "ParentId",
                             PT."IsAdd",
                             PT."IsEdit",
                             PT."IsDelete",
                             PT."IsView",
                             PT."IsHistory",
                             PT."IsActive"
                         FROM
                             "USR_PER_BuilderAccess"  BA
                             LEFT JOIN "PermissionTransaction"  PT ON PT."PermissionId" = BA."PermissionGroupId"
                             LEFT JOIN "RoleMaster"             RM ON RM."RoleId" = PT."RoleId"
                             LEFT JOIN "USR_UserDetail"         UD ON UD."UserDetailId" = BA."UserDetailId"
                             LEFT JOIN "MenuAdmin"              MA ON PT."RoleId" = MA."MenuAdminId"
                                                         AND MA."CompanyId" = BA."BrandId"
                         WHERE
                                 UD."UserId" = UserId and UD."IsDelete"='N';
                             -- AND BA."BrandId" = BrandId
                             -- AND PT."PermissionId" = PermissionGroupId;
    
    end;
    end if;
END GET_USER_PERMISSIONS;
/