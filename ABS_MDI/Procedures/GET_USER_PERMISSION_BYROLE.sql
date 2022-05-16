CREATE OR REPLACE PROCEDURE abs_mdi."GET_USER_PERMISSION_BYROLE" 
(
    USERID IN VARCHAR2 ,
    COMPANYID IN VARCHAR2, 
    ROLEID IN NUMBER ,
    Output_Data  OUT  SYS_REFCURSOR
) AS 
BEGIN
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
                                 UD."UserId" = UserId
                             AND BA."BrandId" = CompanyId
                             AND RoleID = 0 OR PT."RoleId" = RoleID;
END GET_USER_PERMISSION_BYROLE;
/