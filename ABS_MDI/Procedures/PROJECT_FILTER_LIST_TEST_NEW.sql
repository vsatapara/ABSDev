CREATE OR REPLACE PROCEDURE abs_mdi."PROJECT_FILTER_LIST_TEST_NEW" 
(
    StartDate     IN   VARCHAR2,
    EndDate       IN   VARCHAR2,
    SearchText    IN   VARCHAR2 DEFAULT NULL,
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
                                                     "IsArchive",
                                                     bi."BuildingInformationId",
                                                     bi."BuildingLabel",
                                                     CONCAT(bi."BuildingName",(
                                                         CASE bi."Structure"
                                                         WHEN 'E'  THEN
                                                             ' (Existing)'
                                                         WHEN 'F'  THEN
                                                             ' (Future)'
                                                         ELSE
                                                             ''
                                                         END
                                                     ))   AS "BuildingName",
													 bi."FrameType",
													 bi."ProjectId",
													 G."BuildingLength",
													 G."BuildingWidth",
													 CASE bi."Elevation"
														 WHEN 'S' THEN
																 CASE
																	 WHEN G."EaveHeightSideWallC" > G."EaveHeightSideWallA" THEN
																		 G."EaveHeightSideWallC"
																	 ELSE
																		 G."EaveHeightSideWallA"
																 END
														 ELSE
															 CASE
																 WHEN G."EaveHeightSideWallB" > G."EaveHeightSideWallD" THEN
																		 G."EaveHeightSideWallB"
																 ELSE
																	 G."EaveHeightSideWallD"
															 END
													 END  AS "BuildingHeight"
                                                 FROM
                                                     "Project" pt
                                                 LEFT JOIN "BuildingInformation" bi ON bi."ProjectId" = pt."ProjectId" AND bi."IsDelete" != 'Y'
                                                 LEFT OUTER JOIN "GeometryInformation"  G ON bi."BuildingInformationId" = G."BuildingInformationId"    
                                                 WHERE
                                                         pt."IsDelete" = 'N'
                                                     AND pt."CustomerNo" = CustomerNo
                                                     AND pt."CompanyId" = CompanyId
                                                     AND ( ( ProjectStage IS NOT NULL
                                                             AND pt."ProjectStage" = ProjectStage )
                                                           OR ( ProjectStage IS NULL
                                                                AND 1 = 1 ) )
                                                     and pt."CreatedDate" >= TO_TIMESTAMP (StartDate, 'MM/DD/YYYY') AND pt."CreatedDate" <= TO_TIMESTAMP (EndDate, 'MM/DD/YYYY') + INTERVAL '1' DAY
                                                 ORDER BY
                                                     "ProjectName",
                                                     bi."BuildingLabel";
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
                                                     "IsArchive",
                                                     bi."BuildingInformationId",
                                                     bi."BuildingLabel",
                                                     CONCAT(bi."BuildingName",(
                                                         CASE bi."Structure"
                                                         WHEN 'E'  THEN
                                                             ' (Existing)'
                                                         WHEN 'F'  THEN
                                                             ' (Future)'
                                                         ELSE
                                                             ''
                                                         END
                                                     ))   AS "BuildingName",
													 bi."FrameType",
													 bi."ProjectId",
													 G."BuildingLength",
													 G."BuildingWidth",
													 CASE bi."Elevation"
														 WHEN 'S' THEN
																 CASE
																	 WHEN G."EaveHeightSideWallC" > G."EaveHeightSideWallA" THEN
																		 G."EaveHeightSideWallC"
																	 ELSE
																		 G."EaveHeightSideWallA"
																 END
														 ELSE
															 CASE
																 WHEN G."EaveHeightSideWallB" > G."EaveHeightSideWallD" THEN
																		 G."EaveHeightSideWallB"
																 ELSE
																	 G."EaveHeightSideWallD"
															 END
													 END  AS "BuildingHeight"                                                     
                                                 FROM
                                                          "Project" pt
                                                     INNER JOIN "USR_UserDetail" ur ON ur."UserId" = pt."UserId"
                                                                                       AND ur."UserDetailId" = UserDetailId
                                                                                       AND pt."CompanyId" = CompanyId
                                                                                       AND ur."CustomerNo" = CustomerNo
                                                 LEFT JOIN "BuildingInformation" bi ON bi."ProjectId" = pt."ProjectId" AND bi."IsDelete" != 'Y'
                                                 LEFT OUTER JOIN "GeometryInformation"  G ON bi."BuildingInformationId" = G."BuildingInformationId"                                                                                       
                                                 WHERE
                                                         pt."IsDelete" = 'N'
                                                     AND ( ( ProjectStage IS NOT NULL
                                                             AND pt."ProjectStage" = ProjectStage )
                                                           OR ( ProjectStage IS NULL
                                                                AND 1 = 1 ) )
                                                    and pt."CreatedDate" >= TO_TIMESTAMP (StartDate, 'MM/DD/YYYY') AND pt."CreatedDate" <= TO_TIMESTAMP (EndDate, 'MM/DD/YYYY')+ INTERVAL '1' DAY
                                                 ORDER BY
                                                     "ProjectName",
                                                     bi."BuildingLabel";
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
                                                        WHEN pt."ProjectBuildingType" = 1  THEN
                                                            'Express'
                                                        WHEN pt."ProjectBuildingType" = 2  THEN
                                                            'Standard'
                                                        ELSE
                                                            ''
                                                    END                                            AS "ProjectBuildingType",
                                                    pt."ProjectStage",
                                                    to_char(pt."ExpiryDate", 'MM/DD/YYYY')            AS "ExpiryDate",
                                                    to_char(pt."CreatedDate", 'MM/DD/YYYY')        AS "CreatedDate",
                                                    pt."ReportPath",
                                                    pt."CADDrawingPath",
                                                    pt."IsArchive",
                                                     bi."BuildingInformationId",
                                                     bi."BuildingLabel",
                                                     CONCAT(bi."BuildingName",(
                                                         CASE bi."Structure"
                                                         WHEN 'E'  THEN
                                                             ' (Existing)'
                                                         WHEN 'F'  THEN
                                                             ' (Future)'
                                                         ELSE
                                                             ''
                                                         END
                                                     ))   AS "BuildingName",
													 bi."FrameType",
													 bi."ProjectId" AS "ProjectId1",
													 G."BuildingLength",
													 G."BuildingWidth",
													 CASE bi."Elevation"
														 WHEN 'S' THEN
																 CASE
																	 WHEN G."EaveHeightSideWallC" > G."EaveHeightSideWallA" THEN
																		 G."EaveHeightSideWallC"
																	 ELSE
																		 G."EaveHeightSideWallA"
																 END
														 ELSE
															 CASE
																 WHEN G."EaveHeightSideWallB" > G."EaveHeightSideWallD" THEN
																		 G."EaveHeightSideWallB"
																 ELSE
																	 G."EaveHeightSideWallD"
															 END
													 END  AS "BuildingHeight"                                                    
                                                FROM
                                                         "Project" pt
                                                    INNER JOIN "USR_Brand_Customer"  uc ON uc."BrandId" = CompanyId
                                                                                          AND uc."UserDetailId" = UserDetailId
                                                    LEFT JOIN "Customer"            c ON c."CustomerID" = uc."CustomerId"
                                                 LEFT JOIN "BuildingInformation" bi ON bi."ProjectId" = pt."ProjectId" AND bi."IsDelete" != 'Y'
                                                 LEFT OUTER JOIN "GeometryInformation"  G ON bi."BuildingInformationId" = G."BuildingInformationId"                                                    
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
                                                    and pt."CreatedDate" >= TO_TIMESTAMP (StartDate, 'MM/DD/YYYY') AND pt."CreatedDate" <= TO_TIMESTAMP (EndDate, 'MM/DD/YYYY')+ INTERVAL '1' DAY
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
                                                        WHEN pt."ProjectBuildingType" = 1  THEN
                                                            'Express'
                                                        WHEN pt."ProjectBuildingType" = 2  THEN
                                                            'Standard'
                                                        ELSE
                                                            ''
                                                    END                                            AS "ProjectBuildingType",
                                                    pt."ProjectStage",
                                                    to_char(pt."ExpiryDate", 'MM/DD/YYYY')            AS "ExpiryDate",
                                                    to_char(pt."CreatedDate", 'MM/DD/YYYY')        AS "CreatedDate",
                                                    pt."ReportPath",
                                                    pt."CADDrawingPath",
                                                    pt."IsArchive",
                                                     bi."BuildingInformationId",
                                                     bi."BuildingLabel",
                                                     CONCAT(bi."BuildingName",(
                                                         CASE bi."Structure"
                                                         WHEN 'E'  THEN
                                                             ' (Existing)'
                                                         WHEN 'F'  THEN
                                                             ' (Future)'
                                                         ELSE
                                                             ''
                                                         END
                                                     ))   AS "BuildingName",
													 bi."FrameType",
													 bi."ProjectId" AS "ProjectId1",
													 G."BuildingLength",
													 G."BuildingWidth",
													 CASE bi."Elevation"
														 WHEN 'S' THEN
																 CASE
																	 WHEN G."EaveHeightSideWallC" > G."EaveHeightSideWallA" THEN
																		 G."EaveHeightSideWallC"
																	 ELSE
																		 G."EaveHeightSideWallA"
																 END
														 ELSE
															 CASE
																 WHEN G."EaveHeightSideWallB" > G."EaveHeightSideWallD" THEN
																		 G."EaveHeightSideWallB"
																 ELSE
																	 G."EaveHeightSideWallD"
															 END
													 END  AS "BuildingHeight"                                                    
                                                FROM
                                                    "Project" pt
                                                 LEFT JOIN "BuildingInformation" bi ON bi."ProjectId" = pt."ProjectId" AND bi."IsDelete" != 'Y'
                                                 LEFT OUTER JOIN "GeometryInformation"  G ON bi."BuildingInformationId" = G."BuildingInformationId"                                                    
                                                WHERE
                                                        pt."IsDelete" = 'N'
                                                    AND pt."CompanyId" = CompanyId
                                                    AND pt."UserId" = UserId
                                                    AND ( ( ProjectStage IS NOT NULL
                                                            AND pt."ProjectStage" = ProjectStage )
                                                          OR ( ProjectStage IS NULL
                                                               AND 1 = 1 ) )
                                                    and pt."CreatedDate" >= TO_TIMESTAMP (StartDate, 'MM/DD/YYYY') AND pt."CreatedDate" <= TO_TIMESTAMP (EndDate, 'MM/DD/YYYY')+ INTERVAL '1' DAY
                                            ) t
                                        ORDER BY
                                            t."ProjectName",
                                            t."BuildingLabel";
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

END PROJECT_FILTER_LIST_TEST_NEW;
/