CREATE OR REPLACE PROCEDURE abs_mdi."BUILDINGINFORMATIONPROJECT_LIST" (
    UserId        IN   VARCHAR2,
    CompanyId     IN   NUMBER,
    ProjectStage  IN   VARCHAR2 DEFAULT NULL,
    Output_Data   OUT  SYS_REFCURSOR
) AS
    UserDetailId     NUMBER;
    TotalCount       NUMBER;
    ModuleName       VARCHAR2(10);
    CustomerNo       NUMBER;
    IsCustomerAdmin  CHAR;
    PermissionCount  NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO TotalCount
    FROM
        "USR_UserDetail"
    WHERE
            "UserId" = UserId
        AND "IsDelete" = 'N';
    IF TotalCount != 0 THEN
        BEGIN
            SELECT
                "UserDetailId",
                "ModuleName",
                NVL("CustomerNo", 0),
                "IsCustomerAdmin"
            INTO
                UserDetailId,
                ModuleName,
                CustomerNo,
                IsCustomerAdmin
            FROM
                "USR_UserDetail"
            WHERE
                    "UserId" = UserId
                AND ROWNUM = 1
                AND "IsDelete" = 'N';
            IF CustomerNo != 0 THEN
                BEGIN
                    IF IsCustomerAdmin = 'Y' THEN
                        BEGIN
                            OPEN Output_Data FOR SELECT DISTINCT
                                                     pt."ProjectId",
                                                     pt."ProjectName",
                                                     (
                                                         SELECT
                                                             COUNT(*)
                                                         FROM
                                                             "BuildingInformation" bt
                                                         WHERE
                                                                 bt."ProjectId" = pt."ProjectId"
                                                             AND bt."IsDelete" = 'N'
                                                     )                                              AS BuildingsCount,
                                                     pt."Address1",
                                                     pt."City",
                                                     pt."State",
                                                     pt."Country",
                                                     pt."Price",
                                                     pt."UserRoleId",
                                                     CASE
                                                         WHEN "ProjectBuildingType" = 1  THEN
                                                             'Express'
                                                         WHEN "ProjectBuildingType" = 2  THEN
                                                             'Standard'
                                                         ELSE
                                                             ''
                                                     END                                            AS "ProjectBuildingType",
                                                     "ProjectStage",
                                                     to_char("ExpiryDate", 'MM/DD/YYYY')            AS "ExpiryDate",
                                                     to_char(pt."CreatedDate", 'MM/DD/YYYY')        AS "CreatedDate",
                                                     "ReportPath",
                                                     "CADDrawingPath",
                                                     "IsArchive"
                                                 FROM
                                                     "Project" pt
                                                 WHERE
                                                         pt."IsDelete" = 'N'
                                                     AND pt."CustomerNo" = CustomerNo
                                                     AND pt."CompanyId" = CompanyId
                                                     AND ( ( ProjectStage IS NOT NULL
                                                             AND pt."ProjectStage" = ProjectStage )
                                                           OR ( ProjectStage IS NULL
                                                                AND 1 = 1 ) )
                                                 ORDER BY
                                                     "ProjectName";
                        END;
                    ELSE
                        BEGIN
                            OPEN Output_Data FOR SELECT DISTINCT
                                                     pt."ProjectId",
                                                     pt."ProjectName",
                                                     (
                                                         SELECT
                                                             COUNT(*)
                                                         FROM
                                                             "BuildingInformation" bt
                                                         WHERE
                                                                 bt."ProjectId" = pt."ProjectId"
                                                             AND bt."IsDelete" = 'N'
                                                     )                                              AS BuildingsCount,
                                                     pt."Address1",
                                                     pt."City",
                                                     pt."State",
                                                     pt."Country",
                                                     pt."Price",
                                                     pt."UserRoleId",
                                                     CASE
                                                         WHEN "ProjectBuildingType" = 1  THEN
                                                             'Express'
                                                         WHEN "ProjectBuildingType" = 2  THEN
                                                             'Standard'
                                                         ELSE
                                                             ''
                                                     END                                            AS "ProjectBuildingType",
                                                     "ProjectStage",
                                                     to_char("ExpiryDate", 'MM/DD/YYYY')            AS "ExpiryDate",
                                                     to_char(pt."CreatedDate", 'MM/DD/YYYY')        AS "CreatedDate",
                                                     "ReportPath",
                                                     "CADDrawingPath",
                                                     "IsArchive"
                                                 FROM
                                                          "Project" pt
                                                     INNER JOIN "USR_UserDetail" ur ON ur."UserId" = pt."UserId"
                                                                                       AND ur."UserDetailId" = UserDetailId
                                                                                       AND pt."CompanyId" = CompanyId
                                                                                       AND ur."CustomerNo" = CustomerNo
                                                 WHERE
                                                         pt."IsDelete" = 'N'
                                                     AND ( ( ProjectStage IS NOT NULL
                                                             AND pt."ProjectStage" = ProjectStage )
                                                           OR ( ProjectStage IS NULL
                                                                AND 1 = 1 ) )
                                                 ORDER BY
                                                     "ProjectName";
                        END;
                    END IF;
                END;
            ELSE
                BEGIN
                    WITH cte (
                        "RoleId",
                        "RoleName",
                        "ParentId"
                    ) AS (
                        SELECT
                            "RoleId",
                            "RoleName",
                            "ParentId"
                        FROM
                            "RoleMaster"
                        WHERE
                            "RoleId" in (1,9)
                        UNION ALL
                        SELECT
                            R."RoleId",
                            R."RoleName",
                            R."ParentId"
                        FROM
                                 "RoleMaster" R
                            JOIN cte ON cte."RoleId" = R."ParentId"
                    )
                    SELECT
                        COUNT(*)
                    INTO PermissionCount
                    FROM
                             cte c
                        INNER JOIN "PermissionTransaction"      PT ON PT."RoleId" = c."RoleId"
                        INNER JOIN "USR_Brand_PermissionGroup"  PG ON PG."PermissionGroupId" = PT."PermissionId"
                                                                     AND PG."BrandId" = CompanyId
                                                                     AND PG."UserDetailId" = UserDetailId;
                    OPEN Output_Data FOR SELECT
                                            *
                                        FROM
                                            (
                                                SELECT
                                                    pt."ProjectId",
                                                    pt."ProjectName",
                                                    (
                                                        SELECT
                                                            COUNT(*)
                                                        FROM
                                                            "BuildingInformation" bt
                                                        WHERE
                                                                bt."ProjectId" = pt."ProjectId"
                                                            AND bt."IsDelete" = 'N'
                                                    )                                              AS BuildingsCount,
                                                    pt."Address1",
                                                      pt."City",
                                                    pt."State",
                                                    pt."Country",
                                                    pt."Price",
                                                    pt."UserRoleId",
                                                    CASE
                                                        WHEN "ProjectBuildingType" = 1  THEN
                                                            'Express'
                                                        WHEN "ProjectBuildingType" = 2  THEN
                                                            'Standard'
                                                        ELSE
                                                            ''
                                                    END                                            AS "ProjectBuildingType",
                                                    "ProjectStage",
                                                    to_char("ExpiryDate", 'MM/DD/YYYY')            AS "ExpiryDate",
                                                    to_char(pt."CreatedDate", 'MM/DD/YYYY')        AS "CreatedDate",
                                                    "ReportPath",
                                                    "CADDrawingPath",
                                                    "IsArchive"
                                                FROM
                                                         "Project" pt
                                                    INNER JOIN "USR_Brand_Customer"  uc ON uc."BrandId" = CompanyId
                                                                                          AND uc."UserDetailId" = UserDetailId
                                                    LEFT JOIN "Customer"            c ON c."CustomerID" = uc."CustomerId"
                                                WHERE
                                                        pt."IsDelete" = 'N'
                                                    AND pt."CompanyId" = CompanyId
                                                    AND ( pt."CustomerNo" = c."CustomerNo"
                                                          OR ( PermissionCount > 0
                                                               --AND pt."CustomerNo" = 0
                                                               AND
                                                               1 = 1 ) )
                                                    AND ( ( ProjectStage IS NOT NULL
                                                            AND pt."ProjectStage" = ProjectStage )
                                                          OR ( ProjectStage IS NULL
                                                               AND 1 = 1 ) )
                                                UNION
                                                SELECT
                                                    pt."ProjectId",
                                                    pt."ProjectName",
                                                    (
                                                        SELECT
                                                            COUNT(*)
                                                        FROM
                                                            "BuildingInformation" bt
                                                        WHERE
                                                                bt."ProjectId" = pt."ProjectId"
                                                            AND bt."IsDelete" = 'N'
                                                    )                                              AS BuildingsCount,
                                                    pt."Address1",
                                                    pt."City",
                                                    pt."State",
                                                    pt."Country",
                                                    pt."Price",
                                                    pt."UserRoleId",
                                                    CASE
                                                        WHEN "ProjectBuildingType" = 1  THEN
                                                            'Express'
                                                        WHEN "ProjectBuildingType" = 2  THEN
                                                            'Standard'
                                                        ELSE
                                                            ''
                                                    END                                            AS "ProjectBuildingType",
                                                    "ProjectStage",
                                                    to_char("ExpiryDate", 'MM/DD/YYYY')            AS "ExpiryDate",
                                                    to_char(pt."CreatedDate", 'MM/DD/YYYY')        AS "CreatedDate",
                                                    "ReportPath",
                                                    "CADDrawingPath",
                                                    "IsArchive"
                                                FROM
                                                    "Project" pt
                                                WHERE
                                                        pt."IsDelete" = 'N'
                                                    AND pt."CompanyId" = CompanyId
                                                    AND pt."UserId" = UserId
                                                    AND ( ( ProjectStage IS NOT NULL
                                                            AND pt."ProjectStage" = ProjectStage )
                                                          OR ( ProjectStage IS NULL
                                                               AND 1 = 1 ) )
                                            ) t
                                        ORDER BY
                                            t."ProjectName";
                END;
            END IF;
        END;
    END IF;
    
    /*     OPEN Output_Data FOR  
     SELECT 
            DISTINCT pt."ProjectId",
            pt."ProjectName",
            (SELECT count(*) from "BuildingInformation" bt where bt."ProjectId" = pt."ProjectId" and bt."IsDelete"='N') As BuildingsCount,
            pt."Address1",
            pt."Price",
            0 AS "RoleId"
    FROM "Project" pt where pt."IsDelete"='N' --and ("UserId"=UserId or ("CustomerNo" in (select "CustomerNo"  FROM  "USR_Brand_Customer"  
                            --inner join "Customer" on "CustomerID" = "CustomerId" and "BrandId" = CompanyId and "UserDetailId"=UserDetailId))) 
    order by "ProjectName";   */
END BUILDINGINFORMATIONPROJECT_LIST;
/