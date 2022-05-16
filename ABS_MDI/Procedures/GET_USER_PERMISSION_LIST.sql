CREATE OR REPLACE PROCEDURE abs_mdi."GET_USER_PERMISSION_LIST" (
    UserId       IN   VARCHAR2,
    CompanyId    IN   NUMBER,
    Output_Data  OUT  SYS_REFCURSOR
) AS
BEGIN
    OPEN Output_Data FOR SELECT
                             BA."PermissionGroupId",
                             P."PermissionGrpName",
                             (
                                 SELECT
                                     CASE
                                         WHEN bap."ProjectBuildingType" = 1    THEN
                                             'Express'
                                         WHEN bap."ProjectBuildingType" = 2    THEN
                                             'Standard'
                                         ELSE
                                             ''
                                     END
                                 FROM
                                          "BuilderAccessPermission" bap
                                     INNER JOIN "USR_PER_BuilderAccess" ub ON ub."BuilderAccessPermissionId" = bap."BuilderAccessPermissionId"
                                                                              AND ub."BrandId" = BA."BrandId"
                                                                              AND ub."PermissionGroupId" = BA."PermissionGroupId"
                                                                              AND ub."UserDetailId" = BA."UserDetailId"
                                 WHERE
                                     ROWNUM = 1
                             )    AS "ProjectBuildingType",
                             CASE
                                 WHEN UD."CustomerNo" = 0 THEN
                                     'Internal'
                                 ELSE
                                     'External'
                             END  AS "UserType"
                         FROM
                                  "USR_Brand_PermissionGroup" BA
                             INNER JOIN "USR_UserDetail"  UD ON UD."UserDetailId" = BA."UserDetailId"
                             INNER JOIN "Permission"      P ON P."PermissionId" = BA."PermissionGroupId"
                         WHERE
                                 UD."UserId" = UserId
                             AND BA."BrandId" = CompanyId;
END GET_USER_PERMISSION_LIST;
/