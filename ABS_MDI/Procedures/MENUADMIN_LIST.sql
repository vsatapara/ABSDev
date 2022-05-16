CREATE OR REPLACE PROCEDURE abs_mdi."MENUADMIN_LIST" (
    CompanyId    IN   NUMBER,
    UserId       IN   VARCHAR2 DEFAULT '',
    RoleId       IN   NUMBER default 0,
    Output_Data  OUT  SYS_REFCURSOR
) IS
    TotalCount NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO TotalCount
    FROM
             "USR_PER_BuilderAccess" BA
        JOIN "PermissionTransaction"  PT ON PT."PermissionId" = BA."PermissionGroupId"
        JOIN "USR_UserDetail"         UD ON UD."UserDetailId" = BA."UserDetailId"
        JOIN "MenuAdmin"              M ON PT."RoleId" = M."MenuAdminId"
                              AND M."CompanyId" = BA."BrandId"
    WHERE
            M."CompanyId" = CompanyId
        AND M."IsDelete" = 'N'
        AND UD."UserId" = UserId;
    IF UserId = '' OR UserId IS NULL OR TotalCount = 0 THEN
        OPEN Output_Data FOR SELECT
                                 "MenuAdminId",
                                 "AllowChildren",
                                 "Content",
                                 "ImageVideoId",
                                 A."AttachmentName"    AS ImageVideoName,
                                 A."AttachmentPath"    AS ImageVideoPath,
                                 "IsActive",
                                 "IsEditable",
                                 "IsInherited",
                                 "IsMovable",
                                 "IsPartiallyLoaded",
                                 "Name",
                                 "Type",
                                 "Url",
                                 "IsGroup",
                                 "IsHttp",
                                 "IsRouterPath",
                                 "ParentId",
                                 "CompanyId",
                                 "IsMobile",
                                 "IsGear",
                                 "IsDefault",
                                 "HasEmbededVideo",
                                 "SortOrder",
                                 "ADMINID"
                             FROM
                                 "MenuAdmin"   M
                                 LEFT JOIN "Attachment"  A ON A."AttachmentId" = M."ImageVideoId"
                             WHERE
                                     M."CompanyId" = CompanyId
                                 AND M."IsDelete" = 'N'
                             ORDER BY
                                 "SortOrder" ASC;
    ELSE
        OPEN Output_Data FOR WITH cte (
                                 "MenuAdminId",
                                 "ParentId"
                             ) AS (
                                 SELECT
                                     "MenuAdminId",
                                     "ParentId"
                                 FROM
                                          "USR_PER_BuilderAccess" BA
                                     JOIN "PermissionTransaction"  PT ON PT."PermissionId" = BA."PermissionGroupId"
                                     JOIN "USR_UserDetail"         UD ON UD."UserDetailId" = BA."UserDetailId"
                                     JOIN "MenuAdmin"              M ON PT."RoleId" = M."MenuAdminId"
                                                           AND M."CompanyId" = BA."BrandId"
                                 WHERE
                                         M."CompanyId" = CompanyId
                                     AND M."IsDelete" = 'N'
                                     AND UD."UserId" = UserId
                                     AND PT."PermissionId" = RoleId
                                 UNION ALL
                                 SELECT
                                     M."MenuAdminId",
                                     M."ParentId"
                                 FROM
                                          "MenuAdmin" M
                                     JOIN cte ON cte."ParentId" = M."MenuAdminId"
                                 WHERE
                                         M."CompanyId" = CompanyId
                                     AND M."IsDelete" = 'N'
                             )
                             SELECT
                                 M."MenuAdminId",
                                 M."AllowChildren",
                                 M."Content",
                                 M."ImageVideoId",
                                 A."AttachmentName"    AS ImageVideoName,
                                 A."AttachmentPath"    AS ImageVideoPath,
                                 M."IsActive",
                                 M."IsEditable",
                                 M."IsInherited",
                                 M."IsMovable",
                                 M."IsPartiallyLoaded",
                                 M."Name",
                                 M."Type",
                                 M."Url",
                                 M."IsGroup",
                                 M."IsHttp",
                                 M."IsRouterPath",
                                 M."ParentId",
                                 M."CompanyId",
                                 M."IsMobile",
                                 M."IsGear",
                                 M."IsDefault",
                                 M."HasEmbededVideo",
                                 M."SortOrder",
                                 M."ADMINID"
                             FROM
                                 "MenuAdmin"   M
                                 LEFT JOIN "Attachment"  A ON A."AttachmentId" = M."ImageVideoId"
                             WHERE
                                     M."CompanyId" = CompanyId
                                 AND M."IsDelete" = 'N'
                                 AND M."MenuAdminId" IN (
                                     SELECT
                                         "MenuAdminId"
                                     FROM
                                         cte
                                 )
                             ORDER BY
                                 "SortOrder" ASC;
    END IF;
END MenuAdmin_List;
/