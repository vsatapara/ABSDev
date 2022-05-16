CREATE OR REPLACE PROCEDURE abs_mdi."ROLEMASTER_LIST" (
    CompanyId IN NUMBER,
    Output_Data OUT SYS_REFCURSOR
) AS
BEGIN
    OPEN Output_Data FOR SELECT
                             "RoleId",
                             "RoleName",
                             "ParentId",
                             "IsActive",
                             "IsView",
                             "IsAdd",
                             "IsEdit",
                             "IsHistory",
                             "IsDelete"
                         FROM
                             "RoleMaster"
                         WHERE
                             "IsActive" = 'Y'
                         UNION ALL
                        
                        select * from ( SELECT
                             "MenuAdmin"."MenuAdminId"    AS "RoleId",
                             "MenuAdmin"."Name"           AS "RoleName",
                             CASE "MenuAdmin"."ParentId"
                                 WHEN 0 THEN
                                     56
                                 ELSE
                                     "MenuAdmin"."ParentId"
                             END                          AS "ParentId",
                             'Y'                          AS "IsActive",
                             'Y'                          AS "IsView",
                             'Y'                          AS "IsAdd",
                             'Y'                          AS "IsEdit",
                             'Y'                          AS "IsHistory",
                             'Y'                          AS "IsDelete"
                         FROM
                             "MenuAdmin"
                         WHERE
                                 "IsDelete" = 'N'
                             AND "CompanyId" = CompanyId order by "MenuAdmin"."SortOrder") t;
END ROLEMASTER_LIST;
/